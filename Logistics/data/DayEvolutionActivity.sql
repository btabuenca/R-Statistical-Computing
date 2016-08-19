##
## Obtains status from trucks within the route grouped by activity
##

SELECT 
  to_char(fechahoraregistro ,'HH24') AS HOUR_OF_THE_DAY,
  count(*) NUM,
  'Fruta' as ACTIVITY
FROM registros
WHERE
	( codtipoacceso      = 'E' OR codtipoacceso         = 'R' ) AND
	codtipovehiculo = 'F'
GROUP BY to_char(fechahoraregistro,'HH24')

UNION

SELECT 
  to_char(fechahoraregistro ,'HH24') AS HOUR_OF_THE_DAY,
  count(*) NUM,
  'Congelado' as ACTIVITY
FROM registros
WHERE
	( codtipoacceso      = 'E' OR codtipoacceso         = 'R' ) AND
	codtipovehiculo = 'C'
GROUP BY to_char(fechahoraregistro,'HH24')


UNION
SELECT 
  to_char(fechahoraregistro ,'HH24') AS HOUR_OF_THE_DAY,
  count(*) NUM,
  'Refrigerado' as ACTIVITY
FROM registros
WHERE
	( codtipoacceso      = 'E' OR codtipoacceso         = 'R' ) AND
	codtipovehiculo = 'R'
GROUP BY to_char(fechahoraregistro,'HH24')

UNION
SELECT 
  to_char(fechahoraregistro ,'HH24') AS HOUR_OF_THE_DAY,
  count(*) NUM,
  'Congelado' as ACTIVITY
FROM registros
WHERE
	( codtipoacceso      = 'E' OR codtipoacceso         = 'R' ) AND
	codtipovehiculo = 'C'
GROUP BY to_char(fechahoraregistro,'HH24')

ORDER BY 1, 2
