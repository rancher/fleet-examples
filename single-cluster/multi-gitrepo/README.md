# Multi-GitRepo example

This example will deploy the [Kubernetes sample guestbook](https://github.com/kubernetes/examples/tree/master/guestbook/) application using 2 different `GitRepo CRs`, splitting the frontend and the backend as different Helm charts.

The initial `GitRepo` will point to a folder containing 2 `GitRepo` resources that will be deployed in cascade. 

The app will be deployed into the `fleet-helm-example` namespace.

```yaml
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: multi-gitrepo
  namespace: fleet-local
spec:
  repo: https://github.com/rancher/fleet-examples
  paths:
  - single-cluster/multi-gitrepos/gitrepos
```

