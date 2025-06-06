INSERT INTO productos (nombre, tipo, tamanio, precio)
VALUES ('Pizza Vegetariana', 'pizza', 'pequena', 18.00);

INSERT INTO productos (nombre, tipo, tamanio, precio)  
VALUES ('Sprite 1L', 'bebida', NULL, 4.50);

INSERT INTO ingredientes (nombre, precio_extra)
VALUES ('Aceitunas negras', 1.80);

INSERT INTO pedidos (id_cliente, hora_recogida, pagado)
VALUES (2, '20:00:00', TRUE);

INSERT INTO pedido_productos (id_pedido, id_producto, cantidad)
VALUES (2, 2, 1);

INSERT INTO pedido_ingredientes (id_pedido, id_producto, id_ingrediente)  
VALUES (2, 2, 2);
