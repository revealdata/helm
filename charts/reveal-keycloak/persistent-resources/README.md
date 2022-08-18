# Keycloak Helm Chart
## Persistent Resources
Inside the `persistent-resources` directory there is a Cloud Formation template that will create all the resources needed for a new Keycloak Instance.
The Outputs from the CloudFormation Stack include variables that are required for the helm template Values file.
- DatabaseSecretArn
- KeycloakAdminSecretArn
- RoleArn

### RDS Database
Keycloak requires a relational database. Prior to deploying this helm chart, you need to create an RDS database for Keycloak.
- Type: Aurora PostgreSQL
- Version: 14 (latest)
- Min. Storage: 120G

### Secrets
#### Keycloak Database
Default Secret Name: `keycloak/database/`<dbIdentifier>`/master`

The Secret for the Keycloak database is linked to the RDS instance to support secret rotation.

Parameters:
- username
- password
- engine
- host
- port
- dbname
- dbInstanceIdentifier (added by default when using an RDS secret type)


#### Keycloak Admin
Default Secret Name: `keycloak/user/`<dbIdentifier>`/admin`

The Secret for the Keycloak Admin user must include the following parameters:

Parameters:
 - username
 - password