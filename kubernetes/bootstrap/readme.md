# Bootstrap

## Flux

### Install Flux

```sh
kubectl apply --server-side --kustomize ./kubernetes/bootstrap/flux
```

### Install essential Prometheus Operator CRDs

```sh
export PROMETHEUS_OPERATOR_VERSION=v0.70.0
- kubectl --context {{.cluster}} apply --server-side --filename https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/{{.PROMETHEUS_OPERATOR_VERSION}}/example/prometheus-operator-crd/monitoring.coreos.com_podmonitors.yaml
- kubectl --context {{.cluster}} apply --server-side --filename https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/{{.PROMETHEUS_OPERATOR_VERSION}}/example/prometheus-operator-crd/monitoring.coreos.com_prometheusrules.yaml
- kubectl --context {{.cluster}} apply --server-side --filename https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/{{.PROMETHEUS_OPERATOR_VERSION}}/example/prometheus-operator-crd/monitoring.coreos.com_scrapeconfigs.yaml
- kubectl --context {{.cluster}} apply --server-side --filename https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/{{.PROMETHEUS_OPERATOR_VERSION}}/example/prometheus-operator-crd/monitoring.coreos.com_servicemonitors.yaml
```

### Apply Cluster Configuration

_These cannot be applied with `kubectl` in the regular fashion due to be encrypted with sops_

```sh
sops --decrypt kubernetes/bootstrap/flux/age-key.sops.yaml | kubectl apply -f -
sops --decrypt kubernetes/bootstrap/flux/github-deploy-key.sops.yaml | kubectl apply -f -
sops --decrypt kubernetes/flux/vars/cluster-secrets.sops.yaml | kubectl apply -f -
kubectl apply -f kubernetes/flux/vars/cluster-settings.yaml
```

### Kick off Flux applying this repository

```sh
kubectl apply --server-side --kustomize ./kubernetes/flux/config
```
