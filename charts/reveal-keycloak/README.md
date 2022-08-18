# Keycloak Helm Chart

## Description
Keycloak helm deployment for Kubernetes.

## References
- https://www.keycloak.org/guides#server

## Deployments
### Keycloak
Creates `N` number of Keycloak >v.17 pods with shared state. All database and Admin user credentials from AWS Secrets Manager.

### Keycloak Proxy
Creates `N` number of pods running the Reveal [docker-nginx-proxy](https://github.com/PureDiscovery/docker-nginx-proxy) utilizing the `keycloak` built-in template. The `keycloak` template includes a rewrite for the `/auth` URI used in versions prior to 17 for backwards compatibility with Reveal Review.


## Secrets
## Keycloak Admin (admin)
The Secret for the Keycloak Admin user must include the following parameters:
 - username
 - password

## Keycloak Database (database)
The Secret for the Keycloak Database must include the following parameters:
- engine
- host
- port (optional)
- dbname
- username
- password
