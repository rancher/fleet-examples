# Helm Multi-Chart Example

This example will deploy the [Kubernetes sample guestbook](https://github.com/kubernetes/examples/tree/master/guestbook/) application 
packaged as a Helm chart into the `fleet-helm-example` namespace.
It will also deploy Rancher Monitoring helm charts into the `cattle-monitoring-system` namespace.

```yaml
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: helm
  namespace: fleet-local
spec:
  repo: https://github.com/rancher/fleet-examples
  paths:
  - single-cluster/helm-multi-chart
```
