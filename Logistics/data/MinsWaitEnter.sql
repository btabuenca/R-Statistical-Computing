SELECT COUNT(*) num_registros,
  grouped AS mins_waiting
FROM
(
    SELECT r.idregistro,
      TRUNC((fechahorainicioae - r.fechahoraregistro) * 24 * 60) AS grouped
    FROM registros r,
      autorizacionesentradas auen
    WHERE r.idregistro = auen.idregistro
      AND r.fechahoraregistro >= TO_DATE('15/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND r.fechahoraregistro    < sysdate
      AND ( codtipoacceso      = 'E' OR codtipoacceso         = 'R' )
  ) t
GROUP BY grouped
ORDER BY 2;