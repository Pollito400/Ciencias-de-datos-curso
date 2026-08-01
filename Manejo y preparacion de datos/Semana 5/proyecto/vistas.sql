use SistemaMatricula;
go

-- vista 1: estudiantes inscritos con su carrera, sede y estado --
create view vista_estudiantes_inscritos
as
select
    i.id_inscripcion,
    e.id_estudiante,
    e.cedula,
    e.nombre,
    e.apellido_1,
    e.apellido_2,
    c.nombre as carrera,
    s.nombre as sede,
    es.nombre as estado_inscripcion,
    i.fecha_inscripcion
from inscripcion i
inner join estudiante e on i.id_estudiante = e.id_estudiante
inner join carrera c on i.id_carrera = c.id_carrera
inner join sede s on c.id_sede = s.id_sede
inner join estado es on i.id_estado = es.id_estado;
go

-- vista 2: informacion de las clases --
create view vista_clases
as
select
    c.id_clase,
    m.nombre as materia,
    c.grupo,
    p.nombre as nombre_profesor,
    p.apellido_1 as apellido_profesor,
    a.nombre as aula,
    cu.nombre as cuatrimestre,
    cu.anio,
    c.estado,
    c.cupo
from clase c
inner join materia m on c.id_materia = m.id_materia
inner join profesor p on c.id_profesor = p.id_profesor
inner join aula a on c.id_aula = a.id_aula
inner join cuatrimestre cu on c.id_cuatrimestre = cu.id_cuatrimestre;
go

-- vista 3: detalle de matriculas y estudiantes --
create view vista_matriculas
as
select
    m.id_matricula,
    e.cedula,
    e.nombre,
    e.apellido_1,
    c.nombre as carrera,
    m.fecha_matricula,
    m.estado as estado_matricula,
    m.precio_matricula,
    m.precio_materias,
    m.descuento_matricula,
    m.descuento_materias,
    m.precio_final,
    m.balance_actual,
    m.id_beca
from matricula m
inner join inscripcion i on m.id_inscripcion = i.id_inscripcion
inner join estudiante e on i.id_estudiante = e.id_estudiante
inner join carrera c on i.id_carrera = c.id_carrera;
go

-- vista 4: historico de becas --
create view vista_historial_becas
as
select
    b.id_beca,
    i.id_inscripcion,
    e.cedula,
    e.nombre,
    e.apellido_1,
    c.nombre as carrera,
    b.porcentaje_materia,
    b.porcentaje_matricula,
    b.estado as estado_beca,
    b.fecha_inicio,
    b.fecha_fin
from beca b
inner join inscripcion i on b.id_inscripcion = i.id_inscripcion
inner join estudiante e on i.id_estudiante = e.id_estudiante
inner join carrera c on i.id_carrera = c.id_carrera;
go

-- vista 5: pagos realizados por los estudiantes --
create view vista_pagos
as
select
    p.id_pago,
    p.id_matricula,
    e.cedula,
    e.nombre,
    e.apellido_1,
    p.nombre as descripcion_pago,
    p.cantidad,
    p.fecha_pago,
    p.referencia,
    p.estado as estado_pago,
    p.metodo
from pago p
inner join matricula m on p.id_matricula = m.id_matricula
inner join inscripcion i on m.id_inscripcion = i.id_inscripcion
inner join estudiante e on i.id_estudiante = e.id_estudiante;
go

-- vista 6: resumen de estudiantes por carrera --
create view vista_resumen_carreras
as
select
    c.id_carrera,
    c.nombre as carrera,
    s.nombre as sede,
    count(i.id_inscripcion) as cantidad_estudiantes
from carrera c
inner join sede s on c.id_sede = s.id_sede
left join inscripcion i on c.id_carrera = i.id_carrera
group by c.id_carrera, c.nombre, s.nombre;
go

-- consultas para probar las vistas --
select * from vista_estudiantes_inscritos;
go

select * from vista_clases;
go

select * from vista_matriculas;
go

select * from vista_historial_becas;
go

select * from vista_pagos;
go

select * from vista_resumen_carreras;
go