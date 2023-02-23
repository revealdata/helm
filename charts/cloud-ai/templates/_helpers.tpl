{{- define "resources.env.secrets" -}}
{{/* output env vars for Review secrets */}}
    - name: AWS_ACCESS_KEY_ID
      valueFrom:
        secretKeyRef:
          name: reveal-cloud-ai-secrets
          key: aws-access-key-id
    - name: AWS_SECRET_ACCESS_KEY
      valueFrom:
        secretKeyRef:
          name: reveal-cloud-ai-secrets
          key: aws-secret-access-key
    - name: mongoPassword
      valueFrom:
        secretKeyRef:
          name: {{ .Values.mongodb.auth.existingSecret }}
          key: mongodb-root-password
{{- end -}}