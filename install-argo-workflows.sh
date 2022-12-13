#!/bin/bash
 
################################################################
##
##   Install Argo Workflows on k3d
##   Written By: Charles de ROMEMONT
##
################################################################

export PATH=/bin:/usr/bin:/usr/local/bin

# Test if docker is installed
if ! docker --version; then
	echo "ERROR: Did Docker get installed?"
	exit 1
fi

# Install k3d
if ! k3d --version; then
    echo "K3d will be installed ..."
    curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
fi

# Create k3d cluster
if ! k3d cluster list | grep -q argo; then
    echo "K3d cluster will be created ..."
    k3d cluster create argo
fi

# Install kubectl
if ! kubectl version --client; then
    echo "Kubectl will be installed ..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
fi

# Install Argo Workflows
kubectl create namespace argo
kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/download/v3.3.10/install.yaml
