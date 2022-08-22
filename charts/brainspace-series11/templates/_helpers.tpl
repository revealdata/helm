{{- define "resources.values.out" -}}
{{/* output resource requests for pod templates */}}
    {{- range $name, $value := . }}
    {{ $name }}: {{ $value | quote }}
    {{- end }} 
{{- end -}}

{{- define "resources.values" -}}
{{/* Generate resource requests for pod templates */}}
{{- $cpu := 2 -}}
{{- $memory := 8 -}}

{{- $res_cpu := dict "cpu" (printf "%d000m" ($cpu | int)) -}}
{{- $res_mem := dict "memory" (printf "%dGi" ($memory | int)) -}}
    {{- if .resources -}}
      {{- if .resources.cpu -}}
      {{- $cpu := .resources.cpu | int -}}
        {{- $res_cpu := dict "cpu" (printf "%d000m" ($cpu | int)) -}}
        {{- include "resources.values.out" $res_cpu }}
      {{- else -}}
        {{- include "resources.values.out" $res_cpu }}
      {{- end -}}
      {{- if .resources.memory -}}
      {{- $memory := .resources.memory | int -}}
        {{ $res_mem := dict "memory" (printf "%dGi" ($memory | int)) }}
        {{- include "resources.values.out" $res_mem }}
      {{- else -}}
        {{- include "resources.values.out" $res_mem }}
      {{- end -}}
    {{- else -}}
      {{- include "resources.values.out" $res_cpu }}
      {{- include "resources.values.out" $res_mem }}
    {{- end -}}
{{- end }}

{{- define "java.resources.values.out" -}}
{{/* output resource requests for pod java env vars */}}
  {{- range $name, $value := . }}
    - name: {{ $name }} 
      value: {{ $value | quote }}
  {{- end }} 
{{- end -}}

{{- define "java.resources.values" -}}
{{/* Generate resource requests for pod java env vars */}}
{{- $memory := 8 -}}

    {{- if contains "application" .image -}}
        {{ $env := dict "CATALINA_OPTS" (printf "-Xmx%dg" ($memory | int)) }}

        {{- if .resources -}}
        {{- if .resources.memory -}}
        {{ $env := dict "CATALINA_OPTS" (printf "-Xmx%dg" (.resources.memory | int)) }}
        {{- include "java.resources.values.out" $env }}
        {{- else -}}
        {{- include "java.resources.values.out" $env }}
        {{- end -}}
        {{- else -}}
        {{ include "java.resources.values.out" $env }}
        {{- end -}}
    {{- end -}}

    {{- if contains "analytics" .image -}}
        {{ $env := dict "BT_HEAP_MAX" (printf "%dg" ((sub $memory 1) | int)) }}
        {{- if .resources -}}
        {{- if .resources.memory -}}
        {{ $env := dict "BT_HEAP_MAX" (printf "%dg" ((sub .resources.memory 1) | int)) }}
        {{- include "java.resources.values.out" $env }}
        {{- else -}}
        {{- include "java.resources.values.out" $env }}
        {{- end -}}
        {{- else -}}
        {{- include "java.resources.values.out" $env }}
        {{- end -}}
    {{- end -}}

{{- end -}}

{{- define "resources.env.secrets" -}}
{{/* output env vars for Brainspace secrets */}}
    - name: POSTGRES_USER
      valueFrom:
        secretKeyRef:
          name: brainspace-secrets
          key: brainspace_db_user
    - name: POSTGRES_PASSWORD
      valueFrom:
        secretKeyRef:
          name: brainspace-secrets
          key: brainspace_db_password
    - name: PGPASSWORD
      valueFrom:
          secretKeyRef:
            name: brainspace-secrets
            key: brainspace_db_password
    - name: POSTGRES_HOST
      valueFrom:
        secretKeyRef:
          name: brainspace-secrets
          key: brainspace_db_host
    - name: POSTGRES_PORT
      valueFrom:
        secretKeyRef:
          name: brainspace-secrets
          key: brainspace_db_port
    - name: POSTGRES_DB
      valueFrom:
        secretKeyRef:
          name: brainspace-secrets
          key: brainspace_db_name
{{- end -}}