## Install k8s with k3d (k3s in docker)

```bash
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
```

## Create a k3d cluster named `argo`

```bash
k3d cluster create argo
```

## How to test the access to the cluster with kubectl (if you don't have kubectl, you can install with this [script](install-kubectl.md))

```bash
kubectl get nodes
```