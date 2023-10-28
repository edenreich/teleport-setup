k8s_context("k3d-k3s-default")
load('ext://helm_remote', 'helm_remote')

helm_remote('ingress-nginx',
    repo_url='https://kubernetes.github.io/ingress-nginx',
    version='4.8.3',
    release_name='ingress-nginx',
    namespace='nginx-system',
    create_namespace='true',
)

helm_remote('teleport-cluster',
    repo_name='teleport',
    repo_url='https://charts.releases.teleport.dev',
    release_name='teleport',
    namespace='teleport',
    create_namespace='true',
    values=['teleport.yaml']
)
