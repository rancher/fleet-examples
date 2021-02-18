# Windows Helm Example

This example will deploy the [Windows application example](https://kubernetes.io/docs/setup/production-environment/windows/user-guide-windows-containers/) packaged as a Helm chart.
It must be deployed in a multi-cluster configuration, and requires Fleet v0.3.4+.
For more information, check out the [Fleet docs](https://rancher.com/docs/rancher/v2.x/en/deploy-across-clusters/fleet/).

## Preparing Your Downstream Cluster(s)

Clusters (`clusters.fleet.cattle.io`) must have the `windows.version` label in order for the example to be deployed.
You can determine the value for the `windows.version` label key based on the release version of your Windows node(s).

Description | Example
--- | ---
For Windows Server SAC nodes, the value will be the SAC release number (prepended with "win"). | 2004 SAC would result in `windows.version: win2004`
For Windows Server LTSC nodes, the value will be the SAC release number that the LTSC is based on (prepended with "win"). | 2019 LTSC would result in `windows.version: win1809`

## Creating the GitRepo

Create the following `GitRepo` in your local cluster to get started.

```yaml
kind: GitRepo
apiVersion: fleet.cattle.io/v1alpha1
metadata:
  name: helm
  namespace: fleet-default
spec:
  repo: https://github.com/rancher/fleet-examples
  paths:
  - multi-cluster/windows-helm
  targets:
  - name: win2004
    clusterSelector:
      matchLabels:
        windows.version: win2004
  - name: win1909
    clusterSelector:
      matchLabels:
        windows.version: win1909
  - name: win1903
    clusterSelector:
      matchLabels:
        windows.version: win1903
  - name: win1809
    clusterSelector:
      matchLabels:
        windows.version: win1809
```
