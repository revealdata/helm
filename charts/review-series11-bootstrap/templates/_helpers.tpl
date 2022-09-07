{{- define "resources.env.secrets" -}}
{{/* output env vars for Review secrets */}}
    - name: GIT_SSH_KEY
      valueFrom:
        secretKeyRef:
          name: review-bootstrap-secrets
          key: GIT_SSH_KEY
{{- end -}}