## Teleport Setup

- [Teleport Setup](#teleport-setup)
  - [Prerequisites](#prerequisites)
  - [Quick-Start](#quick-start)

This is an example for Teleport setup running on Kubernetes.

### Prerequisites

- docker
- k3d

### Quick-Start

1. First create a cluster:
```
make k8s-cluster
```

2. Deploy Teleport with its dependencies:
```
make k8s-up
```
