1. Consultar el código, nombre y fecha de ingreso en el videoclub de los socios con apellido López
select socio, nombre, fecha_alta
from socios
where nombre LIKE '%Lopez%';

2. ¿Cuantas personas se hicieron socias en el último trimestre de 2010.
select COUNT(*)
from socios
where fecha_alta BETWEEN to_date ('2010-10-01', 'yyyy-mm-dd') AND to_date ('2010-12-31', 'yyyy-mm-dd');

3. Consultar los datos de los socios ordenados por la fecha de ingreso
select *
from socios
order by fecha_alta;

4. Cuál es el precio medio de una película en el videoclub
select avg(precio)
from peliculas;

5. Cuántas películas están por encima del precio medio
select COUNT(*)
from peliculas
where precio > (select AVG(precio) from peliculas);

