

    SELECT r.idregistro,
      TRUNC((fechahorainicioae - r.fechahoraregistro) * 24 * 60) AS mins_wait,
      mtv.descripciontipovehiculo AS actividad
    FROM registros r,
      autorizacionesentradas auen,
      m_tipovehiculos mtv
    WHERE r.idregistro = auen.idregistro
      AND r.codtipovehiculo = mtv.codtipovehiculo
      AND r.fechahoraregistro >= TO_DATE('15/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND r.fechahoraregistro    < sysdate
      AND ( codtipoacceso      = 'E' OR codtipoacceso         = 'R' )
      AND ( r.codtipovehiculo      = 'F' OR r.codtipovehiculo         = 'C'  OR r.codtipovehiculo         = 'R')
      AND TRUNC((fechahorainicioae - r.fechahoraregistro) * 24 * 60) < 300