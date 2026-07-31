USE db_jardineria;
GO

-- Ejercicio 1: muestra clientes sin región.
SELECT nombre_cliente, ciudad, region
FROM cliente
WHERE region IS NULL;
GO


-- Ejercicio 2: muestra empleados sin jefe.
SELECT codigo_empleado, nombre, apellido1, codigo_jefe
FROM empleado
WHERE codigo_jefe IS NULL;
GO


-- Ejercicio 3: muestra pedidos no entregados.
SELECT codigo_pedido, fecha_pedido, fecha_entrega
FROM pedido
WHERE fecha_entrega IS NULL;
GO


-- Ejercicio 4: muestra clientes con límite de crédito.
SELECT nombre_cliente, limite_credito
FROM cliente
WHERE limite_credito IS NOT NULL;
GO


-- Ejercicio 5: muestra oficinas con segunda dirección.
SELECT ciudad, linea_direccion2
FROM oficina
WHERE linea_direccion2 IS NOT NULL;
GO


-- Ejercicio 6: reemplaza regiones vacías.
SELECT
    nombre_cliente,
    COALESCE(region, 'Sin región') AS region
FROM cliente;
GO


-- Ejercicio 7: indica cuando un empleado no tiene jefe.
SELECT
    nombre,
    apellido1,
    COALESCE(CAST(codigo_jefe AS VARCHAR(20)), 'No tiene jefe') AS jefe
FROM empleado;
GO


-- Ejercicio 8: muestra todos los empleados.
SELECT *
FROM empleado;
GO


-- Ejercicio 9: muestra pedidos ya entregados.
SELECT codigo_pedido, fecha_entrega
FROM pedido
WHERE fecha_entrega IS NOT NULL;
GO


-- Ejercicio 10: muestra clientes con representante de ventas.
SELECT nombre_cliente, codigo_empleado_rep_ventas
FROM cliente
WHERE codigo_empleado_rep_ventas IS NOT NULL;
GO


-- Ejercicio 11: vuelve a mostrar clientes con crédito.
SELECT nombre_cliente, limite_credito
FROM cliente
WHERE limite_credito IS NOT NULL;
GO


-- Ejercicio 12: crea una vista con el total pagado por cliente.
CREATE OR ALTER VIEW total_pagos_cliente
AS
SELECT
    codigo_cliente,
    SUM(total) AS total_pagado
FROM pago
GROUP BY codigo_cliente;
GO

SELECT *
FROM total_pagos_cliente;
GO


-- Ejercicio 13: crea una vista de productos con precio mayor a 100.
CREATE OR ALTER VIEW productos_caros
AS
SELECT
    nombre,
    precio_venta
FROM producto
WHERE precio_venta > 100;
GO

SELECT *
FROM productos_caros;
GO


-- Ejercicio 14: crea una vista con datos básicos de clientes.
CREATE OR ALTER VIEW vista_cliente
AS
SELECT
    nombre_cliente,
    ciudad,
    pais
FROM cliente;
GO

SELECT *
FROM vista_cliente;
GO


-- Ejercicio 15: borra la vista de pagos cuando sea necesario.
DROP VIEW IF EXISTS total_pagos_cliente;
GO