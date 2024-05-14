# SCHOOLDB

## Consultas sobre una tabla

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de
    todos los alumnos. El listado deberá estar ordenado alfabéticamente de
    menor a mayor por el primer apellido, segundo apellido y nombre.

  ```sql
  SELECT a.apellido1, a.apellido2, a.nombre 
  FROM alumno AS a
  ORDER BY a.apellido1 ASC, a.apellido2 ASC, a.nombre ASC;
  +-----------+-----------+--------+
  | apellido1 | apellido2 | nombre |
  +-----------+-----------+--------+
  | Díaz      | Fernández | Laura  |
  | Díaz      | Fernández | Laura  |
  | García    | López     | María  |
  | García    | López     | María  |
  | Hernández | Pérez     | Ana    |
  | Hernández | Pérez     | Ana    |
  | Martínez  | Sánchez   | Juan   |
  | Martínez  | Sánchez   | Juan   |
  | Rodríguez | Gómez     | Pedro  |
  | Rodríguez | Gómez     | Pedro  |
  +-----------+-----------+--------+
  ```

  

2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de
    alta su número de teléfono en la base de datos.

  ```sql
  SELECT a.nombre, a.apellido1, a.apellido2
  FROM alumno as a
  INNER JOIN telefono_alumno as ta ON a.id = id_alumno
  WHERE id_alumno is NOT NULL;
  +--------+-----------+-----------+
  | nombre | apellido1 | apellido2 |
  +--------+-----------+-----------+
  | María  | García    | López     |
  | Juan   | Martínez  | Sánchez   |
  | Ana    | Hernández | Pérez     |
  +--------+-----------+-----------+
  ```

  

3. Devuelve el listado de los alumnos que nacieron en 1999.

   ```sql
   select a.id, a.nombre, a.apellido1, a.apellido2, a.id_ciudad, a.fecha_nacimiento, a.id_sexo
   FROM alumno as a
   WHERE YEAR(fecha_nacimiento) = 1999;
   +----+--------+-----------+-----------+-----------+------------------+---------+
   | id | nombre | apellido1 | apellido2 | id_ciudad | fecha_nacimiento | id_sexo |
   +----+--------+-----------+-----------+-----------+------------------+---------+
   |  1 | María  | García    | López     |         1 | 1999-03-15       |       2 |
   |  3 | Ana    | Hernández | Pérez     |         3 | 1999-07-10       |       2 |
   |  5 | Laura  | Díaz      | Fernández |         2 | 1999-09-25       |       2 |
   |  6 | María  | García    | López     |         1 | 1999-03-15       |       2 |
   |  8 | Ana    | Hernández | Pérez     |         3 | 1999-07-10       |       2 |
   | 10 | Laura  | Díaz      | Fernández |         2 | 1999-09-25       |       2 |
   +----+--------+-----------+-----------+-----------+------------------+---------+
   ```

   

4. Devuelve el listado de profesores que no han dado de alta su número de
    teléfono en la base de datos y además su nif termina en K.

  ```sql
  SELECT p.id, p.nombre, p.apellido1, p.apellido2, p.id_ciudad, p.fecha_nacimiento, p.id_sexo, p.id_departamento
  from profesor as p
  INNER JOIN telefono_profesor as tp ON p.id = tp.id_profesor
  INNER JOIN nif_profesor as nifp ON p.id = nifp.id_profesor
  WHERE tp.id_profesor is NOT NULL;
  +----+--------+-----------+-----------+-----------+------------------+---------+-----------------+
  | id | nombre | apellido1 | apellido2 | id_ciudad | fecha_nacimiento | id_sexo | id_departamento |
  +----+--------+-----------+-----------+-----------+------------------+---------+-----------------+
  |  1 | Carlos | Ruiz      | Gómez     |         1 | 1975-06-20       |       1 |               1 |
  |  2 | Sofía  | López     | Martínez  |         2 | 1980-03-12       |       2 |               2 |
  |  3 | Pablo  | González  | Fernández |         3 | 1982-09-05       |       1 |               3 |
  +----+--------+-----------+-----------+-----------+------------------+---------+-----------------+
  ```

  

5. Devuelve el listado de las asignaturas que se imparten en el primer
    cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

  ```sql
  SELECT asg.nombre
  FROM asignatura as asg
  INNER JOIN cuatrimestre as cuat on asg.id_cuatrimestre = cuat.id 
  INNER JOIN curso as c on asg.id_curso = c.id
  WHERE cuat.id = '1' and c.id = '7';
  ```

  

  ## Consultas multitabla (Composición interna)

6. Devuelve un listado con los datos de todas las alumnas que se han
    matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

  ```sql
  SELECT alumno.*
  FROM alumno
  INNER JOIN alumno_se_matricula_asignatura ON alumno.id = alumno_se_matricula_asignatura.id_alumno
  INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
  INNER JOIN grado ON asignatura.id_grado = grado.id
  INNER JOIN tipo_sexo ON alumno.id_sexo = tipo_sexo.id
  WHERE tipo_sexo.nombre = 'Femenino'
  AND grado.nombre = 'Ingeniería Informática';
  
  ```

  

7. Devuelve un listado con todas las asignaturas ofertadas en el Grado en
    Ingeniería Informática (Plan 2015).

  ```sql
  SELECT a.nombre
  FROM asignatura as a
  INNER JOIN grado as g on a.id_grado = g.id
  WHERE g.nombre = 'Ingeniería Informática';
  +--------------+
  | nombre       |
  +--------------+
  | Matemáticas  |
  | Programación |
  | Historia     |
  +--------------+
  ```

  

8. Devuelve un listado de los profesores junto con el nombre del
    departamento al que están vinculados. El listado debe devolver cuatro
    columnas, primer apellido, segundo apellido, nombre y nombre del
    departamento. El resultado estará ordenado alfabéticamente de menor a
    mayor por los apellidos y el nombre.

  ```sql
  SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_departamento
  FROM profesor AS p
  INNER JOIN departamento AS d ON p.id_departamento = d.id
  ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
  
  +-----------+-----------+-----------+-----------------------------+
  | apellido1 | apellido2 | nombre    | nombre_departamento         |
  +-----------+-----------+-----------+-----------------------------+
  | Díaz      | Pérez     | Alejandro | Departamento de Informática |
  | González  | Fernández | Pablo     | Departamento de Informática |
  | López     | Martínez  | Sofía     | Departamento de Física      |
  | Martín    | Sanz      | Elena     | Departamento de Física      |
  | Ruiz      | Gómez     | Carlos    | Departamento de Matemáticas |
  +-----------+-----------+-----------+-----------------------------+
  ```

  

9. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de
    fin del curso escolar del alumno con nif 26902806M.

  ```sql
  SELECT asg.nombre, cs.año_inicio, cs.año_fin
  FROM alumno as a
  INNER JOIN nif_alumno as nifa on a.id = nifa.id_alumno
  INNER JOIN alumno_se_matricula_asignatura as asm on a.id = asm.id_alumno
  INNER JOIN asignatura as asg on asm.id_asignatura = asg.id
  INNER JOIN curso_escolar as cs on asm.id_curso_escolar = cs.id
  WHERE nifa.nif = '26902806M';
  ```

  

10. Devuelve un listado con el nombre de todos los departamentos que tienen
    profesores que imparten alguna asignatura en el Grado en Ingeniería
    Informática (Plan 2015).

  ```sql
  SELECT  d.id, d.nombre
  FROM profesor as p
  INNER JOIN departamento as d on p.id_departamento = d.id
  INNER JOIN asignatura as asg on p.id = asg.id_profesor
  INNER JOIN grado as g on asg.id_grado = g.id
  WHERE g.nombre = 'Ingeniería Informática';
  +----+-----------------------------+
  | id | nombre                      |
  +----+-----------------------------+
  |  1 | Departamento de Matemáticas |
  |  3 | Departamento de Informática |
  +----+-----------------------------+
  ```

  

11. Devuelve un listado con todos los alumnos que se han matriculado en
      alguna asignatura durante el curso escolar 2018/2019.

   ```sql
   SELECT  al.nombre
   FROM alumno as al
   INNER JOIN alumno_se_matricula_asignatura as asm on al.id = asm.id_alumno
   INNER JOIN curso_escolar as cs on asm.id_curso_escolar = cs.id
   WHERE cs.id = 1;
   +--------+
   | nombre |
   +--------+
   | María  |
   | Ana    |
   | Laura  |
   +--------+
   ```

   

   ## Consultas multitabla (Composición externa)

   Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

12. Devuelve un listado con los nombres de todos los profesores y los
      departamentos que tienen vinculados. El listado también debe mostrar
      aquellos profesores que no tienen ningún departamento asociado. El listado
      debe devolver cuatro columnas, nombre del departamento, primer apellido,
      segundo apellido y nombre del profesor. El resultado estará ordenado
      alfabéticamente de menor a mayor por el nombre del departamento,
      apellidos y el nombre.

   ```sql
   SELECT 
       d.nombre AS nombre_departamento, 
       p.apellido1, 
       p.apellido2, 
       p.nombre AS nombre_profesor 
   FROM 
       profesor AS p 
   LEFT JOIN 
       departamento AS d ON p.id_departamento = d.id 
   ORDER BY 
       nombre_departamento, 
       p.apellido1, 
       p.apellido2, 
       p.nombre;
   +-----------------------------+-----------+-----------+-----------------+
   | nombre_departamento         | apellido1 | apellido2 | nombre_profesor |
   +-----------------------------+-----------+-----------+-----------------+
   | NULL                        | Díaz      | Pérez     | Alejandro       |
   | NULL                        | González  | Fernández | Pablo           |
   | NULL                        | López     | Martínez  | Sofía           |
   | NULL                        | Martín    | Sanz      | Elena           |
   | NULL                        | Ruiz      | Gómez     | Carlos          |
   | Departamento de Física      | López     | Martínez  | Sofía           |
   | Departamento de Física      | Martín    | Sanz      | Elena           |
   | Departamento de Informática | Díaz      | Pérez     | Alejandro       |
   | Departamento de Informática | González  | Fernández | Pablo           |
   | Departamento de Matemáticas | Ruiz      | Gómez     | Carlos          |
   +-----------------------------+-----------+-----------+-----------------+
   ```

   

13. Devuelve un listado con los profesores que no están asociados a un
      departamento.

   ```sql
   SELECT p.nombre
   FROM profesor as p
   LEFT JOIN departamento as d on p.id_departamento = d.id
   WHERE d.id is null;
   +-----------+
   | nombre    |
   +-----------+
   | Carlos    |
   | Sofía     |
   | Pablo     |
   | Elena     |
   | Alejandro |
   +-----------+
   ```

   

14. Devuelve un listado con los departamentos que no tienen profesores
      asociados.

   ```sql
   SELECT d.nombre
   FROM profesor as p
   RIGHT JOIN departamento as d on p.id_departamento = d.id
   WHERE p.id_departamento is null;
   +-----------------------------+
   | nombre                      |
   +-----------------------------+
   | Departamento de Matemáticas |
   | Departamento de Física      |
   | Departamento de Informática |
   +-----------------------------+
   ```

   

15. Devuelve un listado con los profesores que no imparten ninguna asignatura.

    ```sql
    SELECT p.nombre
    FROM profesor as p
    LEFT JOIN asignatura as asg on p.id = asg.id_profesor
    WHERE asg.id_profesor is null;
    +-----------+
    | nombre    |
    +-----------+
    | Alejandro |
    | Carlos    |
    | Sofía     |
    | Pablo     |
    | Elena     |
    | Alejandro |
    +-----------+
    ```

    

16. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

    ```sql
    SELECT asg.nombre
    FROM profesor as p
    RIGHT JOIN asignatura as asg on p.id = asg.id_profesor
    WHERE p.id  is null;
    +----------+
    | nombre   |
    +----------+
    | Historia |
    +----------+
    ```

    

17. Devuelve un listado con todos los departamentos que tienen alguna
      asignatura que no se haya impartido en ningún curso escolar. El resultado
      debe mostrar el nombre del departamento y el nombre de la asignatura que
      no se haya impartido nunca.

   ```sql
   SELECT 
       d.nombre AS nombre_departamento, 
       a.nombre AS nombre_asignatura
   FROM 
       departamento AS d
   INNER JOIN 
       asignatura AS a ON a.id_grado = d.id
   LEFT JOIN 
       alumno_se_matricula_asignatura AS ama ON a.id = ama.id_asignatura
   LEFT JOIN 
       curso_escolar AS ce ON ama.id_curso_escolar = ce.id
   WHERE 
       ce.id IS NULL;
   
   ```

   

   ## Consultas resumen

18. Devuelve el número total de alumnas que hay.

    ```sql
    SELECT COUNT(a.id) as alumnas 
    FROM alumno as a
    INNER JOIN tipo_sexo as ts on a.id_sexo = ts.id
    WHERE ts.id = 2;
    +---------+
    | alumnas |
    +---------+
    |       6 |
    +---------+
    ```

    

19. Calcula cuántos alumnos nacieron en 1999.

    ```sql
    SELECT COUNT(a.id) as alumnos 
    FROM alumno as a
    where YEAR(a.fecha_nacimiento) = 1999;
    +---------+
    | alumnos |
    +---------+
    |       6 |
    +---------+
    ```

    

20. Calcula cuántos profesores hay en cada departamento. El resultado sólo
      debe mostrar dos columnas, una con el nombre del departamento y otra
      con el número de profesores que hay en ese departamento. El resultado
      sólo debe incluir los departamentos que tienen profesores asociados y
      deberá estar ordenado de mayor a menor por el número de profesores.

   ```sql
   SELECT 
       d.nombre AS nombre_departamento, 
       COUNT(p.id) AS cantidad_profesores
   FROM 
       departamento AS d
   INNER JOIN 
       profesor AS p ON d.id = p.id_departamento
   GROUP BY 
       d.nombre
   ORDER BY 
       cantidad_profesores DESC;
   
   +-----------------------------+---------------------+
   | nombre_departamento         | cantidad_profesores |
   +-----------------------------+---------------------+
   | Departamento de Física      |                   2 |
   | Departamento de Informática |                   2 |
   | Departamento de Matemáticas |                   1 |
   +-----------------------------+---------------------+
   ```

   

21. Devuelve un listado con todos los departamentos y el número de profesores
      que hay en cada uno de ellos. Tenga en cuenta que pueden existir
      departamentos que no tienen profesores asociados. Estos departamentos
      también tienen que aparecer en el listado.

   ```sql
   SELECT 
       d.nombre AS nombre_departamento, 
       COUNT(p.id) AS cantidad_profesores
   FROM 
       departamento AS d
   LEFT JOIN 
       profesor AS p ON d.id = p.id_departamento
   GROUP BY 
       d.nombre;
   +-----------------------------+---------------------+
   | nombre_departamento         | cantidad_profesores |
   +-----------------------------+---------------------+
   | Departamento de Matemáticas |                   1 |
   | Departamento de Física      |                   2 |
   | Departamento de Informática |                   2 |
   +-----------------------------+---------------------+
   ```

   

22. Devuelve un listado con el nombre de todos los grados existentes en la base
      de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados
      también tienen que aparecer en el listado. El resultado deberá estar
      ordenado de mayor a menor por el número de asignaturas.

   ```sql
   SELECT 
       g.nombre AS nombre_grado, 
       COUNT(a.id) AS cantidad_asignaturas
   FROM 
       grado AS g
   LEFT JOIN 
       asignatura AS a ON g.id = a.id_grado
   GROUP BY 
       g.nombre
   ORDER BY 
       cantidad_asignaturas DESC;
   
   +------------------------+----------------------+
   | nombre_grado           | cantidad_asignaturas |
   +------------------------+----------------------+
   | Ingeniería Informática |                    3 |
   | Matemáticas            |                    2 |
   | Física                 |                    0 |
   +------------------------+----------------------+
   ```

   

6. Devuelve un listado con el nombre de todos los grados existentes en la base
    de datos y el número de asignaturas que tiene cada uno, de los grados que
    tengan más de 40 asignaturas asociadas.

  ```sql
  SELECT 
      g.nombre AS nombre_grado, 
      COUNT(a.id) AS cantidad_asignaturas
  FROM 
      grado AS g
  INNER JOIN 
      asignatura AS a ON g.id = a.id_grado
  GROUP BY 
      g.nombre
  HAVING 
      COUNT(a.id) > 40
  ORDER BY 
      cantidad_asignaturas DESC;
  
  ```

  

7. Devuelve un listado que muestre el nombre de los grados y la suma del
    número total de créditos que hay para cada tipo de asignatura. El resultado
    debe tener tres columnas: nombre del grado, tipo de asignatura y la suma
    de los créditos de todas las asignaturas que hay de ese tipo. Ordene el
    resultado de mayor a menor por el número total de crédidos.

  ```sql
  SELECT 
      g.nombre AS nombre_grado,
      ta.nombre AS tipo_asignatura,
      SUM(a.creditos) AS suma_creditos
  FROM 
      grado AS g
  INNER JOIN 
      asignatura AS a ON g.id = a.id_grado
  INNER JOIN 
      tipo_asignatura AS ta ON a.id_tipo_asignatura = ta.id
  GROUP BY 
      g.nombre, ta.nombre
  ORDER BY 
      suma_creditos DESC;
  
  +------------------------+-----------------+---------------+
  | nombre_grado           | tipo_asignatura | suma_creditos |
  +------------------------+-----------------+---------------+
  | Ingeniería Informática | Obligatoria     |            13 |
  | Matemáticas            | Obligatoria     |            11 |
  | Ingeniería Informática | Optativa        |             4 |
  +------------------------+-----------------+---------------+
  ```

  

8. Devuelve un listado que muestre cuántos alumnos se han matriculado de
    alguna asignatura en cada uno de los cursos escolares. El resultado deberá
    mostrar dos columnas, una columna con el año de inicio del curso escolar y
    otra con el número de alumnos matriculados.

  ```sql
  SELECT 
      YEAR(ce.año_inicio) AS año_inicio_curso_escolar,
      COUNT(DISTINCT asm.id_alumno) AS numero_alumnos_matriculados
  FROM 
      curso_escolar AS ce
  LEFT JOIN 
      alumno_se_matricula_asignatura AS asm ON ce.id = asm.id_curso_escolar
  GROUP BY 
      año_inicio_curso_escolar
  ORDER BY 
      año_inicio_curso_escolar;
  
  +--------------------------+-----------------------------+
  | año_inicio_curso_escolar | numero_alumnos_matriculados |
  +--------------------------+-----------------------------+
  |                     2018 |                           3 |
  |                     2019 |                           2 |
  +--------------------------+-----------------------------+
  ```

  

9. Devuelve un listado con el número de asignaturas que imparte cada
    profesor. El listado debe tener en cuenta aquellos profesores que no
    imparten ninguna asignatura. El resultado mostrará cinco columnas: id,
    nombre, primer apellido, segundo apellido y número de asignaturas. El
    resultado estará ordenado de mayor a menor por el número de asignaturas.

  ```sql
  SELECT 
      p.id, 
      p.nombre, 
      p.apellido1, 
      p.apellido2, 
      COUNT(a.id) AS numero_asignaturas
  FROM 
      profesor AS p
  LEFT JOIN 
      asignatura AS a ON p.id = a.id_profesor
  GROUP BY 
      p.id, p.nombre, p.apellido1, p.apellido2
  ORDER BY 
      numero_asignaturas DESC;
  +----+-----------+-----------+-----------+--------------------+
  | id | nombre    | apellido1 | apellido2 | numero_asignaturas |
  +----+-----------+-----------+-----------+--------------------+
  |  1 | Carlos    | Ruiz      | Gómez     |                  1 |
  |  2 | Sofía     | López     | Martínez  |                  1 |
  |  3 | Pablo     | González  | Fernández |                  1 |
  |  4 | Elena     | Martín    | Sanz      |                  1 |
  |  5 | Alejandro | Díaz      | Pérez     |                  0 |
  |  6 | Carlos    | Ruiz      | Gómez     |                  0 |
  |  7 | Sofía     | López     | Martínez  |                  0 |
  |  8 | Pablo     | González  | Fernández |                  0 |
  |  9 | Elena     | Martín    | Sanz      |                  0 |
  | 10 | Alejandro | Díaz      | Pérez     |                  0 |
  +----+-----------+-----------+-----------+--------------------+
  ```

  

  ## Subconsultas

10. Devuelve todos los datos del alumno más joven.

    ```sql
    SELECT id, nombre, apellido1, apellido2, id_ciudad, fecha_nacimiento, id_sexo
    from alumno
    WHERE fecha_nacimiento = (SELECT MIN(fecha_nacimiento) from alumno);
    +----+--------+-----------+-----------+-----------+------------------+---------+
    | id | nombre | apellido1 | apellido2 | id_ciudad | fecha_nacimiento | id_sexo |
    +----+--------+-----------+-----------+-----------+------------------+---------+
    |  4 | Pedro  | Rodríguez | Gómez     |         1 | 1998-12-05       |       1 |
    |  9 | Pedro  | Rodríguez | Gómez     |         1 | 1998-12-05       |       1 |
    +----+--------+-----------+-----------+-----------+------------------+---------+
    ```

    

11. Devuelve un listado con los profesores que no están asociados a un
      departamento.

   ```sqlite
   SELECT nombre, apellido1, apellido2
   from profesor
   WHERE id_departamento is null;
   +-----------+-----------+-----------+
   | nombre    | apellido1 | apellido2 |
   +-----------+-----------+-----------+
   | Carlos    | Ruiz      | Gómez     |
   | Sofía     | López     | Martínez  |
   | Pablo     | González  | Fernández |
   | Elena     | Martín    | Sanz      |
   | Alejandro | Díaz      | Pérez     |
   +-----------+-----------+-----------+
   ```

   

12. Devuelve un listado con los departamentos que no tienen profesores
      asociados.

   ```sql
   SELECT nombre
   FROM departamento
   WHERE id not in (SELECT id_departamento from profesor);
   ```

   

13. Devuelve un listado con los profesores que tienen un departamento
      asociado y que no imparten ninguna asignatura.

   ```sql
   SELECT p.nombre, p.apellido1
   FROM profesor as p
   WHERE p.id_departamento in (SELECT id from departamento) and p.id not in (select id_profesor from asignatura);
   ```

   

14. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

    ```sql
    SELECT asg.nombre 
    from asignatura as asg
    WHERE id_profesor not in (select id from profesor);
    ```

    

15. Devuelve un listado con todos los departamentos que no han impartido
      asignaturas en ningún curso escolar.

   ```sql
   SELECT nombre
   FROM departamento
   WHERE id NOT IN (
       SELECT DISTINCT id_departamento 
       FROM profesor
       INNER JOIN asignatura ON profesor.id = asignatura.id_profesor
   );
   
   +-----------------------------+
   | nombre                      |
   +-----------------------------+
   | Departamento de Matemáticas |
   | Departamento de Física      |
   | Departamento de Informática |
   +-----------------------------+
   ```

   

## VISTAS

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de
   todos los alumnos. El listado deberá estar ordenado alfabéticamente de
   menor a mayor por el primer apellido, segundo apellido y nombre.

```sql
CREATE VIEW listarAlumnos as
SELECT a.apellido1, a.apellido2, a.nombre 
FROM alumno AS a
ORDER BY a.apellido1 ASC, a.apellido2 ASC, a.nombre ASC;
+-----------+-----------+--------+
| apellido1 | apellido2 | nombre |
+-----------+-----------+--------+
| Díaz      | Fernández | Laura  |
| Díaz      | Fernández | Laura  |
| García    | López     | María  |
| García    | López     | María  |
| Hernández | Pérez     | Ana    |
| Hernández | Pérez     | Ana    |
| Martínez  | Sánchez   | Juan   |
| Martínez  | Sánchez   | Juan   |
| Rodríguez | Gómez     | Pedro  |
| Rodríguez | Gómez     | Pedro  |
+-----------+-----------+--------+
SELECT * FROM(listarAlumnos);
```

2. Devuelve un listado con todos los departamentos que no han impartido
   asignaturas en ningún curso escolar.

```sql
CREATE VIEW departamentosSinCursoEscolar as
SELECT nombre
FROM departamento
WHERE id NOT IN (
    SELECT DISTINCT id_departamento 
    FROM profesor
    INNER JOIN asignatura ON profesor.id = asignatura.id_profesor
);
SELECT * FROM(departamentosSinCursoEscolar)
+-----------------------------+
| nombre                      |
+-----------------------------+
| Departamento de Matemáticas |
| Departamento de Física      |
| Departamento de Informática |
+-----------------------------+
```

3. Devuelve un listado con los profesores que no están asociados a un
   departamento.

```sql
CREATE VIEW profesSinDepartamento as
SELECT nombre, apellido1, apellido2
from profesor
WHERE id_departamento is null;
select * from(profesSinDepartamento); 
+-----------+-----------+-----------+
| nombre    | apellido1 | apellido2 |
+-----------+-----------+-----------+
| Carlos    | Ruiz      | Gómez     |
| Sofía     | López     | Martínez  |
| Pablo     | González  | Fernández |
| Elena     | Martín    | Sanz      |
| Alejandro | Díaz      | Pérez     |
+-----------+-----------+-----------+
```

4. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

```sql
CREATE VIEW asignaturasSinProfesores as
SELECT asg.nombre
FROM profesor as p
RIGHT JOIN asignatura as asg on p.id = asg.id_profesor
WHERE p.id  is null;
SELECT  * from (asignaturasSinProfesores);
+----------+
| nombre   |
+----------+
| Historia |
+----------+
```

5. Devuelve un listado con el nombre de todos los departamentos que tienen
   profesores que imparten alguna asignatura en el Grado en Ingeniería
   Informática

```sql
CREATE VIEW departamentosSinProfesoresSinAsignatura as
SELECT  d.id, d.nombre
FROM profesor as p
INNER JOIN departamento as d on p.id_departamento = d.id
INNER JOIN asignatura as asg on p.id = asg.id_profesor
INNER JOIN grado as g on asg.id_grado = g.id
WHERE g.nombre = 'Ingeniería Informática';
SELECT * FROM (departamentosSinProfesoresSinAsignatura);
+----+-----------------------------+
| id | nombre                      |
+----+-----------------------------+
|  1 | Departamento de Matemáticas |
|  3 | Departamento de Informática |
+----+-----------------------------+
```

6. Devuelve el listado de los alumnos que nacieron en 1999.

```sql
create view listarAlumnosNacidos1999 as
select a.id, a.nombre, a.apellido1, a.apellido2, a.id_ciudad, a.fecha_nacimiento, a.id_sexo
FROM alumno as a
WHERE YEAR(fecha_nacimiento) = 1999;
SELECT * FROM (listarAlumnosNacidos1999);
+----+--------+-----------+-----------+-----------+------------------+---------+
| id | nombre | apellido1 | apellido2 | id_ciudad | fecha_nacimiento | id_sexo |
+----+--------+-----------+-----------+-----------+------------------+---------+
|  1 | María  | García    | López     |         1 | 1999-03-15       |       2 |
|  3 | Ana    | Hernández | Pérez     |         3 | 1999-07-10       |       2 |
|  5 | Laura  | Díaz      | Fernández |         2 | 1999-09-25       |       2 |
|  6 | María  | García    | López     |         1 | 1999-03-15       |       2 |
|  8 | Ana    | Hernández | Pérez     |         3 | 1999-07-10       |       2 |
| 10 | Laura  | Díaz      | Fernández |         2 | 1999-09-25       |       2 |
+----+--------+-----------+-----------+-----------+------------------+---------+
```

7. Devuelve un listado con todos los alumnos que se han matriculado en
   alguna asignatura durante el curso escolar 2018/2019.

```sql
create view listarAlumnosMatriculados2018_2019 as
SELECT  al.nombre
FROM alumno as al
INNER JOIN alumno_se_matricula_asignatura as asm on al.id = asm.id_alumno
INNER JOIN curso_escolar as cs on asm.id_curso_escolar = cs.id
WHERE cs.id = 1;
select * from (listarAlumnosMatriculados2018)
+--------+
| nombre |
+--------+
| María  |
| Ana    |
| Laura  |
+--------+
```

8. Calcula cuántos profesores hay en cada departamento. El resultado sólo
   debe mostrar dos columnas, una con el nombre del departamento y otra
   con el número de profesores que hay en ese departamento. El resultado
   sólo debe incluir los departamentos que tienen profesores asociados y
   deberá estar ordenado de mayor a menor por el número de profesores.

```sql
CREATE VIEW listarProfesEnDepartamento as
SELECT 
    d.nombre AS nombre_departamento, 
    COUNT(p.id) AS cantidad_profesores
FROM 
    departamento AS d
INNER JOIN 
    profesor AS p ON d.id = p.id_departamento
GROUP BY 
    d.nombre
ORDER BY 
    cantidad_profesores DESC;
select * from (listarProfesEnDepartamento);
+-----------------------------+---------------------+
| nombre_departamento         | cantidad_profesores |
+-----------------------------+---------------------+
| Departamento de Física      |                   2 |
| Departamento de Informática |                   2 |
| Departamento de Matemáticas |                   1 |
+-----------------------------+---------------------+
```

9. Devuelve el número total de alumnas que hay.

```sql
CREATE VIEW listarAlumnas as
SELECT COUNT(a.id) as alumnas 
FROM alumno as a
INNER JOIN tipo_sexo as ts on a.id_sexo = ts.id
WHERE ts.id = 2;
select * from (listarAlumnas);
+---------+
| alumnas |
+---------+
|       6 |
+---------+
```

10. Averigua el nombre y los dos apellidos de los alumnos que no han dado de
    alta su número de teléfono en la base de datos.

```sql
CREATE VIEW listarTelefonosAlumnosActivos as
SELECT a.nombre, a.apellido1, a.apellido2
FROM alumno as a
INNER JOIN telefono_alumno as ta ON a.id = id_alumno
WHERE id_alumno is NOT NULL;
select  * from (listarTelefonosAlumnosActivos);
+--------+-----------+-----------+
| nombre | apellido1 | apellido2 |
+--------+-----------+-----------+
| María  | García    | López     |
| Juan   | Martínez  | Sánchez   |
| Ana    | Hernández | Pérez     |
+--------+-----------+-----------+
```



## PROCEDIMIENTOS ALMACENADOS

1. Insertar alumno

```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS InsertarAlumno $$
CREATE PROCEDURE InsertarAlumno (
    IN p_nombre VARCHAR(25),
    IN p_apellido1 VARCHAR(50),
    IN p_apellido2 VARCHAR(50),
    IN p_id_ciudad INT,
    IN p_fecha_nacimiento DATE,
    IN p_id_sexo INT
)
BEGIN
    INSERT INTO alumno (nombre, apellido1, apellido2, id_ciudad, fecha_nacimiento, id_sexo) 
    VALUES (p_nombre, p_apellido1, p_apellido2, p_id_ciudad, p_fecha_nacimiento, p_id_sexo);
END $$
DELIMITER ;
CALL InsertarAlumno('Juan', 'Perez', 'Gomez', 1, '2000-01-15', 1);

```

2. Actualizar info de profesor

   ```sql
   DELIMITER $$
   CREATE PROCEDURE ActualizarProfesor (
       IN p_id INT,
       IN p_nombre VARCHAR(25),
       IN p_apellido1 VARCHAR(50),
       IN p_apellido2 VARCHAR(50),
       IN p_id_ciudad INT,
       IN p_fecha_nacimiento DATE,
       IN p_id_sexo INT
   )
   BEGIN
       UPDATE profesor 
       SET 
           nombre = p_nombre,
           apellido1 = p_apellido1,
           apellido2 = p_apellido2,
           id_ciudad = p_id_ciudad,
           fecha_nacimiento = p_fecha_nacimiento,
           id_sexo = p_id_sexo
       WHERE id = p_id;
   END $$
   DELIMITER ;
   CALL ActualizarProfesor(1, 'Maria', 'Gonzalez', 'Lopez', 2, '1985-07-20', 2);
   
   ```

   3. Eliminar asignatura

      ```sql
      DELIMITER $$
      CREATE PROCEDURE EliminarAsignatura (
          IN p_id INT
      )
      BEGIN
          DELETE FROM asignatura 
          WHERE id = p_id;
      END $$
      DELIMITER ;
      CALL EliminarAsignatura(3);
      
      ```

      4.  insertar ciudad

         ```sql
         DELIMITER $$
         CREATE PROCEDURE InsertarCiudad (
             IN p_nombre VARCHAR(50)
         )
         BEGIN
             INSERT INTO ciudad (nombre) VALUES (p_nombre);
         END $$
         DELIMITER ;
         
         CALL InsertarCiudad('Sevilla');
         
         ```

         5. actualizar grado

            ```sql
            DELIMITER $$
            CREATE PROCEDURE ActualizarGrado (
                IN p_id INT,
                IN p_nombre VARCHAR(100)
            )
            BEGIN
                UPDATE grado
                SET nombre = p_nombre
                WHERE id = p_id;
            END $$
            DELIMITER ;
            
            CALL ActualizarGrado(2, 'Licenciatura en Biología');
            
            ```

            6. Insertar tipo de asignatura

               ```sql
               DELIMITER $$
               CREATE PROCEDURE InsertarTipoAsignatura (
                   IN p_nombre VARCHAR(50)
               )
               BEGIN
                   INSERT INTO tipo_asignatura (nombre) VALUES (p_nombre);
               END $$
               DELIMITER ;
               
               CALL InsertarTipoAsignatura('Electiva');
               
               ```

               

7. Eliminar telefono de alumnos

   ```sql
   DELIMITER $$
   CREATE PROCEDURE EliminarTelefonoAlumno (
       IN p_id INT
   )
   BEGIN
       DELETE FROM telefono_alumno WHERE id = p_id;
   END $$
   DELIMITER ;
   
   CALL EliminarTelefonoAlumno(5);
   
   ```

   8. Insertar nuevo curso escolar

      ```sql
      DELIMITER $$
      CREATE PROCEDURE InsertarCursoEscolar (
          IN p_año_inicio DATE,
          IN p_año_fin DATE
      )
      BEGIN
          INSERT INTO curso_escolar (año_inicio, año_fin) VALUES (p_año_inicio, p_año_fin);
      END $$
      DELIMITER ;
      
      CALL InsertarCursoEscolar('2024-09-01', '2025-06-30');
      
      ```

      9. Actualizar direccion del profesot

         ```sql
         DELIMITER $$
         CREATE PROCEDURE ActualizarDireccionProfesor (
             IN p_id INT,
             IN p_direccion VARCHAR(50)
         )
         BEGIN
             UPDATE direccion_profesor
             SET direccion = p_direccion
             WHERE id = p_id;
         END $$
         DELIMITER ;
         
         CALL ActualizarDireccionProfesor(2, 'Av. Principal 123');
         
         ```

         10. Insertar sexo

             ```sql
             DELIMITER $$
             CREATE PROCEDURE InsertarSexo (
                 IN p_nombre VARCHAR(50)
             )
             BEGIN
                 INSERT INTO tipo_sexo (nombre) VALUES (p_nombre);
             END $$
             DELIMITER ;
             
             CALL InsertarSexo('Nuevo sexo');
             
             ```

             

