SELECT obrero.rut_trabajador, recoleccion_kit.id_kit, kit.kit, recoleccion_kit.id_implemento, implementos.nombre_implemento 
FROM recoleccion_kit
INNER JOIN kit ON recoleccion_kit.id_kit = kit.id_kit 
INNER JOIN implementos ON recoleccion_kit.id_implemento = implementos.id_implemento 
INNER JOIN obrero ON recoleccion_kit.id_kit = obrero.id_kit;
