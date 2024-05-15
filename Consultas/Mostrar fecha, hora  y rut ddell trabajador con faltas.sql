SELECT recoleccion_faltas.rut_trabajador, recoleccion_faltas.fecha, recoleccion_faltas.hora
FROM recoleccion_faltas
INNER JOIN faltas ON recoleccion_faltas.id_falta = faltas.id_falta;
