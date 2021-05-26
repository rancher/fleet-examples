# Multi-Cluster Targets Override Example

This example will deploy the [Kubernetes sample guestbook](https://github.com/kubernetes/examples/tree/master/guestbook/) application as
packaged as a Helm chart.
The app will be deployed into the `fleet-mc-override-targets-example` namespace.

Due to the `overrideTargets` field being set to `true` the application will be only be deployed to the `test` cluster. Excluding both `prod` and `dev`.

```yaml
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: helm
  namespace: fleet-default
spec:
  repo: https://github.com/rancher/fleet-examples
  paths:
    - multi-cluster/override-targets
  targets:
    - name: dev
      clusterSelector:
        matchLabels:
          env: dev

    - name: test
      clusterSelector:
        matchLabels:
          env: test

    - name: prod
      clusterSelector:
        matchLabels:
          env: prod
```
