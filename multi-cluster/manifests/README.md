# Multi-Cluster Manifests Example

This example will deploy the [Kubernetes sample guestbook](https://github.com/kubernetes/examples/tree/master/guestbook/) application.
The app will be deployed into the `fleet-mc-manifest-example` namespace.

The application will be customized as follows per environment:

* Dev clusters: Only the redis leader is deployed and not the followers.
* Test clusters: Scale the front deployment to 3
* Prod clusters: Scale the front deployment to 3 and set the service type to LoadBalancer

```yaml
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: manifests
  namespace: fleet-local
spec:
  repo: https://github.com/rancher/fleet-examples
  paths:
  - multi-cluster/manifests
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
