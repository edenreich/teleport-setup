## Teleport Setup

- [Teleport Setup](#teleport-setup)
  - [Prerequisites](#prerequisites)
  - [Quick-Start](#quick-start)
  - [Create RBAC](#create-rbac)
  - [Invitation Link](#invitation-link)
  - [TODO's](#todos)

This is an example for Teleport setup running on Kubernetes.

### Prerequisites

- docker
- k3d

### Quick-Start

1. First create a cluster:
```bash
make k8s-cluster
```

2. Deploy Teleport with its dependencies:
```bash
make k8s-up
```

### Create RBAC

1. Deploy the new role:
```bash
kubectl apply -f infra/teleport/roles/deployer.yaml
```

2. Deploy the user eden and give the deployer role:
```bash
kubectl apply -f infra/teleport/users/eden.yaml
```

### Invitation Link

Send an invitation link to eden for reset the password.

```bash
AUTH_POD=$(kubectl -n teleport get po -l app=teleport-cluster -o jsonpath='{.items[0].metadata.name}')
kubectl -n teleport exec -it "$AUTH_POD" -c teleport -- tctl users reset eden --ttl 8h
```

### TODO's

- [ ] Try out new cluster auto discovery feature
- [ ] Explore also standalone servers auto discovery feature
  