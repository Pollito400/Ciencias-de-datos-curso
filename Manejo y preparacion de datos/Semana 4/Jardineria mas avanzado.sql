use db_jardineria
go
-- Muestra los clientes junto con la información de sus pedidos.
SELECT
    c.nombre_cliente,
    p.codigo_pedido,
    p.fecha_pedido
FROM cliente c
INNER JOIN pedido p
ON c.codigo_cliente = p.codigo_cliente;

select * from cliente
go
select * from pedido
go
-- Muestra los clientes, sus pedidos, los productos incluidos y la cantidad solicitada.
select
    c.nombre_cliente,
    p.codigo_pedido,
    pr.nombre as producto,
    dp.cantidad
from cliente c
inner join pedido p on c.codigo_cliente = p.codigo_cliente
inner join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido
inner join producto pr on dp.codigo_producto = pr.codigo_producto;
go
-- Muestra todos los clientes y sus pedidos, incluyendo los clientes que no tienen pedidos.
SELECT c.nombre_cliente, p.codigo_pedido
FROM cliente c
LEFT JOIN pedido p
ON c.codigo_cliente = p.codigo_cliente;
-- Muestra todos los pedidos con el nombre del producto y la cantidad, incluyendo pedidos sin detalles asociados.
select
    p.codigo_pedido,
    pr.nombre,
    dp.cantidad
from producto pr
right join detalle_pedido dp
on pr.codigo_producto = dp.codigo_producto
right join pedido p
on dp.codigo_pedido = p.codigo_pedido;
go