# Notes on K3b

## SSH into a container

```
kubectl get pods -A
exec -n NAMESPACE --stdin --tty PODNAME -- /bin/bash
```