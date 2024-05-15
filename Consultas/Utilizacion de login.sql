SELECT trabajador.password, rol.rol
FROM trabajador
INNER JOIN rol ON trabajador.id_rol = rol.id_rol;
