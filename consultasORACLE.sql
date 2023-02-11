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
where precio > (select AVG(precio)
                from peliculas);

6. Consultar los préstamos que han tenido una duración superior a dos días, debes visualizar el
nombre del socio y el título de la película.
select s.nombre, p.titulo
from socios s, peliculas p, alquiler a
where a.pelicula = p.pelicula and a.socio = s.socio and (a.fecha_devolucion - a.fecha_alquiler) > 2;

7. Consultar el nombre del socio que han alquilado la película “Desperado”
select s.nombre
from socios s, peliculas p, alquiler a
where a.pelicula = p.pelicula and a.socio = s.socio and p.titulo LIKE 'Desperado';

8. Mostrar la lista de socios y la cantidad de películas que han alquilado.
select s.nombre, count(a.socio)
from socios s, alquiler a
where a.socio = s.socio
group by s.nombre;

9. Mostrar el precio que ha pagado el socio número al alquilar la película 4.
select p.precio, s.socio
from peliculas p, socios s, alquiler a
where s.socio = a.socio and p.pelicula = a.pelicula and p.pelicula LIKE '4';


10. Mostrar la lista de películas que no han sido alquiladas.
select titulo
from peliculas
where pelicula NOT IN (SELECT pelicula
                       FROM alquiler);

11. Mostrar cuanto ha ganado el videoclub en el año 2010
select sum(p.precio)
from peliculas p, alquiler a
where a.pelicula = p.pelicula and a.fecha_alquiler BETWEEN to_date('2010-01-01', 'yyyy-mm-dd') and to_date('2010-12-31', 'yyyy-mm-dd');

12. Mostrar las películas que están actualmente alquiladas.
select p.titulo
from peliculas p, alquiler a
where p.pelicula = a.pelicula and a.fecha_devolucion IS NULL;

13. Mostrar el “top manta”, la lista de películas y las veces que han sido alquiladas ordenada por las
veces que han sido alquilada.
select p.titulo, count(*)
from peliculas p, alquiler a
where p.pelicula = a.pelicula
group by titulo
order by count(*);

14. Mostrar el nombre y el número de teléfono de socios que tienen películas en su casa. 
select s.nombre, s.telefono
from socios s, alquiler a
where a.socio = s.socio and a.fecha_devolucion IS NULL;

15. ¿Cuanto dinero ha gastado 'Teresa Sánchez López' en el videoclub.
select sum(p.precio)
from peliculas p, socios s, alquiler a
where s.nombre LIKE 'Teresa Sanchez Lopez' and p.pelicula = a.pelicula and a.socio = s.socio;

16. Consultar los nombres y códigos de socios que han alquilado películas de suspense o acción
ordenados por código de socio
select s.nombre, s.socio
from socios s, alquiler a, peliculas p
where s.socio = a.socio and p.pelicula = a.pelicula and p.tema IN ('Suspense','Accion')
order by s.socio;

17. Consultar el nombre y código del socio junto con el dinero total gastado de aquellos socios que
han gastado más de 5 euros en el videoclub
select s.nombre, s.socio, sum(p.precio)
from peliculas p, socios s, alquiler a
where p.pelicula = a.pelicula and s.socio = a.socio
group by s.nombre, s.socio
having sum(p.precio) > 5;

18. Mostrar las fechas en que ha sido alquilada la película “Desperado”
select a.fecha_alquiler
from alquiler a, socios s, peliculas p
where a.socio = s.socio and a.pelicula = p.pelicula and p.titulo LIKE 'Desperado';

19. Mostrar la lista de películas que ha alquilado el socio con DNI 27711498D.
select p.titulo
from peliculas p, socios s, alquiler a
where p.pelicula = a.pelicula and s.socio = a.socio and s.dni LIKE '27711498D';

20. ¿Cúal es la pélicula española más alquilada?
select p.titulo, count(a.pelicula)
from peliculas p, alquiler a
where a.pelicula = p.pelicula and p.pais LIKE 'Espana'
group by p.titulo
order by count(a.pelicula);