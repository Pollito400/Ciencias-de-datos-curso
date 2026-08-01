use SistemaMatricula;
go

-- 1. SELECT: mostrar todos los estudiantes --
select *
from estudiante;
go

-- 2. WHERE: mostrar las clases activas --
select *
from clase
where estado = 'Activa';
go

-- 3. ORDER BY: ordenar las materias desde la mas cara hasta la mas barata --
select nombre, creditos, precio
from materia
order by precio desc;
go

-- 4. DISTINCT: mostrar los diferentes estados de las matriculas --
select distinct estado
from matricula;
go

-- 5. TOP: mostrar las cinco materias mas caras --
select top 5 nombre, precio
from materia
order by precio desc;
go

-- 6. LIKE: buscar estudiantes cuyo nombre comienza con la letra M --
select nombre, apellido_1, apellido_2
from estudiante
where nombre like 'M%';
go

-- 7. BETWEEN: matriculas realizadas entre dos fechas --
select id_matricula, fecha_matricula, precio_final
from matricula
where fecha_matricula between '2026-01-15' and '2026-01-20'
order by fecha_matricula;
go

-- 8. IN: inscripciones activas o inactivas --
select i.id_inscripcion, e.nombre, e.apellido_1, es.nombre as estado_inscripcion
from inscripcion i
inner join estudiante e on i.id_estudiante = e.id_estudiante
inner join estado es on i.id_estado = es.id_estado
where es.nombre in ('Activo', 'Inactivo');
go

-- 9. NOT: mostrar las clases que no estan canceladas --
select id_clase, grupo, estado, cupo
from clase
where not (estado = 'Cancelada');
go

-- 10. IS NULL: titulos que no tienen acreditacion --
select id_titulo, nombre
from titulo
where id_acreditacion is null;
go

-- 11. IS NOT NULL: planes de estudio descontinuados --
select id_plan_estudio, nombre, fecha_descontinuacion
from plan_estudio
where fecha_descontinuacion is not null;
go

-- 12. AND: materias de cuatro creditos que cuestan mas de 85000 --
select nombre, creditos, precio
from materia
where creditos = 4
and precio > 85000;
go

-- 13. OR: estudiantes que viven en el distrito 1 o en el distrito 6 --
select nombre, apellido_1, id_distrito
from estudiante
where id_distrito = 1
or id_distrito = 6;
go

-- 14. GROUP BY: cantidad de clases por profesor --
select p.id_profesor, p.nombre, p.apellido_1, count(c.id_clase) as cantidad_clases
from profesor p
left join clase c on p.id_profesor = c.id_profesor
group by p.id_profesor, p.nombre, p.apellido_1
order by cantidad_clases desc;
go

-- 15. HAVING: profesores que imparten dos o mas clases --
select p.id_profesor, p.nombre, p.apellido_1, count(c.id_clase) as cantidad_clases
from profesor p
inner join clase c on p.id_profesor = c.id_profesor
group by p.id_profesor, p.nombre, p.apellido_1
having count(c.id_clase) >= 2;
go

-- 16. COUNT: cantidad total de estudiantes --
select count(*) as total_estudiantes
from estudiante;
go

-- 17. SUM: total de pagos aplicados --
select sum(cantidad) as total_pagos_aplicados
from pago
where estado = 'Aplicado';
go

-- 18. AVG: precio promedio de las materias --
select avg(precio) as precio_promedio_materias
from materia;
go

-- 19. MIN: materia con el precio mas bajo --
select min(precio) as precio_minimo
from materia;
go

-- 20. MAX: materia con el precio mas alto --
select max(precio) as precio_maximo
from materia;
go

-- 21. INNER JOIN: estudiantes con su carrera y estado de inscripcion --
select
    e.cedula,
    e.nombre,
    e.apellido_1,
    c.nombre as carrera,
    es.nombre as estado_inscripcion
from inscripcion i
inner join estudiante e on i.id_estudiante = e.id_estudiante
inner join carrera c on i.id_carrera = c.id_carrera
inner join estado es on i.id_estado = es.id_estado
order by e.apellido_1;
go

-- 22. LEFT JOIN: mostrar todas las matriculas aunque no tengan pagos --
select
    m.id_matricula,
    m.precio_final,
    m.balance_actual,
    p.id_pago,
    p.cantidad,
    p.estado as estado_pago
from matricula m
left join pago p on m.id_matricula = p.id_matricula
order by m.id_matricula;
go

-- 23. RIGHT JOIN: mostrar todas las matriculas desde la tabla pago --
select
    m.id_matricula,
    m.estado as estado_matricula,
    p.id_pago,
    p.cantidad,
    p.metodo
from pago p
right join matricula m on p.id_matricula = m.id_matricula
order by m.id_matricula;
go

-- 24. Subconsulta: materias con precio mayor al promedio --
select nombre, precio
from materia
where precio > (
    select avg(precio)
    from materia
)
order by precio desc;
go

-- 25. Subconsulta: estudiantes con matriculas superiores al precio promedio --
select e.nombre, e.apellido_1, m.precio_final
from estudiante e
inner join inscripcion i on e.id_estudiante = i.id_estudiante
inner join matricula m on i.id_inscripcion = m.id_inscripcion
where m.precio_final > (
    select avg(precio_final)
    from matricula
)
order by m.precio_final desc;
go

-- 26. Consulta de clases matriculadas por estudiante --
select
    e.nombre,
    e.apellido_1,
    ma.nombre as materia,
    c.grupo,
    cu.nombre as cuatrimestre,
    cu.anio
from matricula_clase mc
inner join matricula m on mc.id_matricula = m.id_matricula
inner join inscripcion i on m.id_inscripcion = i.id_inscripcion
inner join estudiante e on i.id_estudiante = e.id_estudiante
inner join clase c on mc.id_clase = c.id_clase
inner join materia ma on c.id_materia = ma.id_materia
inner join cuatrimestre cu on c.id_cuatrimestre = cu.id_cuatrimestre
order by e.apellido_1, ma.nombre;
go

-- 27. Cantidad de estudiantes matriculados por clase --
select
    c.id_clase,
    ma.nombre as materia,
    c.grupo,
    count(mc.id_matricula) as estudiantes_matriculados,
    c.cupo
from clase c
inner join materia ma on c.id_materia = ma.id_materia
left join matricula_clase mc on c.id_clase = mc.id_clase
group by c.id_clase, ma.nombre, c.grupo, c.cupo
order by estudiantes_matriculados desc;
go

-- 28. Total pagado por cada matricula --
select
    m.id_matricula,
    m.precio_final,
    isnull(sum(case when p.estado = 'Aplicado' then p.cantidad else 0 end), 0) as total_pagado,
    m.balance_actual
from matricula m
left join pago p on m.id_matricula = p.id_matricula
group by m.id_matricula, m.precio_final, m.balance_actual
order by m.id_matricula;
go

-- 29. Historico de becas de cada estudiante --
select
    e.nombre,
    e.apellido_1,
    b.porcentaje_materia,
    b.porcentaje_matricula,
    b.estado,
    b.fecha_inicio,
    b.fecha_fin
from beca b
inner join inscripcion i on b.id_inscripcion = i.id_inscripcion
inner join estudiante e on i.id_estudiante = e.id_estudiante
order by e.apellido_1, b.fecha_inicio;
go

-- 30. Carreras y cantidad de estudiantes inscritos --
select
    c.nombre as carrera,
    count(i.id_inscripcion) as cantidad_inscritos
from carrera c
left join inscripcion i on c.id_carrera = i.id_carrera
group by c.nombre
order by cantidad_inscritos desc;
go