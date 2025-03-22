# Notes on K3b

## SSH into a container

```bash
kubectl get pods -A
kubectl exec -n NAMESPACE --stdin --tty PODNAME -- /bin/bash
```