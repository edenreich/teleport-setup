docker:
	@which docker > /dev/null || (echo "docker is not installed. Please install it." && exit 1)

k3d:
	@which k3d > /dev/null || (echo "k3d is not installed. Please install it." && exit 1)

kubectl:
	@which kubectl > /dev/null || (echo "kubectl is not installed. Please install it." && exit 1)

helm:
	@which helm > /dev/null || (echo "helm is not installed. Please install it." && exit 1)

TILT_VERSION := 0.33.6
CURRENT_TILT_VERSION := $(shell [ -f bin/tilt ] && bin/tilt version | awk -F 'v' '{print $$2}' | awk -F ', built' '{print $$1}')
tilt:
	@if [ "$(TILT_VERSION)" != "$(CURRENT_TILT_VERSION)" ]; then \
		curl -fsSL https://github.com/tilt-dev/tilt/releases/download/v${TILT_VERSION}/tilt.${TILT_VERSION}.${TARGET}.${ARCH}.tar.gz > bin/tilt.tar.gz && \
		mkdir -p bin/tilt_tmp && \
		tar -xzvf bin/tilt.tar.gz -C bin/tilt_tmp && \
		cp bin/tilt_tmp/tilt bin/tilt && \
		rm -rf bin/tilt.tar.gz bin/tilt_tmp && \
		echo "Tilt version $(TILT_VERSION) has been downloaded." ; \
	else \
		echo "Tilt is already up to date (version $(TILT_VERSION))." ; \
	fi
