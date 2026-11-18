
{{/*
Chart name.
*/}}
{{- define "go-tekup-chart.name" -}}
go-tekup
{{- end }}

{{/*
Full resource name.
*/}}
{{- define "go-tekup-chart.fullname" -}}
go-tekup
{{- end }}

{{/*
Common labels.
*/}}
{{- define "go-tekup-chart.labels" -}}
app: go-tekup
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: go-tekup
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels.
Keep the existing Kubernetes selector unchanged.
*/}}
{{- define "go-tekup-chart.selectorLabels" -}}
app: go-tekup
{{- end }}
