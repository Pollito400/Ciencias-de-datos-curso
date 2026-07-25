use db_jardineria
go
-- seleccionar clientes--
select*from
cliente;
go
-- contar cuantos ahi--
select count(*)
as total_clientes
from cliente;
go
-- contamos todos los que tengan un valor en limite de credito --
select count(limite_credito)
as cliente_con_credito
from cliente;
go
-- sumamos todos limtes de credito--
select sum(limite_credito)
as suma_limites_credito
from cliente;
go
-- suma de el codigo de todos los clientes --
select sum(codigo_cliente)
as suma_codigo_cliente
from cliente;
go
-- Sacamos el promedio del limite de credito --
select avg(limite_credito)
as promedio_credito
from cliente;
go
-- cantidad de unidades pedidas en promedio --
select avg(cantidad)
as promedio_unidades_pedidas
from detalle_pedido
go
-- Vemos el credito mas bajo --
select min(limite_credito)
as credito_minimo
from cliente;
go
-- Vemos el pago mas pequeno --
select min(total)
as total_pago
from pago;
go
-- Vemos el pago mas grande --
select max(total)
as total_pago
from pago;
go
-- Vemos el credito mas alto --
select max(limite_credito)
as credito_maximo
from cliente;
go
-- max, min, count ,avg sum limite credito --
select
max(limite_credito) as credito_maximo,
min(limite_credito) as credito_minimo,
COUNT(limite_credito) as contar_los_creditos,
avg(limite_credito) as promedio_credito,
sum(limite_credito) as suma_credito
from cliente;
go

-- total de pedidos por cliente pero los que tienen mas de 5 -- 
select codigo_cliente,
count(*)
as total_pedidos
from pedido
group by codigo_cliente
having COUNT(*) > 5;
go

-- promedio de productos en gamas caras --
select gama,
avg(precio_venta)
as promedio_precio
from producto
group by gama 
having avg(precio_venta) > 10;
go

-- filtrar resultado despues de que se agrupa --
select gama,
avg(precio_venta)
as promedio_precio
from producto
group by gama
having avg(precio_venta) > 5;
go

-- Total de productos vendidos por pedido (solo pedidos grandes) -- 
SELECT
    codigo_pedido,
    SUM(cantidad) AS total_productos_vendidos
FROM detalle_pedido
GROUP BY codigo_pedido
HAVING SUM(cantidad) > 100;
GO

---Clientes por país que tenga muchos clientes ---
select pais,
count(*)
as total
from cliente
group by pais
having count(*) > 5;
go