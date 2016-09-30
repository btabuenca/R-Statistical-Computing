
-- This is the progress for week 37

SELECT 
  to_char(fechahoraregistro, 'DDD / DY / HH24') AS sem_dia_hora,
  count(*) NUM,
  '1.-RG' as STATUS
FROM registros
WHERE
	TO_CHAR(fechahoraregistro, 'IW') = '37' AND
	( codtipoacceso      = 'E' OR codtipoacceso         = 'R' ) 
GROUP BY to_char(fechahoraregistro, 'DDD / DY / HH24')

UNION

SELECT 
  TO_CHAR(FECHAHORAINICIOAE,'DDD / DY / HH24') AS sem_dia_hora,
  COUNT(*) NUM,
  '2.-AE' AS STATUS
FROM AUTORIZACIONESENTRADAS
WHERE TO_CHAR(FECHAHORAINICIOAE,'IW') = '37'
GROUP BY TO_CHAR(FECHAHORAINICIOAE,'DDD / DY / HH24')

UNION

SELECT 
  to_char(FECHAHORAAPERTURA,'DDD / DY / HH24') AS sem_dia_hora,
  count(*) NUM,
  '3.-DN' as STATUS
FROM CONTROLENTRADA
WHERE TO_CHAR(FECHAHORAAPERTURA,'IW') = '37' AND
	IDAUTORIZACIONE is not null
GROUP BY to_char(FECHAHORAAPERTURA,'DDD / DY / HH24')

ORDER BY 1,2






