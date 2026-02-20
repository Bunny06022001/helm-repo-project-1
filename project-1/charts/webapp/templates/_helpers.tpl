{{/* Name helpers */}}
{{- define "webapp.name" -}}
webapp
{{- end -}}

{{- define "webapp.fullname" -}}
{{ printf "%s-%s" .Release.Name (include "webapp.name" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/* Common labels */}}
{{- define "webapp.labels" -}}
app.kubernetes.io/name: {{ include "webapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: Helm
{{- end -}}
