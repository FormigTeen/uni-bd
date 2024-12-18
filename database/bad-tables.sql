CREATE TABLE categories (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    code INTEGER NOT NULL
);

CREATE TABLE employees (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL
);

CREATE TABLE locations (
    id SERIAL,
    latitude NUMERIC(9, 6) NOT NULL,
    longitude NUMERIC(9, 6) NOT NULL
);


CREATE TABLE products (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    ean VARCHAR(255) NOT NULL,
    primary_id INTEGER NOT NULL,
    secondary_id INTEGER
);

CREATE TABLE suppliers (
    id SERIAL,
    cnpj VARCHAR(255) NOT NULL,
    code INTEGER NOT NULL,
    location_id INTEGER NOT NULL,
    address VARCHAR(255),
    state VARCHAR(2) NOT NULL,
    city VARCHAR(10) NOT NULL
);

CREATE TABLE purchase_orders (
    id SERIAL,
    supplier_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    sold_at TIMESTAMP,
    expired_at TIMESTAMP,
    quantity INTEGER NOT NULL,
    price_by_unit INTEGER NOT NULL
);

CREATE TABLE items (
    id SERIAL,
    code_rfid VARCHAR(255),
    purchase_order_id INTEGER NOT NULL,
    status INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE places (
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    location_id INTEGER NOT NULL,
    cnpj VARCHAR(255),
    address VARCHAR(255) NOT NULL,
    state VARCHAR(2) NOT NULL,
    city VARCHAR(10) NOT NULL
);

CREATE TABLE configurations (
    id SERIAL,
    place_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    min_quantity INTEGER,
    max_quantity INTEGER
);

CREATE TABLE transactions (
    id SERIAL,
    item_id INTEGER NOT NULL,
    place_id INTEGER NOT NULL,
    employee_id INTEGER,
    executed_at TIMESTAMP
);
