##
## Obtains status from trucks within the route grouped by acceso
##

SELECT 
  to_char(fechahoraregistro ,'HH24') AS HOUR_OF_THE_DAY,
  count(*) NUM,
  'Expedicion' as Acceso
FROM registros
WHERE
	codtipoacceso      = 'E'
GROUP BY to_char(fechahoraregistro,'HH24')


UNION
SELECT 
  to_char(fechahoraregistro ,'HH24') AS HOUR_OF_THE_DAY,
  count(*) NUM,
  'Recepcion' as ACTIVITY
FROM registros
WHERE
	codtipoacceso         = 'R'
GROUP BY to_char(fechahoraregistro,'HH24')

ORDER BY 1, 2
