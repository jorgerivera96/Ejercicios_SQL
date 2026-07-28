-- CONSULTAS MULTITABLA (COMPOSICION INTERNA)
/* 1. Devuelve una lista con el nombre del producto, 
precio y nombre de fabricante de todos los productos de la base de datos. */
SELECT 
    producto.nombre,
    producto.precio,
    fabricante.nombre AS fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id;

/* 2. Devuelve una lista con el nombre del producto, 
precio y nombre de fabricante de todos los productos de la base de datos. 
Ordene el resultado por el nombre del fabricante, por orden alfabético. */
SELECT 
    producto.nombre,
    producto.precio,
    fabricante.nombre AS fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
ORDER BY fabricante.nombre ASC;

/* 3. Devuelve una lista con el identificador del producto, 
nombre del producto, identificador del fabricante y nombre del fabricante, 
de todos los productos de la base de datos. */
SELECT 
    producto.id AS id_producto,
    producto.nombre AS producto,
    fabricante.id AS id_fabricante,
    fabricante.nombre AS fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id;

/* 4. Devuelve el nombre del producto, su precio y el nombre 
de su fabricante, del producto más barato. */
SELECT 
    producto.nombre,
    producto.precio,
    fabricante.nombre AS fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
ORDER BY producto.precio ASC
LIMIT 1;

/* 5. Devuelve el nombre del producto, su precio y el nombre 
de su fabricante, del producto más caro. */
SELECT 
    producto.nombre,
    producto.precio,
    fabricante.nombre AS fabricante
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
ORDER BY producto.precio DESC
LIMIT 1;

/* 6. Devuelve una lista de todos los productos del fabricante Lenovo. */
SELECT 
    producto.nombre
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = 'Lenovo';

/* 7. Devuelve una lista de todos los productos del fabricante 
Crucial que tengan un precio mayor que 200€. */
SELECT 
    producto.nombre
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE 
    fabricante.nombre = 'Crucial' 
    AND producto.precio > 200;

/* 8. Devuelve un listado con todos los productos de los fabricantes Asus, 
Hewlett-Packard y Seagate. Sin utilizar el operador IN. */
SELECT p.nombre
FROM producto AS p
INNER JOIN fabricante AS f
    ON p.id_fabricante = f.id
WHERE f.nombre = 'Asus'
    OR f.nombre = 'Hewlett-Packard'
    OR f.nombre = 'Seagate';

/* 9. Devuelve un listado con todos los productos de los fabricantes Asus, 
Hewlett-Packardy Seagate. Utilizando el operador IN. */
SELECT p.nombre
FROM producto AS p
INNER JOIN fabricante AS f
    ON p.id_fabricante = f.id
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

/* 10. Devuelve un listado con el nombre y el precio de todos 
los productos de los fabricantes cuyo nombre termine por la vocal e. */
SELECT 
    p.nombre,
    p.precio
FROM producto AS p
INNER JOIN fabricante AS f
    ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%e';

/* 11. Devuelve un listado con el nombre y el precio de todos 
los productos cuyo nombre de fabricante contenga el carácter 
w en su nombre. */
SELECT 
    p.nombre,
    p.precio
FROM producto AS p
INNER JOIN fabricante AS f
    ON p.id_fabricante = f.id
WHERE f.nombre ILIKE '%w%';

/* 12. Devuelve un listado con el nombre de producto, precio y 
nombre de fabricante, de todos los productos que tengan un precio 
mayor o igual a 180€. Ordene el resultado en primer lugar por el precio 
(en orden descendente) y en segundo lugar por el nombre (en orden ascendente) */
SELECT
    p.nombre,
    p.precio,
    f.nombre AS fabricante
FROM producto AS p
INNER JOIN fabricante AS f
    ON p.id_fabricante = f.id
WHERE p.precio >= 180
ORDER BY
    p.precio DESC,
    p.nombre ASC;

/* 13. Devuelve un listado con el identificador y el nombre de fabricante, 
solamente de aquellos fabricantes que tienen productos asociados en 
la base de datos. */
SELECT DISTINCT
    f.id,
    f.nombre
FROM fabricante AS f
INNER JOIN producto AS p
    ON f.id = p.id_fabricante;

-- CONSULTAS MULTITABLA (COMPOSICION EXTERNA)  
/*Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN. */

/* 1. Devuelve un listado de todos los fabricantes que existen en la base 
de datos, junto con los productos que tiene cada uno de ellos. 
El listado deberá mostrar también aquellos fabricantes que no tienen 
productos asociados. */

/* 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no 
tienen ningún producto asociado. */

/* 3. ¿Pueden existir productos que no estén relacionados con un fabricante? 
Justifique su respuesta. */  