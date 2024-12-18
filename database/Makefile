# Nome do container
CONTAINER_NAME=formigteen
IMAGE_NAME=formigteen
POSTGRES_PASSWORD=mysecretpassword

all: build start

build:
	podman build -t $(IMAGE_NAME) .

build_bad:
	podman build --build-arg IS_BAD_DATABASE=1 -t $(IMAGE_NAME):bad .

start: build
	podman run --name $(CONTAINER_NAME) \
		-e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) \
		--network host \
		-e POSTGRES_HOST_AUTH_METHOD=trust \
		--rm ${IMAGE_NAME}

start_bad: build_bad
	podman run --name $(CONTAINER_NAME) \
		-e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) \
		--network host \
		-e POSTGRES_HOST_AUTH_METHOD=trust \
		--rm ${IMAGE_NAME}:bad

bad: start_bad

# Target para parar o container
connect:
	podman exec -it ${CONTAINER_NAME} psql -U postgres -d postgres

