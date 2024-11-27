# Hardened Example

This example will deploy the [Kubernetes sample guestbook](https://github.com/kubernetes/examples/tree/master/guestbook/) application, with modifications to securityContext which allow its deployment on a hardened cluster. 
The app will be deployed into the `default` namespace. Note that you must have added the `default` namespace to the PSA to allow deployments to this namespace. 

```yaml
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: simple
  namespace: fleet-local
spec:
  repo: https://github.com/rancher/fleet-examples
  paths:
  - hardened
```
