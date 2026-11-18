
import { timingSafeEqual } from "node:crypto";
import { register } from "@/infrastructure/monitoring/metrics";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET(request: Request) {
  const metricsToken = process.env.METRICS_TOKEN;

  // Refuser l'accès si le token n'est pas configuré.
  if (!metricsToken) {
    return new Response("Metrics authentication is not configured", {
      status: 503,
    });
  }

  const authorization = request.headers.get("authorization") ?? "";
  const expected = Buffer.from(`Bearer ${metricsToken}`);
  const received = Buffer.from(authorization);

  const authorized =
    expected.length === received.length &&
    timingSafeEqual(expected, received);

  if (!authorized) {
    return new Response("Unauthorized", {
      status: 401,
    });
  }

  try {
    const metrics = await register.metrics();

    return new Response(metrics, {
      status: 200,
      headers: {
        "Content-Type": register.contentType,
        "Cache-Control": "no-store",
      },
    });
  } catch {
    return new Response("Unable to collect metrics", {
      status: 500,
    });
  }
}
