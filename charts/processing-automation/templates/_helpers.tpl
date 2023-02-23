{{- define "resources.env.secrets" -}}
{{/* output env vars for Review secrets */}}
    - name: AWS_ACCESS_KEY_ID
      valueFrom:
        secretKeyRef:
          name: processing-automation-secrets
          key: aws-access-key-id
    - name: AWS_SECRET_ACCESS_KEY
      valueFrom:
        secretKeyRef:
          name: processing-automation-secrets
          key: aws-secret-access-key
    - name: DATABASE_SERVER
      valueFrom:
        secretKeyRef:
          name: processing-automation-secrets
          key: database-server
    - name: DATABASE_USERNAME
      valueFrom:
        secretKeyRef:
          name: processing-automation-secrets
          key: database-username
    - name: DATABASE_PASSWORD
      valueFrom:
        secretKeyRef:
          name: processing-automation-secrets
          key: database-password

{{- end -}}