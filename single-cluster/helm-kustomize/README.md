# Helm Kustomize Example

This example will deploy the [Kubernetes sample guestbook](https://github.com/kubernetes/examples/tree/master/guestbook/) application as
packaged as a Helm chart downloaded from a third party source and will modify the helm chart using Kustomize.
The app will be deployed into the `fleet-helm-kustomize-example` namespace.

```yaml
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: helm-kustomize
  namespace: fleet-local
spec:
  repo: https://github.com/rancher/fleet-examples
  paths:
  - single-cluster/helm-kustomize
```
