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