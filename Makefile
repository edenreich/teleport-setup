include common.mk
include requirements.mk

TILT_VERSION=0.33.6
tilt:
	curl -fsSL https://github.com/tilt-dev/tilt/releases/download/v${TILT_VERSION}/tilt.${TILT_VERSION}.${TARGET}.${ARCH}.tar.gz > bin/tilt.tar.gz && mkdir bin/tilt_tmp && tar -xzv -f bin/tilt.tar.gz -C bin/tilt_tmp && cp bin/tilt_tmp/tilt bin/tilt && rm -r bin/tilt.tar.gz bin/tilt_tmp

k8s-cluster: docker k3d kubectl
	k3d cluster create --agents 3 --k3s-arg '--disable=traefik@server:0'

k8s-up: helm tilt
	./bin/tilt up

k8s-down: helm tilt
	./bin/tilt down

clean:
	rm -rf ./bin/*
	k3d cluster delete

.PHONY: cluster k8s-up k8s-down clean
