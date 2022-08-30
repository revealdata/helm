{{- define "resources.env.secrets" -}}
{{/* output env vars for Review secrets */}}
    - name: databaseServer
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: databaseServer
    - name: userManagementDB
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: userManagementDB
    - name: AuthMethod
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: AuthMethod
    - name: SqlUsername
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: SqlUsername
    - name: SqlPassword
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: SqlPassword
    - name: websiteDecryptionKey
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: websiteDecryptionKey
    - name: websiteValidationKey
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: websiteValidationKey
{{- end -}}