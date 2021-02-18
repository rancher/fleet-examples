# Fleet Examples

This repository contains examples of how to use Fleet using different approaches.
The repo is broken up into two different sections: Single cluster and Multi Cluster.

## Single Cluster Examples

All examples will deploy content to clusters with no per-cluster customizations. This is a good starting point to
understand the basics of structuring git repos for Fleet.

| Example | Description |
|-------------|-------------|
| [manifests](single-cluster/manifests/) | An example using raw Kubernetes YAML and customizing it per target cluster |
| [helm](single-cluster/helm/) | An example using Helm and customizing it per target cluster |
| [helm-multi-chart](single-cluster/helm-multi-chart/) | An example deploying multiple charts from a single repo |
| [kustomize](single-cluster/kustomize/) | An example using Kustomize and customizing it per target cluster |
| [helm-kustomize](single-cluster/helm-kustomize/) | An example using Kustomize to modify a third party Helm chart |

## Multi-Cluster Examples

The examples below will deploy a single git repo to multiple clusters at once
and configure the app differently for each target.

| Example | Description |
|-------------|-------------|
| [manifests](multi-cluster/manifests/) | A full example of using raw Kubernetes YAML and customizing it per target cluster |
| [helm](multi-cluster/helm/) | A full example of using Helm and customizing it per target cluster |
| [helm-external](multi-cluster/helm-external/) | A full example of using a Helm chart that is downloaded from a third party source and customizing it per target cluster |
| [kustomize](multi-cluster/kustomize/) | A full example of using Kustomize and customizing it per target cluster |
| [helm-kustomize](multi-cluster/helm-kustomize/) | A full example of using Kustomize to modify a third party Helm chart |
| [windows-helm](multi-cluster/windows-helm/) | A full example of using Helm for Windows cluster(s)

## Windows Example

Using downstream clusters with Windows nodes?
Check out the [windows-helm](multi-cluster/windows-helm/) multi-cluster example above.
