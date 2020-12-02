# Simple Example

This example will deploy the [Kubernetes sample guestbook](https://github.com/kubernetes/examples/tree/master/guestbook/) application.
The app will be deployed into the `default` namespace.

```yaml
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: simple
  namespace: fleet-local
spec:
  repo: https://github.com/rancher/fleet-examples
  paths:
  - simple
```
