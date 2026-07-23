create database escuela
go

use escuela
go

create table alumno(
id_cedula int,
nombre varchar(20),
apellido_1 varchar(20),
apellido_2 varchar(20)
)
go

create table direccion(
distrito varchar(20),
provinicia varchar(20),
calle varchar(20),
canton varchar(20)
)
go

create table asignatura(
id_asignatura int,
nombre varchar(20),
profesor varchar(20)
)
go