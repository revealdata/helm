{{- define "resources.env.secrets" -}}
{{/* output env vars for Review secrets */}}
    - name: AWS_ACCESS_KEY_ID
      valueFrom:
        secretKeyRef:
          name: reveal-billing-secrets
          key: aws-access-key-id
    - name: AWS_SECRET_ACCESS_KEY
      valueFrom:
        secretKeyRef:
          name: reveal-billing-secrets
          key: aws-secret-access-key
{{- end -}}