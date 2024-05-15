SELECT trabajador.nombre, obrero.rut_trabajador
FROM trabajador
INNER JOIN obrero ON trabajador.rut_trabajador = obrero.rut_trabajador;
