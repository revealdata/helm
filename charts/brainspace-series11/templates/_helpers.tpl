{{- define "resources.values.out" -}}
{{/* output resource requests for pod templates */}}
    {{- range $name, $value := . }}
    {{ $name }}: {{ $value | quote }}
    {{- end }} 
{{- end -}}

{{- define "resources.values" -}}
{{/* Generate resource requests for pod templates */}}
{{- $cpu := 8 -}}
{{- $memory := 62 -}}

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
{{/* Set the memory and cpu values used in calculations */}}
{{- $memory := .resources.memory | default 62 | int -}}
{{- $cpu_cores := .resources.cpu | default 8 | int -}}
{{- $max_percent := .jvmMemory.MaxRAMPercentage | int -}}

{{/* Helm only does math on integers so multiply, then divide */}}
{{/* Catalina memory = container memory less 10% */}}
{{- $catalina_memory := div (mul $memory $max_percent) 100 -}}
{{/* BatchTools memory = container memory less 10% with 2G reserved */}}
{{- $bt_memory := sub  $catalina_memory 2 -}}

    {{- if contains "application" .image -}}
        {{ $env := dict "CATALINA_OPTS" (printf "-XX:MaxMetaspaceSize=256m -Xmx%dg" $catalina_memory) }}
        {{ include "java.resources.values.out" $env }}
    {{- end -}}

    {{- if contains "analytics" .image -}}
        {{ $env := dict "BT_HEAP_MAX" (printf "%dg" $bt_memory) }}
        {{- include "java.resources.values.out" $env }}
    {{- end -}}
{{- end -}}

{{- define "secrets.env" -}}
{{/* output env vars for secrets that have an envVar defined */}}
{{- range .Values.secrets.secretDefinitions }}
{{- $eksSecretName := .eksSecretName }}
{{- range .data }}
{{- $defaults := index $.Values.defaults.secrets .secretKey }}
  {{- if or .envVar $defaults.envVar }}
    - name: {{ .envVar | default $defaults.envVar | quote }}
      valueFrom:
        secretKeyRef:
          name: {{ $eksSecretName }}
          key: {{ .secretKey }}
  {{- end }}

{{- end -}}
{{- end -}}
{{- end -}}

{{- define "secrets.volumes" -}}
{{/* output volumes for secrets that have a volume defined */}}
{{- range .Values.secrets.secretDefinitions }}
{{- $eksSecretName := .eksSecretName }}
{{- range .data }}
{{- $defaults := index $.Values.defaults.secrets .secretKey }}
{{- $values := deepCopy . | mergeOverwrite (deepCopy $defaults) }}
{{- if $values.volume }}
- name: {{ $values.volume }}
  secret:
    secretName: {{ $eksSecretName }}
    {{- if hasKey $values "optional" }}
    optional: {{ $values.optional}}
    {{- else }}
    optional: false
    {{- end }}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "secrets.volumes.mounts" -}}
{{/* output volume mounts for secrets that have a volume defined */}}
{{- range .Values.secrets.secretDefinitions }}
{{- $eksSecretName := .eksSecretName }}
{{- range .data }}
{{- $defaults := index $.Values.defaults.secrets .secretKey }}
{{- $values := deepCopy . | mergeOverwrite (deepCopy $defaults) }}
{{- if and $values.volume $values.mountPath }}
- name: {{ $values.volume | default $defaults.volume }}
  mountPath: {{ $values.mountPath | default $defaults.mountPath }}
  {{- if hasKey $values "readOnly" }}
  readOnly: {{ $values.readOnly }}
  {{- else }}
  readOnly: true 
  {{- end }}
{{- end }}
{{- end -}}
{{- end -}}
{{- end -}}