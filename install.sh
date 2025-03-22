#!/bin/bash

curl -sfL https://get.k3s.io | sh -

# CertManager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.4/cert-manager.crds.yaml

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