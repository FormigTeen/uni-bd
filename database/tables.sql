CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    code INTEGER UNIQUE NOT NULL
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR(255) NOT NULL
);

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    latitude NUMERIC(9, 6) NOT NULL,
    longitude NUMERIC(9, 6) NOT NULL
);


CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    ean VARCHAR(255) UNIQUE NOT NULL,
    primary_id INTEGER NOT NULL,
    secondary_id INTEGER,
    FOREIGN KEY (primary_id) REFERENCES categories(id),
    FOREIGN KEY (secondary_id) REFERENCES categories(id)
);

CREATE TABLE suppliers (
    id SERIAL PRIMARY KEY,
    cnpj VARCHAR(255) UNIQUE NOT NULL,
    code INTEGER UNIQUE NOT NULL,
    location_id INTEGER UNIQUE NOT NULL,
    address VARCHAR(255),
    state VARCHAR(2) NOT NULL,
    city VARCHAR(10) NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations(id)
);

CREATE TABLE purchase_orders (
    id SERIAL PRIMARY KEY,
    supplier_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    sold_at TIMESTAMP,
    expired_at TIMESTAMP,
    quantity INTEGER NOT NULL,
    price_by_unit INTEGER NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    code_rfid VARCHAR(255),
    purchase_order_id INTEGER NOT NULL,
    status INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_orders(id)
);

CREATE TABLE places (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location_id INTEGER NOT NULL,
    cnpj VARCHAR(255) UNIQUE,
    address VARCHAR(255) NOT NULL,
    state VARCHAR(2) NOT NULL,
    city VARCHAR(10) NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations(id)
);

CREATE TABLE configurations (
    id SERIAL PRIMARY KEY,
    place_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    min_quantity INTEGER,
    max_quantity INTEGER,
    FOREIGN KEY (place_id) REFERENCES places(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    UNIQUE (place_id, product_id)
);

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    item_id INTEGER NOT NULL,
    place_id INTEGER NOT NULL,
    employee_id INTEGER,
    executed_at TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (place_id) REFERENCES places(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);