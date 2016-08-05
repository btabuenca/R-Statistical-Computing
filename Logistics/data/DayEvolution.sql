select 
  count(*) registros,
  grouped as hour_of_the_day
from (
      SELECT 
        to_char(fechahoraregistro, 'hh24') grouped
      FROM registros
      WHERE fechahoraregistro >= TO_DATE('15/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahoraregistro    < sysdate
      AND ( codtipoacceso      = 'E' OR codtipoacceso         = 'R' )
     ) t
group by grouped 
order by 2;
