create database SistemaMatricula;
go

use SistemaMatricula;
go

-- tabla provincia --
create table provincia (
    id_provincia int identity(1,1) primary key,
    nombre_provincia varchar(100) not null unique
);
go

-- tabla canton --
create table canton (
    id_canton int identity(1,1) primary key,
    id_provincia int not null,
    nombre varchar(100) not null,
    foreign key (id_provincia) references provincia(id_provincia)
);
go

-- tabla distrito --
create table distrito (
    id_distrito int identity(1,1) primary key,
    id_canton int not null,
    nombre varchar(100) not null,
    foreign key (id_canton) references canton(id_canton)
);
go

-- tabla estudiante --
create table estudiante (
    id_estudiante int identity(1,1) primary key,
    id_distrito int not null,
    cedula varchar(30) not null unique,
    nombre varchar(100) not null,
    apellido_1 varchar(100) not null,
    apellido_2 varchar(100),
    fecha_nacimiento date not null,
    direccion_detallada varchar(300) not null,
    numero_telefono varchar(30),
    foreign key (id_distrito) references distrito(id_distrito)
);
go

-- tabla profesor --
create table profesor (
    id_profesor int identity(1,1) primary key,
    id_distrito int not null,
    cedula varchar(30) not null unique,
    nombre varchar(100) not null,
    apellido_1 varchar(100) not null,
    apellido_2 varchar(100),
    fecha_nacimiento date not null,
    direccion_detallada varchar(300) not null,
    numero_telefono varchar(30),
    foreign key (id_distrito) references distrito(id_distrito)
);
go

-- tabla estado de la inscripcion --
create table estado (
    id_estado int identity(1,1) primary key,
    nombre varchar(50) not null unique
);
go

-- tabla sede --
create table sede (
    id_sede int identity(1,1) primary key,
    nombre varchar(150) not null
);
go

-- tabla acreditadora --
create table acreditadora (
    id_acreditadora int identity(1,1) primary key,
    nombre varchar(150) not null
);
go

-- tabla acreditacion --
create table acreditacion (
    id_acreditacion int identity(1,1) primary key,
    id_acreditadora int not null,
    nombre varchar(150) not null,
    foreign key (id_acreditadora) references acreditadora(id_acreditadora)
);
go

-- tabla titulo --
-- id_acreditacion puede quedar vacio si el titulo no esta acreditado --
create table titulo (
    id_titulo int identity(1,1) primary key,
    id_acreditacion int,
    nombre varchar(150) not null,
    foreign key (id_acreditacion) references acreditacion(id_acreditacion)
);
go

-- tabla carrera --
-- cada carrera pertenece a una sede y tiene un titulo --
create table carrera (
    id_carrera int identity(1,1) primary key,
    id_sede int not null,
    id_titulo int not null,
    nombre varchar(150) not null,
    foreign key (id_sede) references sede(id_sede),
    foreign key (id_titulo) references titulo(id_titulo)
);
go

-- tabla plan de estudio --
create table plan_estudio (
    id_plan_estudio int identity(1,1) primary key,
    id_carrera int not null,
    nombre varchar(150) not null,
    fecha_creacion date not null,
    fecha_descontinuacion date,
    fecha_cierre_registros date,
    foreign key (id_carrera) references carrera(id_carrera)
);
go

-- tabla materia --
create table materia (
    id_materia int identity(1,1) primary key,
    nombre varchar(150) not null,
    creditos int not null,
    precio decimal(12,2) not null
);
go

-- relacion entre plan de estudio y materia --
create table plan_estudio_materia (
    id_plan_estudio int not null,
    id_materia int not null,
    primary key (id_plan_estudio, id_materia),
    foreign key (id_plan_estudio) references plan_estudio(id_plan_estudio),
    foreign key (id_materia) references materia(id_materia)
);
go

-- tabla aula --
create table aula (
    id_aula int identity(1,1) primary key,
    nombre varchar(100) not null
);
go

-- tabla dia de la semana --
create table dia_semana (
    id_dia_semana int primary key,
    nombre varchar(20) not null
);
go

-- tabla mes --
create table mes (
    id_mes int primary key,
    nombre varchar(20) not null
);
go

-- tabla cuatrimestre --
create table cuatrimestre (
    id_cuatrimestre int identity(1,1) primary key,
    nombre varchar(50) not null,
    anio int not null
);
go

-- relacion entre cuatrimestre y mes --
create table cuatrimestre_mes (
    id_cuatrimestre int not null,
    id_mes int not null,
    primary key (id_cuatrimestre, id_mes),
    foreign key (id_cuatrimestre) references cuatrimestre(id_cuatrimestre),
    foreign key (id_mes) references mes(id_mes)
);
go

-- tabla clase --
create table clase (
    id_clase int identity(1,1) primary key,
    id_materia int not null,
    id_profesor int not null,
    id_aula int not null,
    id_cuatrimestre int not null,
    grupo varchar(30) not null,
    estado varchar(30) not null,
    cupo int not null,
    foreign key (id_materia) references materia(id_materia),
    foreign key (id_profesor) references profesor(id_profesor),
    foreign key (id_aula) references aula(id_aula),
    foreign key (id_cuatrimestre) references cuatrimestre(id_cuatrimestre)
);
go

-- tabla horario --
create table horario (
    id_horario int identity(1,1) primary key,
    id_clase int not null,
    id_dia_semana int not null,
    hora_inicio time not null,
    hora_final time not null,
    foreign key (id_clase) references clase(id_clase),
    foreign key (id_dia_semana) references dia_semana(id_dia_semana)
);
go

-- tabla inscripcion --
create table inscripcion (
    id_inscripcion int identity(1,1) primary key,
    id_estudiante int not null,
    id_carrera int not null,
    id_estado int not null,
    fecha_inscripcion date not null,
    foreign key (id_estudiante) references estudiante(id_estudiante),
    foreign key (id_carrera) references carrera(id_carrera),
    foreign key (id_estado) references estado(id_estado)
);
go

-- tabla beca --
-- la beca pertenece a la inscripcion para guardar el historico --
create table beca (
    id_beca int identity(1,1) primary key,
    id_inscripcion int not null,
    porcentaje_materia decimal(5,2) not null,
    porcentaje_matricula decimal(5,2) not null,
    estado varchar(30) not null,
    fecha_inicio date not null,
    fecha_fin date,
    foreign key (id_inscripcion) references inscripcion(id_inscripcion)
);
go

-- tabla matricula --
-- id_beca toma los porcentajes guardados en la beca asignada --
create table matricula (
    id_matricula int identity(1,1) primary key,
    id_inscripcion int not null,
    id_beca int,
    fecha_matricula date not null,
    estado varchar(30) not null,
    precio_matricula decimal(12,2) not null,
    descuento_matricula decimal(12,2) not null,
    precio_materias decimal(12,2) not null,
    descuento_materias decimal(12,2) not null,
    precio_final decimal(12,2) not null,
    balance_actual decimal(12,2) not null,
    foreign key (id_inscripcion) references inscripcion(id_inscripcion),
    foreign key (id_beca) references beca(id_beca)
);
go

-- relacion entre matricula y clase --
-- una matricula puede incluir varias clases y una clase varios estudiantes --
create table matricula_clase (
    id_matricula int not null,
    id_clase int not null,
    primary key (id_matricula, id_clase),
    foreign key (id_matricula) references matricula(id_matricula),
    foreign key (id_clase) references clase(id_clase)
);
go

-- tabla pago --
create table pago (
    id_pago int identity(1,1) primary key,
    id_matricula int not null,
    nombre varchar(150) not null,
    cantidad decimal(12,2) not null,
    fecha_pago datetime not null,
    referencia varchar(100),
    estado varchar(30) not null,
    metodo varchar(50) not null,
    foreign key (id_matricula) references matricula(id_matricula)
);
go