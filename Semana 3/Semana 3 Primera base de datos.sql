-- we create the database --
create database clase1
go
-- we use the created database --
use clase1
go
-- we create usuario table --
create table usuario(
id int not null,
direccion varchar(50) not null,
telefono int not null,
)
go
-- we create producto table --
create table producto(
id int not null,
nombre varchar(20) not null,
precio int not null
)
go
-- we add some items to products --
insert into producto(id, nombre, precio)
values
(1, 'pizza', 1000),
(2, 'hamburguesa', 3000),
(3, 'hotdog', 2000),
(4, 'cantones', 3200)
go
-- we see all the items in products--
select * from producto
go