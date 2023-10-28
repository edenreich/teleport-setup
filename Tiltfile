k8s_context("k3d-k3s-default")
load('ext://helm_remote', 'helm_remote')

helm_remote('cert-manager',
    repo_name='jetstack',
    repo_url='https://charts.jetstack.io',
    version='v1.13.1',
    release_name='cert-manager',
    namespace='cert-manager',
    create_namespace='true',
    values=['infra/helm/certmanager/values.yaml']
)

helm_remote('ingress-nginx',
    repo_name='ingress-nginx',
    repo_url='https://kubernetes.github.io/ingress-nginx',
    version='4.8.3',
    release_name='ingress-nginx',
    namespace='nginx-system',
    create_namespace='true',
)

helm_remote('teleport-cluster',
    repo_name='teleport-cluster',
    repo_url='https://charts.releases.teleport.dev',
    version='14.1.1',
    release_name='teleport',
    namespace='teleport',
    create_namespace='true',
    values=['infra/helm/teleport/values.yaml']
)
