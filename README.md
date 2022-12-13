# Install Argo Workflows

Inspired by [this article](https://argoproj.github.io/argo-workflows/quick-start/)

## What is Argo Workflows

Argo Workflows is a container-native workflow engine for orchestrating parallel jobs on Kubernetes. It is implemented as a Kubernetes CRD (Custom Resource Definition).

## What is Argo Workflows used for

* Run CI/CD pipelines
* Run ML pipelines
* Run ETL pipelines
* Run data processing pipelines
* Run any type of pipelines

## What is Argo Workflows not used for

* Run a single job
* Run a single container

## Quick install for person in a hurry (install k3d/k3s, kubectl, argo-workflows)

>```bash
>bash install-argo-workflows.sh
>```

## Install for person who wants to know what is going on
>
>### Prerequisites
>
>* [Kubernetes](install-k8s.md) cluster (if you don't have one, you can use [k3d](install-k8s.md))
>* [Kubectl](install-kubectl.md) installed (if you don't have this cli, you can use [kubectl install](install-kubectl.md))
>
>### Install Argo Workflows on a Kubernetes cluster
>
>```bash
>kubectl create namespace argo
>kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/download/v3.3.10/install.yaml
>```
>
>### How to test Argo Workflows
>
>```bash
>kubectl -n argo port-forward deployment/argo-server 2746:2746
>```
>
>### Open argo-server authentication
>
>```bash
>kubectl patch deployment \
>
>  argo-server \
>  --namespace argo \
>  --type='json' \
>  -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/args", "value": [
>  "server",
>  "--auth-mode=server"
>]}]'
>```
>
>### How to test access Argo Workflows UI
>
>```bash
>https://localhost:2746
>```
>
## LoadBalancer service
If you want to access Argo Workflows UI from outside your cluster, you can use a LoadBalancer service.
Warning: this is not a production ready configuration (you should use for example an ingress controller)

```bash
kubectl patch svc argo-server -n argo -p '{"spec": {"type": "LoadBalancer"}}'
```

## Argo CLI installation on Mac OS

```bash
curl -sLO https://github.com/argoproj/argo-workflows/releases/download/v3.3.10/argo-darwin-amd64.gz
gunzip argo-darwin-amd64.gz
chmod +x argo-darwin-amd64
mv ./argo-darwin-amd64 /usr/local/bin/argo
```

## Argo CLI installation on Linux

```bash
curl -sLO https://github.com/argoproj/argo-workflows/releases/download/v3.3.10/argo-linux-amd64.gz
gunzip argo-linux-amd64.gz
chmod +x argo-linux-amd64
mv ./argo-linux-amd64 /usr/local/bin/argo
```

## Next Step on securing Argo Workflows

* [Argo Workflows authentication](https://argoproj.github.io/argo-workflows/argo-server-auth-mode/)
* [Argo Workflows RBAC](https://argoproj.github.io/argo-workflows/workflow-rbac/)

## Next Step on using Argo Workflows

* [Argo Workflows Catalog](https://github.com/argoproj-labs/argo-workflows-catalog)
* [Argo Workflows Plugin Directory](https://argoproj.github.io/argo-workflows/plugin-directory/)
