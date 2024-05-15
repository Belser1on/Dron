SELECT asistencia.fecha, asistencia.hora, asistencia.estado, obrero.rut_trabajador
FROM asistencia
INNER JOIN obrero ON asistencia.rut_trabajador = obrero.rut_trabajador
WHERE obrero.rut_trabajador = '44.444.444-4';

