-- Crear la base de datos
-- DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda
ENCODING 'UTF8'

-- Conectarse a la base de datos
-- En psql:
-- \c tienda

-- Tabla fabricante
CREATE TABLE fabricante (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla producto
CREATE TABLE producto (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DOUBLE PRECISION NOT NULL,
    id_fabricante INTEGER NOT NULL,
    CONSTRAINT fk_producto_fabricante
        FOREIGN KEY (id_fabricante)
        REFERENCES fabricante(id)
);

-- Insertar fabricantes
INSERT INTO fabricante (nombre) VALUES
('Asus'),
('Lenovo'),
('Hewlett-Packard'),
('Samsung'),
('Seagate'),
('Crucial'),
('Gigabyte'),
('Huawei'),
('Xiaomi');

-- Sincronizar la secuencia del IDENTITY
ALTER TABLE fabricante
ALTER COLUMN id RESTART WITH 10;

-- Insertar productos
INSERT INTO producto (nombre, precio, id_fabricante) VALUES
('Disco duro SATA3 1TB', 86.99, 5),
('Memoria RAM DDR4 8GB', 120, 6),
('Disco SSD 1 TB', 150.99, 4),
('GeForce GTX 1050Ti', 185, 7),
('GeForce GTX 1080 Xtreme', 755, 6),
('Monitor 24 LED Full HD', 202, 1),
('Monitor 27 LED Full HD', 245.99, 1),
('Portátil Yoga 520', 559, 2),
('Portátil Ideapd 320', 444, 2),
('Impresora HP Deskjet 3720', 59.99, 3),
('Impresora HP Laserjet Pro M26nw', 180, 3);

-- Sincronizar la secuencia del IDENTITY
ALTER TABLE producto
ALTER COLUMN id RESTART WITH 12;

SELECT *
FROM producto