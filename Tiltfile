k8s_context("k3d-k3s-default")
load('ext://helm_resource', 'helm_resource', 'helm_repo')
update_settings(max_parallel_updates=3, k8s_upsert_timeout_secs=300, suppress_unused_image_warnings=None) 

helm_repo(name='jetstack', url='https://charts.jetstack.io', labels='helm-chart-repositories')
helm_repo(name='ingress-nginx', url='https://kubernetes.github.io/ingress-nginx', labels='helm-chart-repositories')
helm_repo(name='teleport', url='https://charts.releases.teleport.dev', labels='helm-chart-repositories')

helm_resource('cert-manager',
    chart='jetstack/cert-manager',
    namespace='cert-manager',
    release_name='cert-manager',
    flags=[
        '--values', 'infra/certmanager/helm/values.yaml',
        '--version', 'v1.13.0',
        '--create-namespace', '--wait'
    ],
    labels=['infrastructure']
)
local_resource('selfsigned-issuer',
    cmd='kubectl apply -f infra/certmanager/selfsigned-issuer.yaml',
    resource_deps=['cert-manager'],
    labels=['infrastructure']
)

helm_resource('nginx-ingress',
    chart='ingress-nginx/ingress-nginx',
    namespace='nginx-system',
    release_name='nginx',
    flags=[
        '--version', '4.8.3',
        '--create-namespace', '--wait'
    ],
    resource_deps=['cert-manager'],
    labels=['infrastructure']
)

helm_resource('teleport-cluster',
    chart='teleport/teleport-cluster',
    namespace='teleport',
    release_name='teleport-cluster',
    flags=[
        '--values', 'infra/teleport/helm/values.yaml',
        '--version', '14.1.1',
        '--create-namespace', '--wait'
    ],
    resource_deps=['nginx-ingress', 'cert-manager'],
    labels=['infrastructure']
)
