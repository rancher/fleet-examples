# Fleet Examples

This repository contains examples of how to use Fleet using different approaches.
The repo is broken up into two different sections: Single cluster and Multi Cluster.

## Single Cluster Examples

All examples will deploy content to the local cluster running the Fleet Manager.

| Example | Description |
|-------------|-------------|
| [manifest](single-cluster/manifest/) | A full example of using raw Kubernetes YAML and customizing it per target cluster |
| [helm](single-cluster/helm/) | A full example of using Helm and customizing it per target cluster |
| [helm-external](single-cluster/helm-external/) | A full example of using a Helm chart that is downloaded from a third party source and customizing it per target cluster |
| [kustomize](single-cluster/kustomize/) | A full example of using Kustomize and customizing it per target cluster |
| [helm-kustomize](single-cluster/helm-kustomize/) | A full example of using Kustomize to modify a third party Helm chart |

## Multi-Cluster Examples

The examples below will deploy a single git repo to multiple clusters at once
and configure the app differently for each target.

| Example | Description |
|-------------|-------------|
| [manifest](multi-cluster/manifest/) | A full example of using raw Kubernetes YAML and customizing it per target cluster |
| [helm](multi-cluster/helm/) | A full example of using Helm and customizing it per target cluster |
| [helm-external](multi-cluster/helm-external/) | A full example of using a Helm chart that is downloaded from a third party source and customizing it per target cluster |
| [kustomize](multi-cluster/kustomize/) | A full example of using Kustomize and customizing it per target cluster |
| [helm-kustomize](multi-cluster/helm-kustomize/) | A full example of using Kustomize to modify a third party Helm chart |