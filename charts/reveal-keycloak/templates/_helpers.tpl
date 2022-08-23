{{- define "resources.env.secrets" -}}
{{/* output env vars for Brainspace secrets */}}
    - name: KEYCLOAK_ADMIN
      valueFrom:
        secretKeyRef:
          name: keycloak-secrets
          key: keycloak_admin_user
    - name: KEYCLOAK_ADMIN_PASSWORD
      valueFrom:
        secretKeyRef:
          name: keycloak-secrets
          key: keycloak_admin_password
    - name: KC_DB_USERNAME
      valueFrom:
        secretKeyRef:
          name: keycloak-secrets
          key: kc_db_username
    - name: KC_DB_PASSWORD
      valueFrom:
        secretKeyRef:
          name: keycloak-secrets
          key: kc_db_password
    - name: KC_DB
      valueFrom:
        secretKeyRef:
          name: keycloak-secrets
          key: kc_db
    - name: KC_DB_URL_HOST
      valueFrom:
        secretKeyRef:
          name: keycloak-secrets
          key: kc_db_url_host
    - name: KC_DB_URL_DATABASE
      valueFrom:
        secretKeyRef:
          name: keycloak-secrets
          key: kc_db_url_database
{{- end -}}