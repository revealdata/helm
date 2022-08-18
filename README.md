# helm-repo
Reveal-Brainsapce Public Helm Repository

## Charts
- reveal-keycloak
  - [values-template.yaml](https://github.com/revealdata/helm/blob/main/charts/brainspace-series11/values-template.yaml)
- brainspace-series11
  - [values-template.yaml](https://github.com/revealdata/helm/blob/main/charts/reveal-keycloak/values-template.yaml)

## Usage
1. Review the `values-template.yaml` file for the chart you intend to deploy.
1. Create the necessary persistent resources required (Database, Storage, Etc.).
1. Create a `values.yaml` file with the settings for your deployment.
1. Install the helm chart to your Kubernetes Cluster

### Add the repo to helm
```bash
helm repo add reveal https://revealdata.github.io/helm/
helm repo update
```

### Install a chart from the repo
```bash
helm install reveal-keycloak reveal/reveal-keycloak --values path/to/values/file
```

## Kubernetes Setup
### Operators and CSI Drivers
1. [secret-store-csi](https://secrets-store-csi-driver.sigs.k8s.io)
1. [external-secrets](https://external-secrets.io/v0.5.9/)
1. [external-dns](https://github.com/kubernetes-sigs/external-dns)
    - [AWS](https://aws.amazon.com/premiumsupport/knowledge-center/eks-set-up-externaldns/)
    - [Azure](https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/azure.md)
1. [AWS ebs-csi](https://docs.aws.amazon.com/eks/latest/userguide/managing-ebs-csi.html)
1. [AWS efs-csi](https://docs.aws.amazon.com/eks/latest/userguide/efs-csi.html)
1. [AWS Elastic Load Balancer Controller](https://kubernetes-sigs.github.io/aws-load-balancer-controller)