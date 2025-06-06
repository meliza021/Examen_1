
CREATE DATABASE IF NOT EXISTS pizza_fiesta;
USE pizza_fiesta;


CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);
INSERT INTO clientes (nombre, telefono, direccion)
VALUES ('Carlos Pérez', '3001234567', 'Calle 10 #15-30');


CREATE TABLE ingredientes (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio_extra DECIMAL(5,2)
);
INSERT INTO ingredientes (nombre, precio_extra)
VALUES ('Queso extra', 2.00), ('Champiñones', 1.50), ('Tocineta', 2.50);


CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo ENUM('pizza', 'bebida'),
    tamanio ENUM('pequena', 'mediana', 'grande') DEFAULT NULL,
    precio DECIMAL(6,2)
);
INSERT INTO productos (nombre, tipo, tamanio, precio)
VALUES 
('Pizza Margarita', 'pizza', 'mediana', 20.00),
('Pizza Pepperoni', 'pizza', 'grande', 30.00),
('Coca-Cola 1.5L', 'bebida', NULL, 5.00);


CREATE TABLE combos (
    id_combo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);
INSERT INTO combos (nombre)
VALUES ('Combo Familiar');

CREATE TABLE combo_productos (
    id_combo INT,
    id_producto INT,
    PRIMARY KEY (id_combo, id_producto),
    FOREIGN KEY (id_combo) REFERENCES combos(id_combo),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
INSERT INTO combo_productos (id_combo, id_producto)
VALUES (1, 1), (1, 3);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    hora_recogida TIME,
    pagado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
INSERT INTO pedidos (id_cliente, hora_recogida, pagado)
VALUES (1, '19:30:00', TRUE);

CREATE TABLE pedido_productos (
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
INSERT INTO pedido_productos (id_pedido, id_producto, cantidad)
VALUES (1, 1, 1), (1, 3, 1);


CREATE TABLE pedido_ingredientes (
    id_pedido INT,
    id_producto INT,
    id_ingrediente INT,
    PRIMARY KEY (id_pedido, id_producto, id_ingrediente),
    FOREIGN KEY (id_pedido, id_producto) REFERENCES pedido_productos(id_pedido, id_producto),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente)
);
INSERT INTO pedido_ingredientes (id_pedido, id_producto, id_ingrediente)
VALUES (1, 1, 1), (1, 1, 3);