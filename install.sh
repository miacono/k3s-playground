#!/bin/bash

curl -sfL https://get.k3s.io | sh -

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

kubectl create namespace deluge-ns

find ./deluge/storage/ -maxdepth 1 -type f -name '*.yml' -exec kubectl apply -f {} \;
find ./deluge/ -maxdepth 1 -type f -name '*.yml'  -exec kubectl apply -f {} \;