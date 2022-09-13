/*1). 53. Escriba una consulta para mostrar el t�tulo de la pel�cula, el a�o de la pel�cula y el g�nero de la pel�cula para todas las pel�culas 
ordenadas por g�nero de pel�cula en orden ascendente, luego ordenadas por a�o de pel�cula en orden descendente dentro del g�nero.
(Los resultados se muestran en la figura P7.53.)*/

SELECT MOVIE_NAME AS NOMBRE,YEAR(MOVIE_YEAR) AS A�O, MOVIE_GENRE AS GENERO FROM MOVIE ORDER BY MOVIE_GENRE ASC
SELECT MOVIE_NAME AS NOMBRE,YEAR(MOVIE_YEAR) AS A�O, MOVIE_GENRE AS GENERO FROM MOVIE ORDER BY YEAR(MOVIE_YEAR) DESC

/*2). 54. Haga una consulta para mostrar el n�mero de pel�cula, el t�tulo de la pel�cula y el c�digo de precio para todas las pel�culas con un t�tulo 
que comience con la letra "R" (Los resultados se muestran en la figura P7.54)*/

SELECT MOVIE_NUM AS NUMERO, MOVIE_NAME AS TITULO, PRICE_CODE AS CODIGO_PRECIO FROM MOVIE WHERE MOVIE_NAME LIKE 'R%'

/*3). 55. Escriba una consulta para mostrar el t�tulo de la pel�cula, el a�o de la pel�cula y el costo de la pel�cula para todas las pel�culas que contienen
La palabra "esperanza". en cualquier parte del t�tulo. Ordene los resultados en orden ascendente por t�tulo. (Los resultados se muestran en la figura P7.55.)*/

SELECT MOVIE_NAME AS NOMBRE, YEAR (MOVIE_YEAR) AS A�O, MOVIE_COST AS COSTO FROM MOVIE WHERE MOVIE_NAME LIKE '%Hope%'

/*4). 56. Escriba una consulta para mostrar el t�tulo de la pel�cula, el a�o de la pel�cula y el g�nero de la pel�cula para todas las pel�culas de acci�n. 
(Los resultados se muestran en la figura P7.56.)*/

SELECT MOVIE_NAME AS TITULO, YEAR (MOVIE_YEAR) AS A�O, MOVIE_GENRE AS GENERO FROM MOVIE WHERE MOVIE_GENRE = 'ACTION'
