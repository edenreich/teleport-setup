include common.mk
include requirements.mk

k8s-cluster: docker k3d kubectl
	@k3d cluster create --agents 3 --k3s-arg '--disable=traefik@server:0' -p 443:443

k8s-up: helm tilt
	@./bin/tilt up

k8s-down: helm tilt
	@./bin/tilt down
	@kubectl delete namespace cert-manager || true
	@kubectl delete namespace nginx-system || true
	@kubectl delete namespace teleport || true

clean:
	@rm -rf ./bin/*
	@k3d cluster delete

.PHONY: cluster k8s-up k8s-down clean
