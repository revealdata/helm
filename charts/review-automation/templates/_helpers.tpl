{{- define "resources.env.secrets" -}}
{{/* output env vars for Review secrets */}}
    - name: task_sql_host
      valueFrom:
        secretKeyRef:
          name: review-automation-secrets
          key: task_sql_host
    - name: task_sql_username
      valueFrom:
        secretKeyRef:
          name: review-automation-secrets
          key: task_sql_username
    - name: task_sql_password
      valueFrom:
        secretKeyRef:
          name: review-automation-secrets
          key: task_sql_password
    - name: rabbitmq_username
      valueFrom:
        secretKeyRef:
            name: review-automation-secrets
            key: rabbitmq_username
    - name: rabbitmq_password
      valueFrom:
        secretKeyRef:
            name: review-automation-secrets
            key: rabbitmq_password
    - name: rabbitmq_url
      valueFrom:
        secretKeyRef:
            name: review-automation-secrets
            key: rabbitmq_url
{{- end -}}
