# Nome do container
CONTAINER_NAME=formigteen
IMAGE_NAME=formigteen
POSTGRES_PASSWORD=mysecretpassword

all: build start

build:
	podman build -t $(IMAGE_NAME) .

start: build
	podman run --name $(CONTAINER_NAME) \
		-e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) \
		-e POSTGRES_HOST_AUTH_METHOD=trust \
		--rm ${IMAGE_NAME}

# Target para parar o container
enter:
	podman exec -it ${CONTAINER_NAME} psql -U postgres -d postgres

