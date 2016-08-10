##
## Obtains status from trucks within the route grouped by week
##

SELECT 
  to_char(fechaprevistaentrada - 7/24,'IYYY-IW') AS SEM,
  count(*) NUM,
  '1PR' as STATUS
FROM previsiones
WHERE
	( codtipoacceso      = 'E' OR codtipoacceso         = 'R' ) 
GROUP BY to_char(fechaprevistaentrada - 7/24,'IYYY-IW')

UNION

SELECT 
  to_char(fechahoraregistro - 7/24,'IYYY-IW') AS SEM,
  count(*) NUM,
  '2RG' as STATUS
FROM registros
WHERE
	( codtipoacceso      = 'E' OR codtipoacceso         = 'R' ) 
GROUP BY to_char(fechahoraregistro - 7/24,'IYYY-IW')

UNION

SELECT 
  to_char(FECHAHORAINICIOAE - 7/24,'IYYY-IW') AS SEM,
  count(*) NUM,
  '3AE' as STATUS
FROM AUTORIZACIONESENTRADAS
GROUP BY to_char(FECHAHORAINICIOAE - 7/24,'IYYY-IW')

UNION

SELECT 
  to_char(FECHAHORAAPERTURA - 7/24,'IYYY-IW') AS SEM,
  count(*) NUM,
  '4DN' as STATUS
FROM CONTROLENTRADA
WHERE
	IDAUTORIZACIONE is not null
GROUP BY to_char(FECHAHORAAPERTURA - 7/24,'IYYY-IW')

UNION

SELECT 
  to_char(FECHAHORAINICIOAS - 7/24,'IYYY-IW') AS SEM,
  count(*) NUM,
  '5AS' as STATUS
FROM AUTORIZACIONESSALIDAS
GROUP BY to_char(FECHAHORAINICIOAS - 7/24,'IYYY-IW')

UNION

SELECT 
  to_char(FECHAHORAAPERTURA - 7/24,'IYYY-IW') AS SEM,
  count(*) NUM,
  '6FR' as STATUS
FROM CONTROLSALIDA
WHERE
	IDAUTORIZACIONS is not null
GROUP BY to_char(FECHAHORAAPERTURA - 7/24,'IYYY-IW')








ORDER BY 1, 2
