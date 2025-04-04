#!/bin/bash

curl -sfL https://get.k3s.io | sh -

# CertManager
kubectl create namespace cert-manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.17.1/cert-manager.yaml

find ./letsencrypt/ -maxdepth 1 -type f -name '*.yml'  -exec kubectl apply -f {} \;

# Jellyfin
mkdir -p /mnt/jellyfin/cache
mkdir -p /mnt/jellyfin/config
mkdir -p /mnt/jellyfin/media
mkdir -p /mnt/jellyfin/vc

kubectl create namespace jellyfin-ns

find ./jellyfin/storage/ -maxdepth 1 -type f -name '*.yml' -exec kubectl apply -f {} \;
find ./jellyfin/ -maxdepth 1 -type f -name '*.yml'  -exec kubectl apply -f {} \;

# Deluge
mkdir -p /mnt/deluge/downloads
mkdir -p /mnt/deluge/config
mkdir -p /mnt/deluge/completed

kubectl create namespace deluge-ns

find ./deluge/storage/ -maxdepth 1 -type f -name '*.yml' -exec kubectl apply -f {} \;
find ./deluge/ -maxdepth 1 -type f -name '*.yml'  -exec kubectl apply -f {} \;

# Monitoring
cd ..
git clone git@github.com:prometheus-operator/kube-prometheus.git
cd ./kube-prometheus/
kubectl apply --server-side -f manifests/setup
kubectl wait \
	--for condition=Established \
	--all CustomResourceDefinition \
	--namespace=monitoring
kubectl apply -f manifests/
cd ../k3s-playground/
kubectl apply -f 