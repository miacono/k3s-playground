#!/bin/bash

curl -sfL https://get.k3s.io | sh -
kubectl create namespace jellyfin-ns
