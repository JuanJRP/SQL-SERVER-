/*1). 53. Escriba una consulta para mostrar el título de la película, el año de la película y el género de la película para todas las películas 
ordenadas por género de película en orden ascendente, luego ordenadas por año de película en orden descendente dentro del género.
(Los resultados se muestran en la figura P7.53.)*/

SELECT MOVIE_NAME AS NOMBRE,YEAR(MOVIE_YEAR) AS AÑO, MOVIE_GENRE AS GENERO FROM MOVIE ORDER BY MOVIE_GENRE ASC
SELECT MOVIE_NAME AS NOMBRE,YEAR(MOVIE_YEAR) AS AÑO, MOVIE_GENRE AS GENERO FROM MOVIE ORDER BY YEAR(MOVIE_YEAR) DESC

/*2). 54. Haga una consulta para mostrar el número de película, el título de la película y el código de precio para todas las películas con un título 
que comience con la letra "R" (Los resultados se muestran en la figura P7.54)*/

SELECT MOVIE_NUM AS NUMERO, MOVIE_NAME AS TITULO, PRICE_CODE AS CODIGO_PRECIO FROM MOVIE WHERE MOVIE_NAME LIKE 'R%'

/*3). 55. Escriba una consulta para mostrar el título de la película, el año de la película y el costo de la película para todas las películas que contienen
La palabra "esperanza". en cualquier parte del título. Ordene los resultados en orden ascendente por título. (Los resultados se muestran en la figura P7.55.)*/

SELECT MOVIE_NAME AS NOMBRE, YEAR (MOVIE_YEAR) AS AÑO, MOVIE_COST AS COSTO FROM MOVIE WHERE MOVIE_NAME LIKE '%Hope%'

/*4). 56. Escriba una consulta para mostrar el título de la película, el año de la película y el género de la película para todas las películas de acción. 
(Los resultados se muestran en la figura P7.56.)*/

SELECT MOVIE_NAME AS TITULO, YEAR (MOVIE_YEAR) AS AÑO, MOVIE_GENRE AS GENERO FROM MOVIE WHERE MOVIE_GENRE = 'ACTION'
