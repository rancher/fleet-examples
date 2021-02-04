# Windows Helm Example

This example will deploy the [Windows application example](https://kubernetes.io/docs/setup/production-environment/windows/user-guide-windows-containers/) packaged as a Helm chart.

```yaml
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: helm
  namespace: fleet-local
spec:
  repo: https://github.com/rancher/fleet-examples
  paths:
  - windows-helm
```
