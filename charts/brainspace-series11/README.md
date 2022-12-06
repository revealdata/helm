# Helm Chart Usage Notes

## References
- https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.1/guide/ingress/annotations/
- https://github.com/kubernetes/cloud-provider-aws
- https://github.com/aws-controllers-k8s/community
- https://github.com/external-secrets/external-secrets
- https://kubernetes.io/docs/concepts/configuration/secret/#using-secrets-as-environment-variables
- https://github.com/kubernetes-sigs/external-dns

## HELM
### Examples
```bash
helm install  brains70-preprod brainspace-series11 --values ./brainspace-series11/values/brains70-preprod.yaml 
helm upgrade brains70-preprod brainspace-series11 --values ./brainspace-series11/values/brains70-preprod.yaml 

helm uninstall brains70-preprod
helm delete brains70-preprod
```

## Values
The values.yaml includes documentation comments throughout

## Configuration
### Secrets
#### Brainspace License
The Brainspace license can be set via a kubernetes secret. The secret name is set in the values.yaml file. The secret must be created in the same namespace as the helm chart. The secret must contain a key named `brainspace_license.txt` with the license value as the value.

The location and name of the secret can be changed in the values.yaml file using an environment variable.
`LICENSE_SECRET_FILE` - The location of the secret file. The default is `/mnt/secrets/brainspace/brainspace_license.txt`

#### Brainspace Properties (config)
The Brainspace properties can be set via a kubernetes secret. The secret name is set in the values.yaml file. The secret must be created in the same namespace as the helm chart. The secret must contain a key named `brainspace.properties` or `analysis.properties` (depending on the server role). with the properties value as the value.

The location and name of the secret can be changed in the values.yaml file using an environment variable.
`PROPERTIES_SECRET_FILE` - The location of the secret file. The default for the APP role is `/mnt/secrets/brainspace/brainspace.properties`
`PROPERTIES_SECRET_FILE` - The location of the secret file. The default for the ANALYSIS role is `/mnt/secrets/brainspace/analysis.properties`