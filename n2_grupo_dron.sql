select password,rol from login INNER JOIN rol ON login.id_rol= rol.id_rol WHERE rol.rut_obreros='11.111.111-1' or rol.rut_staff='11.111.111-1' ;-- para el login


select fecha,motivo,hora from faltas inner join obrero on faltas.rut_obrero= obrero.rut_obrero where obrero.rut_obrero= '33.333.333-3'; --- para la primera wea que pide

select * from faltas

update faltas set hora= '12:01' where id_falta= '4'

select count(estado) from asistencia inner join obrero on asistencia.id_asistencia = obrero.id_asistencia where estado ='Presente'and obrero.rut_obrero='33.333.333-3' -- para la segunda wea que pide
select count(estado) from asistencia inner join obrero on asistencia.id_asistencia = obrero.id_asistencia where estado ='Ausente' and obrero.rut_obrero='33.333.333-3'-- para la segunda wea que pide

insert into faltas values (4,3,'01-11-2023','se puso sopenco','33.333.333-3');
