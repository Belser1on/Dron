SELECT trabajador.nombre, obrero.rut_trabajador, rol.rol
FROM trabajador
INNER JOIN obrero ON trabajador.rut_trabajador = obrero.rut_trabajador
INNER JOIN rol ON trabajador.id_rol = rol.id_rol
WHERE rol.rol = 'Obrero';
