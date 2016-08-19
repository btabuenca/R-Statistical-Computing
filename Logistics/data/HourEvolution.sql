// **********************************************************
// Evolucion por hora entre un rango de fechas
// **********************************************************



// **********************************************************
// Evolucion por hora para un dia concreto (quitando nulos)
// HourEvolutionDay.csv
// **********************************************************
select 
  count(*) numitems,
  grouped as MMDDHH,
  'REGISTROS' as typeitems
from (
      SELECT 
        to_char(fechahoraregistro, 'hh24') grouped
      FROM registros
      WHERE fechahoraregistro >= TO_DATE('19/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahoraregistro   <= TO_DATE('19/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
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
        to_char(fechahorainicioae, 'hh24') grouped
      FROM autorizacionesentradas
      WHERE fechahorainicioae >= TO_DATE('19/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahorainicioae   <= TO_DATE('19/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
      
     ) t
group by grouped

UNION

select 
  count(*) numitems,
  grouped as MMDDHH,
  'DENTRO' as typeitems
from (
      SELECT 
        to_char(fechahoraapertura, 'hh24') grouped
      FROM controlentrada
      WHERE fechahoraapertura >= TO_DATE('19/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahoraapertura   <= TO_DATE('19/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
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
        to_char(fechahorainicioas, 'hh24') grouped
      FROM autorizacionessalidas
      WHERE fechahorainicioas >= TO_DATE('19/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahorainicioas   <= TO_DATE('19/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
      
     ) t
group by grouped


UNION

select 
  count(*) numitems,
  grouped as MMDDHH,
  'FUERA' as typeitems
from (
      SELECT 
        to_char(fechahoraapertura, 'hh24') grouped
      FROM controlsalida
      WHERE fechahoraapertura >= TO_DATE('19/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahoraapertura   <= TO_DATE('19/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
	  AND matricula is not null
     ) t
group by grouped




order by 2,3;



// *************************************************************
// Contando nulos en control de entrada y control de salida
// HourEvolutionNulls.csv
// *************************************************************
select 
  count(*) numitems,
  grouped as MMDDHH,
  'DENTRONULLS' as typeitems
from (
      SELECT 
        to_char(fechahoraapertura, 'hh24') grouped
      FROM controlentrada
      WHERE fechahoraapertura >= TO_DATE('19/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahoraapertura   <= TO_DATE('19/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
	  AND matricula is null
     ) t
group by grouped

UNION

select 
  count(*) numitems,
  grouped as MMDDHH,
  'FUERANULLS' as typeitems
from (
      SELECT 
        to_char(fechahoraapertura, 'hh24') grouped
      FROM controlsalida
      WHERE fechahoraapertura >= TO_DATE('19/07/2016 00:00', 'dd/mm/yyyy hh24:mi')
      AND fechahoraapertura   <= TO_DATE('19/07/2016 23:59', 'dd/mm/yyyy hh24:mi')
	  AND matricula is null
     ) t
group by grouped

order by 2,3;



