## Teleport Setup

- [Teleport Setup](#teleport-setup)
  - [Prerequisites](#prerequisites)
  - [Quick-Start](#quick-start)
  - [TODO's](#todos)

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

### TODO's

- [ ] Expose endpoint for the proxy
- [ ] Try out new cluster auto discovery feature
- [ ] Explore also standalone servers auto discovery feature
  