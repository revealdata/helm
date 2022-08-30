{{- define "resources.env.secrets" -}}
{{/* output env vars for Review secrets */}}
    - name: databaseServer
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: review-sql-server
    - name: userManagementDB
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: review-user-management-db
    - name: AuthMethod
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: review-sql-auth-method
    - name: SqlUsername
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: review-sql-username
    - name: SqlPassword
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: review-sql-password
    - name: websiteDecryptionKey
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: review-website-decryption-key
    - name: websiteValidationKey
      valueFrom:
        secretKeyRef:
          name: review-secrets
          key: review-website-validation-key
{{- end -}}