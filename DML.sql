

INSERT INTO alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1);


INSERT INTO direccion_alumno (direccion, id_alumno) VALUES
('Calle Mayor 123', 1),
('Av. Diagonal 456', 2),
('Plaza del Carmen 789', 3),
('C/ Gran Vía 987', 4),
('Paseo de Gracia 654', 5);


INSERT INTO direccion_profesor (direccion, id_profesor) VALUES
('C/ Mayor 456', 1),
('Av. Diagonal 789', 2),
('C/ Serrano 123', 3),
('Plaza Mayor 345', 4),
('C/ Alcalá 678', 5);


INSERT INTO grado (nombre) VALUES
('Ingeniería Informática'),
('Matemáticas'),
('Física');


INSERT INTO nif_alumno (nif, id_alumno) VALUES
('12345678A', 1),
('23456789B', 2),
('34567890C', 3),
('45678901D', 4),
('56789012E', 5);


INSERT INTO nif_profesor (nif, id_profesor) VALUES
('12345678A', 1),
('23456789B', 2),
('34567890C', 3),
('45678901D', 4),
('56789012E', 5);


INSERT INTO telefono_profesor (numero, id_profesor, id_tipo_telefono) VALUES
(666777888, 1, 1),
(777888999, 2, 2),
(555666777, 3, 1);


INSERT INTO alumno (nombre, apellido1, apellido2, id_ciudad, fecha_nacimiento, id_sexo) VALUES
('María', 'García', 'López', 1, '1999-03-15', 2),
('Juan', 'Martínez', 'Sánchez', 2, '2000-05-20', 1),
('Ana', 'Hernández', 'Pérez', 3, '1999-07-10', 2),
('Pedro', 'Rodríguez', 'Gómez', 1, '1998-12-05', 1),
('Laura', 'Díaz', 'Fernández', 2, '1999-09-25', 2);


INSERT INTO ciudad (nombre) VALUES
('Madrid'),
('Barcelona'),
('Valencia');


INSERT INTO tipo_sexo (nombre) VALUES
('Masculino'),
('Femenino');


INSERT INTO profesor (nombre, apellido1, apellido2, id_ciudad, fecha_nacimiento, id_sexo) VALUES
('Carlos', 'Ruiz', 'Gómez', 1, '1975-06-20', 1),
('Sofía', 'López', 'Martínez', 2, '1980-03-12', 2),
('Pablo', 'González', 'Fernández', 3, '1982-09-05', 1),
('Elena', 'Martín', 'Sanz', 1, '1978-11-30', 2),
('Alejandro', 'Díaz', 'Pérez', 2, '1985-07-15', 1);


INSERT INTO telefono_alumno (numero, id_alumno, id_tipo_telefono) VALUES
(666555444, 1, 1),
(777888999, 2, 2),
(555444333, 3, 1);




INSERT INTO cuatrimestre (nombre) VALUES
('Primer Cuatrimestre'),
('Segundo Cuatrimestre');


INSERT INTO curso (nombre) VALUES
('2018/2019'),
('2019/2020');


INSERT INTO curso_escolar (año_inicio, año_fin) VALUES
('2018-09-01', '2019-06-30'),
('2019-09-01', '2020-06-30');


INSERT INTO departamento (nombre) VALUES
('Departamento de Matemáticas'),
('Departamento de Física'),
('Departamento de Informática');

INSERT INTO tipo_asignatura (nombre) VALUES
('Obligatoria'),
('Optativa');


INSERT INTO tipo_telefono (nombre) VALUES
('Móvil'),
('Fijo');