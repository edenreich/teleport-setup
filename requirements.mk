docker:
	@which docker || (echo "docker is not installed. Please install it." && exit 1)

k3d:
	@which k3d || (echo "k3d is not installed. Please install it." && exit 1)

kubectl:
	@which kubectl || (echo "kubectl is not installed. Please install it." && exit 1)

helm:
	@which helm || (echo "helm is not installed. Please install it." && exit 1)
