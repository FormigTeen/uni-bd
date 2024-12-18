FROM docker://docker.io/postgres:latest

# Define o argumento com valor padrão
ARG IS_BAD_DATABASE=0

COPY bad-tables.sql /tmp/bad-tables.sql
COPY tables.sql /tmp/tables.sql

# Condicional para renomear o arquivo correto
RUN if [ "$IS_BAD_DATABASE" = "1" ]; then \
    mv /tmp/bad-tables.sql /docker-entrypoint-initdb.d/01-tables.sql; \
    else \
        mv /tmp/tables.sql /docker-entrypoint-initdb.d/01-tables.sql; \
    fi

COPY seed.sql /docker-entrypoint-initdb.d/02-seed.sql