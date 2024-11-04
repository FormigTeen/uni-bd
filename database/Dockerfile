FROM docker://docker.io/postgres:latest

COPY tables.sql /docker-entrypoint-initdb.d/01-tables.sql
COPY seed.sql /docker-entrypoint-initdb.d/02-seed.sql

