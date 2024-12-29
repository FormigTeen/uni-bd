FROM docker://docker.io/postgres:latest

# Define o argumento com valor padrão
ARG IS_BAD_DATABASE=0

COPY ./schemas/bad-tables.sql /tmp/bad-tables.sql
COPY ./schemas/tables.sql /tmp/tables.sql

# Condicional para renomear o arquivo correto
RUN if [ "$IS_BAD_DATABASE" = "1" ]; then \
    mv /tmp/bad-tables.sql /docker-entrypoint-initdb.d/01-tables.sql; \
    else \
        mv /tmp/tables.sql /docker-entrypoint-initdb.d/01-tables.sql; \
    fi

COPY ./seeds/seed.sql /docker-entrypoint-initdb.d/02-seed.sql
COPY ./views/view.sql /docker-entrypoint-initdb.d/03-view.sql
