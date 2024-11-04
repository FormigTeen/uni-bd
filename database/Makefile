# Nome do container
CONTAINER_NAME=formigteen
IMAGE_NAME=formigteen
POSTGRES_PASSWORD=mysecretpassword

# Target para rodar o container, iniciar o PostgreSQL e executar os scripts
build:
	podman build -t $(IMAGE_NAME) .
start:
	podman run --name $(CONTAINER_NAME) \
		-e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) \
		-e POSTGRES_HOST_AUTH_METHOD=trust \
		--rm ${IMAGE_NAME}

# Target para parar o container
enter:
	podman exec -it ${CONTAINER_NAME} psql -U postgres -d postgres

