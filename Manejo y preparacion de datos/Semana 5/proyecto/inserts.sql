use SistemaMatricula;
go

-- registros de provincia --
insert into provincia (nombre_provincia)
values
('San Jose'),
('Alajuela'),
('Cartago'),
('Heredia');
go

-- registros de canton --
insert into canton (id_provincia, nombre)
values
(1, 'San Jose'),
(1, 'Escazu'),
(2, 'Alajuela'),
(2, 'San Ramon'),
(3, 'Cartago'),
(4, 'Heredia');
go

-- registros de distrito --
insert into distrito (id_canton, nombre)
values
(1, 'Carmen'),
(1, 'San Sebastian'),
(2, 'Escazu'),
(3, 'Alajuela'),
(4, 'San Ramon'),
(5, 'Oriental'),
(6, 'Heredia'),
(6, 'San Francisco');
go

-- registros de estudiante --
insert into estudiante
(id_distrito, cedula, nombre, apellido_1, apellido_2, fecha_nacimiento, direccion_detallada, numero_telefono)
values
(1, '118010101', 'Daniel', 'Rojas', 'Mora', '2002-03-15', 'Barrio Escalante, casa 12', '8888-1001'),
(2, '118020202', 'Maria', 'Fernandez', 'Soto', '2001-07-22', 'San Sebastian, avenida 4', '8888-1002'),
(3, '118030303', 'Carlos', 'Jimenez', 'Vega', '2000-11-05', 'Escazu centro, casa 8', '8888-1003'),
(4, '218040404', 'Andrea', 'Vargas', 'Ruiz', '2003-01-18', 'Alajuela centro, calle 5', '8888-1004'),
(5, '218050505', 'Luis', 'Castro', null, '1999-09-30', 'San Ramon, barrio Los Angeles', '8888-1005'),
(6, '318060606', 'Sofia', 'Navarro', 'Leon', '2002-12-12', 'Cartago centro, avenida 2', '8888-1006'),
(7, '418070707', 'Jose', 'Mendez', 'Arias', '2001-05-08', 'Heredia centro, casa 20', '8888-1007'),
(8, '418080808', 'Valeria', 'Salas', 'Campos', '2004-04-26', 'San Francisco de Heredia', '8888-1008'),
(2, '118090909', 'Kevin', 'Alfaro', 'Rojas', '2000-08-14', 'San Sebastian, calle 10', null),
(6, '318101010', 'Natalia', 'Quesada', 'Solano', '2003-06-03', 'Cartago, barrio El Molino', '8888-1010');
go

-- registros de profesor --
insert into profesor
(id_distrito, cedula, nombre, apellido_1, apellido_2, fecha_nacimiento, direccion_detallada, numero_telefono)
values
(1, '110101010', 'Roberto', 'Campos', 'Mora', '1980-02-10', 'San Jose centro', '8777-2001'),
(3, '110202020', 'Laura', 'Sanchez', 'Vega', '1985-06-20', 'Escazu centro', '8777-2002'),
(4, '210303030', 'Miguel', 'Herrera', 'Ruiz', '1978-10-12', 'Alajuela centro', '8777-2003'),
(7, '410404040', 'Patricia', 'Lopez', 'Arias', '1982-01-05', 'Heredia centro', '8777-2004'),
(6, '310505050', 'Fernando', 'Mora', 'Solis', '1975-09-18', 'Cartago centro', '8777-2005'),
(8, '410606060', 'Gabriela', 'Araya', null, '1988-04-27', 'San Francisco de Heredia', null);
go

-- estados de la inscripcion --
insert into estado (nombre)
values
('Activo'),
('Inactivo'),
('Abandono');
go

-- registros de sede --
insert into sede (nombre)
values
('Sede Central'),
('Sede Alajuela'),
('Sede Cartago');
go

-- registros de acreditadora --
insert into acreditadora (nombre)
values
('SINAES'),
('Agencia Universitaria de Calidad');
go

-- registros de acreditacion --
insert into acreditacion (id_acreditadora, nombre)
values
(1, 'Acreditacion de Ingenieria'),
(1, 'Acreditacion de Ciencias Empresariales'),
(2, 'Acreditacion de Ciencias Sociales');
go

-- registros de titulo --
insert into titulo (id_acreditacion, nombre)
values
(1, 'Bachillerato en Ingenieria de Sistemas'),
(2, 'Bachillerato en Administracion'),
(null, 'Bachillerato en Contaduria'),
(3, 'Licenciatura en Derecho'),
(null, 'Diplomado en Diseno Digital');
go

-- registros de carrera --
insert into carrera (id_sede, id_titulo, nombre)
values
(1, 1, 'Ingenieria de Sistemas'),
(2, 2, 'Administracion de Empresas'),
(1, 3, 'Contaduria Publica'),
(3, 4, 'Derecho'),
(2, 5, 'Diseno Digital');
go

-- registros de plan de estudio --
insert into plan_estudio
(id_carrera, nombre, fecha_creacion, fecha_descontinuacion, fecha_cierre_registros)
values
(1, 'Plan Sistemas 2025', '2025-01-01', null, null),
(2, 'Plan Administracion 2025', '2025-01-01', null, null),
(3, 'Plan Contaduria 2024', '2024-01-01', null, null),
(4, 'Plan Derecho 2025', '2025-01-01', null, null),
(5, 'Plan Diseno 2025', '2025-01-01', null, null),
(1, 'Plan Sistemas 2020', '2020-01-01', '2024-12-31', '2025-03-31');
go

-- registros de materia --
insert into materia (nombre, creditos, precio)
values
('Programacion I', 4, 85000.00),
('Base de Datos I', 4, 90000.00),
('Matematica General', 3, 70000.00),
('Administracion General', 3, 72000.00),
('Contabilidad I', 4, 80000.00),
('Derecho Civil I', 4, 88000.00),
('Diseno Grafico I', 3, 76000.00),
('Ingles I', 2, 60000.00),
('Estadistica I', 3, 75000.00),
('Programacion II', 4, 95000.00),
('Mercadeo', 3, 74000.00),
('Auditoria I', 4, 92000.00),
('Derecho Penal I', 4, 90000.00),
('Animacion Digital', 4, 98000.00),
('Etica Profesional', 2, 55000.00);
go

-- registros de plan de estudio y materia --
insert into plan_estudio_materia (id_plan_estudio, id_materia)
values
(1, 1), (1, 2), (1, 3), (1, 8), (1, 9), (1, 10), (1, 15),
(2, 3), (2, 4), (2, 8), (2, 9), (2, 11), (2, 15),
(3, 3), (3, 5), (3, 8), (3, 9), (3, 12), (3, 15),
(4, 6), (4, 8), (4, 13), (4, 15),
(5, 7), (5, 8), (5, 14), (5, 15),
(6, 1), (6, 2), (6, 3), (6, 8);
go

-- registros de aula --
insert into aula (nombre)
values
('Aula 101'),
('Aula 102'),
('Laboratorio 1'),
('Laboratorio 2'),
('Aula 201'),
('Aula 202');
go

-- dias de la semana --
insert into dia_semana (id_dia_semana, nombre)
values
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sabado'),
(7, 'Domingo');
go

-- meses --
insert into mes (id_mes, nombre)
values
(1, 'Enero'),
(2, 'Febrero'),
(3, 'Marzo'),
(4, 'Abril'),
(5, 'Mayo'),
(6, 'Junio'),
(7, 'Julio'),
(8, 'Agosto'),
(9, 'Septiembre'),
(10, 'Octubre'),
(11, 'Noviembre'),
(12, 'Diciembre');
go

-- registros de cuatrimestre --
insert into cuatrimestre (nombre, anio)
values
('Primer Cuatrimestre', 2025),
('Segundo Cuatrimestre', 2025),
('Tercer Cuatrimestre', 2025),
('Primer Cuatrimestre', 2026);
go

-- registros de cuatrimestre y mes --
insert into cuatrimestre_mes (id_cuatrimestre, id_mes)
values
(1, 1), (1, 2), (1, 3), (1, 4),
(2, 5), (2, 6), (2, 7), (2, 8),
(3, 9), (3, 10), (3, 11), (3, 12),
(4, 1), (4, 2), (4, 3), (4, 4);
go

-- registros de clase --
insert into clase
(id_materia, id_profesor, id_aula, id_cuatrimestre, grupo, estado, cupo)
values
(1, 1, 1, 4, 'SIS-01', 'Activa', 30),
(2, 2, 2, 4, 'SIS-02', 'Activa', 25),
(3, 3, 3, 4, 'GEN-01', 'Activa', 35),
(4, 4, 4, 4, 'ADM-01', 'Activa', 30),
(5, 5, 5, 4, 'CON-01', 'Activa', 25),
(6, 6, 6, 4, 'DER-01', 'Activa', 30),
(7, 1, 1, 4, 'DIS-01', 'Activa', 20),
(8, 2, 2, 4, 'GEN-02', 'Cerrada', 30),
(9, 3, 3, 3, 'EST-01', 'Cerrada', 30),
(10, 1, 4, 4, 'SIS-03', 'Activa', 25),
(11, 4, 5, 4, 'ADM-02', 'Cancelada', 25),
(12, 5, 6, 4, 'CON-02', 'Activa', 20),
(13, 6, 1, 4, 'DER-02', 'Activa', 25),
(14, 2, 2, 4, 'DIS-02', 'Activa', 20),
(15, 3, 3, 4, 'GEN-03', 'Activa', 40);
go

-- registros de horario --
insert into horario (id_clase, id_dia_semana, hora_inicio, hora_final)
values
(1, 1, '18:00', '20:00'),
(2, 3, '18:00', '20:00'),
(3, 2, '08:00', '10:00'),
(4, 4, '18:00', '20:00'),
(5, 1, '17:00', '19:00'),
(6, 5, '18:00', '21:00'),
(7, 6, '09:00', '12:00'),
(8, 2, '10:00', '12:00'),
(9, 3, '08:00', '10:00'),
(10, 5, '18:00', '21:00'),
(11, 4, '16:00', '18:00'),
(12, 6, '13:00', '16:00'),
(13, 2, '18:00', '21:00'),
(14, 6, '09:00', '12:00'),
(15, 3, '14:00', '16:00');
go

-- registros de inscripcion --
insert into inscripcion
(id_estudiante, id_carrera, id_estado, fecha_inscripcion)
values
(1, 1, 1, '2025-01-10'),
(2, 1, 1, '2025-01-12'),
(3, 2, 1, '2025-02-05'),
(4, 3, 2, '2024-05-20'),
(5, 4, 1, '2025-03-01'),
(6, 5, 3, '2025-01-18'),
(7, 1, 1, '2025-06-15'),
(8, 2, 1, '2025-07-22'),
(9, 3, 1, '2025-08-09'),
(10, 4, 2, '2025-09-11');
go

-- registros de beca --
insert into beca
(id_inscripcion, porcentaje_materia, porcentaje_matricula, estado, fecha_inicio, fecha_fin)
values
(1, 25.00, 50.00, 'Activa', '2025-01-10', null),
(2, 0.00, 30.00, 'Activa', '2025-01-12', null),
(3, 20.00, 20.00, 'Finalizada', '2025-02-05', '2025-12-31'),
(3, 40.00, 40.00, 'Activa', '2026-01-01', null),
(5, 50.00, 100.00, 'Activa', '2025-03-01', null),
(7, 10.00, 20.00, 'Finalizada', '2025-06-15', '2025-12-31'),
(7, 25.00, 25.00, 'Activa', '2026-01-01', null),
(9, 100.00, 100.00, 'Activa', '2025-08-09', null);
go

-- registros de matricula --
insert into matricula
(id_inscripcion, id_beca, fecha_matricula, estado, precio_matricula, descuento_matricula,
 precio_materias, descuento_materias, precio_final, balance_actual)
values
(1, 1, '2026-01-15', 'Activa', 50000.00, 25000.00, 245000.00, 61250.00, 208750.00, 108750.00),
(2, 2, '2026-01-16', 'Pagada', 50000.00, 15000.00, 235000.00, 0.00, 270000.00, 0.00),
(3, 4, '2026-01-17', 'Activa', 50000.00, 20000.00, 221000.00, 88400.00, 162600.00, 62600.00),
(4, null, '2026-01-18', 'Activa', 50000.00, 0.00, 172000.00, 0.00, 222000.00, 122000.00),
(5, 5, '2026-01-19', 'Pagada', 50000.00, 50000.00, 233000.00, 116500.00, 116500.00, 0.00),
(6, null, '2026-01-20', 'Pendiente', 50000.00, 0.00, 174000.00, 0.00, 224000.00, 224000.00),
(7, 7, '2026-01-21', 'Activa', 50000.00, 12500.00, 250000.00, 62500.00, 225000.00, 125000.00),
(8, null, '2026-01-22', 'Activa', 50000.00, 0.00, 146000.00, 0.00, 196000.00, 96000.00),
(9, 8, '2026-01-23', 'Pagada', 50000.00, 50000.00, 227000.00, 227000.00, 0.00, 0.00),
(10, null, '2026-01-24', 'Pendiente', 50000.00, 0.00, 178000.00, 0.00, 228000.00, 178000.00);
go

-- registros de matricula y clase --
insert into matricula_clase (id_matricula, id_clase)
values
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 2), (2, 8),
(3, 4), (3, 9), (3, 11),
(4, 5), (4, 12),
(5, 6), (5, 13), (5, 15),
(6, 7), (6, 14),
(7, 1), (7, 3), (7, 10),
(8, 4), (8, 11),
(9, 5), (9, 12), (9, 15),
(10, 6), (10, 13);
go

-- registros de pago --
insert into pago
(id_matricula, nombre, cantidad, fecha_pago, referencia, estado, metodo)
values
(1, 'Primer abono', 50000.00, '2026-01-20 10:30:00', 'TR-1001', 'Aplicado', 'Transferencia'),
(1, 'Segundo abono', 50000.00, '2026-02-10 14:15:00', 'TR-1010', 'Aplicado', 'Transferencia'),
(2, 'Pago completo', 270000.00, '2026-01-16 09:45:00', 'TC-2001', 'Aplicado', 'Tarjeta'),
(3, 'Primer abono', 100000.00, '2026-01-25 11:00:00', null, 'Aplicado', 'Efectivo'),
(4, 'Primer abono', 100000.00, '2026-02-01 08:30:00', 'TR-4001', 'Aplicado', 'Transferencia'),
(5, 'Pago completo', 116500.00, '2026-01-19 16:10:00', 'TC-5001', 'Aplicado', 'Tarjeta'),
(7, 'Primer abono', 100000.00, '2026-02-05 13:20:00', 'TR-7001', 'Aplicado', 'Transferencia'),
(8, 'Primer abono', 100000.00, '2026-02-07 12:00:00', null, 'Aplicado', 'Efectivo'),
(10, 'Abono pendiente', 50000.00, '2026-02-08 15:40:00', 'TR-10001', 'Pendiente', 'Transferencia');
go