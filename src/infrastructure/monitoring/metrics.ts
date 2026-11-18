
import {
  collectDefaultMetrics,
  Histogram,
  Gauge,
  Registry,
} from "prom-client";

// Évite de créer plusieurs registres en développement Next.js (Hot Reload).
const globalForMetrics = globalThis as typeof globalThis & {
  metricsRegistry?: Registry;
  metricsInitialized?: boolean;
};

export const register =
  globalForMetrics.metricsRegistry ?? new Registry();

globalForMetrics.metricsRegistry = register;

// Métriques générales du processus Node.js.
if (!globalForMetrics.metricsInitialized) {
  collectDefaultMetrics({
    register,
    prefix: "go_tekup_",
  });

  globalForMetrics.metricsInitialized = true;
}

// Temps de réponse des requêtes HTTP (en secondes).
export const httpRequestDuration = new Histogram({
  name: "go_tekup_http_request_duration_seconds",
  help: "Temps de réponse des requêtes HTTP en secondes",
  labelNames: ["method", "route", "status_code"] as const,
  registers: [register],
  buckets: [0.01, 0.05, 0.1, 0.3, 0.5, 1, 2, 5],
});

// Nombre de requêtes actuellement en cours.
export const httpRequestsInProgress = new Gauge({
  name: "go_tekup_http_requests_in_progress",
  help: "Nombre de requêtes HTTP actuellement en cours",
  labelNames: ["method"] as const,
  registers: [register],
});
