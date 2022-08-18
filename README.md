# helm-repo
Reveal Brainsapce Helm Repository

## Charts
- reveal-keycloak
- reveal-brainspace

## Usage

### Add the repo to helm
```bash
helm repo add reveal https://revealdata.github.io/helm/
helm repo update
```

### Install a chart from the repo
```bash
helm install reveal-keycloak reveal/reveal-keycloak keycloak --values path/to/values/file
```
```