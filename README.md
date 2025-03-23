# K3s Learning Playground: Jellyfin & Deluge

This repository serves as a learning environment to explore and master K3s (a lightweight Kubernetes distribution). The main goal is to deploy and manage two applications: Jellyfin (a media server) and Deluge (a BitTorrent client), and monitor them on Grafana (an open and composable observability platform).

## Contents

* **K3s Setup**: Scripts and configurations to install and set up a basic K3s cluster.
* **Jellyfin Deployment**: YAML files to deploy Jellyfin on K3s, including Persistent Volumes and Ingress.
* **Deluge Deployment**: YAML files to deploy Deluge on K3s, with configurations to manage downloads and uploads.
* **Networking**: Ingress and LoadBalancer configuration to expose the services outside the cluster.
* **Documentation**: Notes and guides on the learning process, with examples and best practices.

## Learning Objectives

* Installing and configuring a K3s cluster.
* Deploying applications on Kubernetes using YAML files.
* Managing Persistent Volumes for persistent data.
* Exposing services via Ingress and LoadBalancer.
* Monitoring and managing applications in a Kubernetes environment.

## Requirements

* A Linux environment (preferably Ubuntu) with sudo access.
* k3s binary (installable via provided scripts).
* Access to a container registry (Docker Hub or others).

## Installation

1.  Clone the repository:

    ```bash
    git clone git@github.com:miacono/k3s-playground.git
    cd k3s-playground
    ```

2.  Install K3s using the provided script:

    ```bash
    ./install.sh
    ```

## Usage

* Access Jellyfin via the browser at the address configured in Ingress.
* Access Deluge via the web client at the address configured in Ingress.
* Use kubectl to monitor and manage applications:

    ```bash
    kubectl get pods
    kubectl get services
    kubectl get deployments
    ```

## Contributing

Feel free to contribute to this project with improvements, fixes, or new features. Open an issue or a pull request to discuss changes.

## License

This project is released under the MIT License.

## Acknowledgments

* K3s for its simplicity and lightness.
* Jellyfin and Deluge for their fantastic applications.
* The Kubernetes community for the valuable resources and support.