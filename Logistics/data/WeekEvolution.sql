

select 
  count(*) numitems,
  grouped as MMDDHH,
  'REGISTROS' as typeitems
from (
      SELECT 
        to_char(fechahoraregistro, 'DDhh24') grouped
      FROM registros
      WHERE fechahoraregistro >= TO_DATE('18/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahoraregistro   <= TO_DATE('24/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
      AND ( codtipoacceso      = 'E' OR codtipoacceso         = 'R' )           
     ) t
group by grouped

UNION

select 
  count(*) numitems,
  grouped as MMDDHH,
  'AUTENTR' as typeitems
from (
      SELECT 
        to_char(fechahorainicioae, 'DDhh24') grouped
      FROM autorizacionesentradas
      WHERE fechahorainicioae >= TO_DATE('18/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahorainicioae   <= TO_DATE('24/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
      
     ) t
group by grouped

UNION

select 
  count(*) numitems,
  grouped as MMDDHH,
  'DENTRO' as typeitems
from (
      SELECT 
        to_char(fechahoraapertura, 'DDhh24') grouped
      FROM controlentrada
      WHERE fechahoraapertura >= TO_DATE('18/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahoraapertura   <= TO_DATE('24/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
	  AND matricula is not null
     ) t
group by grouped


UNION

select 
  count(*) numitems,
  grouped as MMDDHH,
  'AUTSAL' as typeitems
from (
      SELECT 
        to_char(fechahorainicioas, 'DDhh24') grouped
      FROM autorizacionessalidas
      WHERE fechahorainicioas >= TO_DATE('18/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahorainicioas   <= TO_DATE('24/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
      
     ) t
group by grouped

UNION

select 
  count(*) numitems,
  grouped as MMDDHH,
  'FUERA' as typeitems
from (
      SELECT 
        to_char(fechahoraapertura, 'DDhh24') grouped
      FROM controlsalida
      WHERE fechahoraapertura >= TO_DATE('18/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahoraapertura   <= TO_DATE('24/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
	  AND matricula is not null
     ) t
group by grouped


order by 2,3;

