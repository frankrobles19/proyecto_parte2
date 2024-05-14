CREATE TABLE IF NOT EXISTS alumno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    id_ciudad INT NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_sexo INT NOT NULL,
    CONSTRAINT fk_id_sexo_alumno FOREIGN KEY (id_sexo)
        REFERENCES tipo_sexo(id),
    CONSTRAINT fk_id_ciudad_alumno FOREIGN KEY (id_ciudad)
        REFERENCES ciudad(id)
);

CREATE TABLE IF NOT EXISTS alumno_se_matricula_asignatura (
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    id_curso_escolar INT NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    CONSTRAINT fk_id_alumno FOREIGN KEY (id_alumno)
        REFERENCES alumno(id),
    CONSTRAINT fk_id_asignatura FOREIGN KEY (id_asignatura)
        REFERENCES asignatura(id),
    CONSTRAINT fk_id_curso_escolar FOREIGN KEY (id_curso_escolar)
        REFERENCES curso_escolar(id)
);

CREATE TABLE IF NOT EXISTS asignatura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos DOUBLE NOT NULL,
    id_tipo_asignatura INT NOT NULL,
    id_curso INT NOT NULL,
    id_cuatrimestre INT NOT NULL,
    id_profesor INT,
    id_grado INT NOT NULL,
    CONSTRAINT fk_id_cuatrimestre FOREIGN KEY (id_cuatrimestre)
        REFERENCES cuatrimestre(id),
    CONSTRAINT fk_id_curso FOREIGN KEY (id_curso)
        REFERENCES curso(id),
    CONSTRAINT fk_id_grado FOREIGN KEY (id_grado)
        REFERENCES grado(id),
    CONSTRAINT fk_id_profesor_asignatura FOREIGN KEY (id_profesor)
        REFERENCES profesor(id),
    CONSTRAINT fk_id_tipo_asignatura FOREIGN KEY (id_tipo_asignatura)
        REFERENCES tipo_asignatura(id)
);

CREATE TABLE IF NOT EXISTS ciudad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS cuatrimestre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS curso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS curso_escolar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    año_inicio DATE NOT NULL,
    año_fin DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS departamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS direccion_alumno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(30) NOT NULL,
    id_alumno INT NOT NULL,
    CONSTRAINT fk_id_alumno_dir_alumno FOREIGN KEY (id_alumno)
        REFERENCES alumno(id)
);

CREATE TABLE IF NOT EXISTS direccion_profesor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(25) NOT NULL,
    id_profesor INT NOT NULL,
    CONSTRAINT fk_id_profesor_direccion FOREIGN KEY (id_profesor)
        REFERENCES profesor(id)
);

CREATE TABLE IF NOT EXISTS grado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS nif_alumno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(30) NOT NULL,
    id_alumno INT NOT NULL,
    CONSTRAINT fk_id_alumno_nif FOREIGN KEY (id_alumno)
        REFERENCES alumno(id)
);

CREATE TABLE IF NOT EXISTS nif_profesor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(30) NOT NULL,
    id_profesor INT NOT NULL,
    CONSTRAINT fk_id_profesor FOREIGN KEY (id_profesor)
        REFERENCES profesor(id)
);

CREATE TABLE IF NOT EXISTS profesor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    id_ciudad INT NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_sexo INT NOT NULL,
    CONSTRAINT fk_id_ciudad FOREIGN KEY (id_ciudad)
        REFERENCES ciudad(id),
    CONSTRAINT fk_id_sexo FOREIGN KEY (id_sexo)
        REFERENCES tipo_sexo(id)
);

CREATE TABLE IF NOT EXISTS telefono_alumno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero DECIMAL NOT NULL,
    id_alumno INT NOT NULL,
    id_tipo_telefono INT NOT NULL,
    CONSTRAINT fk_id_alumno_tel FOREIGN KEY (id_alumno)
        REFERENCES alumno(id),
    CONSTRAINT fk_id_tipo_telefono_alumno FOREIGN KEY (id_tipo_telefono)
        REFERENCES tipo_telefono(id)
);

CREATE TABLE IF NOT EXISTS telefono_profesor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero DECIMAL NOT NULL,
    id_profesor INT NOT NULL,
    id_tipo_telefono INT NOT NULL,
    CONSTRAINT fk_id_profesor_telofono FOREIGN KEY (id_profesor)
        REFERENCES profesor(id),
    CONSTRAINT fk_id_tipo_telefono FOREIGN KEY (id_tipo_telefono)
        REFERENCES tipo_telefono(id)
);

CREATE TABLE IF NOT EXISTS tipo_asignatura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS tipo_sexo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS tipo_telefono (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
