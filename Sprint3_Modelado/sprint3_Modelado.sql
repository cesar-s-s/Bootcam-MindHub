-- Dimensions Claves 

-- 1. Identificar las dimensiones claves:

create database Sprint3_Modelado;

use Sprint3_Modelado;

create table Producto (
	producto_id INT NOT NULL auto_increment,
    nombre_del_producto VARCHAR(50),
    categoria VARCHAR(40), 
    precio DECIMAL (8,2),
    PRIMARY KEY (producto_id)
);

create table Tiempo (
	tiempo_id INT NOT NULL auto_increment,
    fecha DATE,
    mes INT, 
    Trimestre INT, 
    anio INT, 
    dia_semana INT,
    festivo BOOLEAN, 
    PRIMARY KEY (tiempo_id)
);

create table Ubicacion (
	ubicacion_id INT NOT NULL auto_increment, 
    tienda VARCHAR(40),
    ciudad VARCHAR(50),
    estado VARCHAR(50),
    pais VARCHAR(50), 
    codigo_postal VARCHAR (20),
    PRIMARY KEY (ubicacion_id)
);

create table Cliente (
	cliente_id INT NULL auto_increment,
    nombre_cliente VARCHAR (40),
    segmento_cliente VARCHAR (30),
    PRIMARY KEY (cliente_id)
);


-- 2. Identifica la tabla de hechos:

-- Creo tabla de ventas

create table Ventas (
	ventas_id INT NOT NULL auto_increment, 
    venta_totas DECIMAL (12,2),
    cantidad_productos_vendidos INT, 
    
    producto_id INT,
    tiempo_id INT,
    ubicacion_id INT,
    cliente_id INT,
    PRIMARY KEY (ventas_id),
    
    FOREIGN KEY (producto_id) REFERENCES Producto (producto_id),
	FOREIGN KEY (tiempo_id) REFERENCES Tiempo (tiempo_id),
    FOREIGN KEY (ubicacion_id) REFERENCES Ubicacion (ubicacion_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id)
);

-- Carga de datos 
    
INSERT INTO Producto (nombre_del_producto, categoria, precio) VALUES 
('Producto_A', 'Categoria_1', 50.00),
('Producto_B', 'Categoria_2', 30.00),
('Producto_C', 'Categoria_1', 80.00),
('Producto_D', 'Categoria_2', 45.00),
('Producto_E', 'Categoria_1', 55.00),
('Producto_F', 'Categoria_2', 75.00);

INSERT INTO Tiempo (fecha, mes, Trimestre, anio, dia_semana, festivo)VALUES 
('2023-01-01', 1, 1, 2023, 1, 1),
('2023-02-01', 2, 1, 2023, 1, 0),
('2023-03-01', 3, 1, 2023, 1, 0),
('2023-04-01', 4, 2, 2023, 1, 0),
('2023-05-01', 5, 2, 2023, 1, 0),
('2023-06-01', 6, 2, 2023, 1, 0);

INSERT INTO Ubicacion (tienda, ciudad, estado, pais, codigo_postal)
VALUES 
('Tienda_1', 'Ciudad_1', 'Estado_1', 'Pais_1', 'CP_001'),
('Tienda_2', 'Ciudad_2', 'Estado_2', 'Pais_2', 'CP_002'),
('Tienda_3', 'Ciudad_3', 'Estado_3', 'Pais_3', 'CP_003'),
('Tienda_4', 'Ciudad_4', 'Estado_4', 'Pais_4', 'CP_004'),
('Tienda_5', 'Ciudad_5', 'Estado_5', 'Pais_5', 'CP_005'),
('Tienda_6', 'Ciudad_6', 'Estado_6', 'Pais_6', 'CP_006');

INSERT INTO Cliente (nombre_cliente, segmento_cliente)
VALUES 
('Cliente_1', 'Segmento_1'),
('Cliente_2', 'Segmento_2'),
('Cliente_3', 'Segmento_1'),
('Cliente_4', 'Segmento_2'),
('Cliente_5', 'Segmento_1'),
('Cliente_6', 'Segmento_2');

INSERT INTO Ventas (venta_totas, cantidad_productos_vendidos, producto_id, tiempo_id, ubicacion_id, cliente_id)
VALUES 
(150.00, 5, 1, 1, 1, 1),
(200.00, 3, 2, 2, 2, 2),
(100.00, 2, 3, 3, 3, 3),
(120.00, 4, 4, 4, 4, 4),
(180.00, 6, 5, 5, 5, 5),
(90.00, 3, 6, 6, 6, 6);

-- Join de la tabla ventas con la de productos 
select * from Ventas;
select * from Producto;

SELECT v.*, pro.nombre_del_producto, pro.categoria
FROM Ventas v
JOIN Producto pro ON v.producto_id = pro.producto_id 
where v.venta_totas > 110;

-- Hago consulta de sumas, promedio

SELECT pro.nombre_del_producto, 
	SUM(v.venta_totas) suma_ventas, 
    AVG(v.cantidad_productos_vendidos) promedio_productos, 
    MAX(v.venta_totas) max_ventas
FROM Ventas v
JOIN Producto pro ON v.producto_id = pro.producto_id 
GROUP BY pro.nombre_del_producto;