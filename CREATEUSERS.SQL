-- En la tabla user, Mysql almacena la información de usuarios junto a cada uno de los permisos o bloqueo para trabajar sobre la base de datos Mysql y los objetos de ésta
use mysql;
select * from user;

-- Uno de los usuarios creados deberá tener permisos de sólo lectura sobre todas las tablas.

-- CREAR NUEVO USUARIO que solo tiene acceso a lectura
CREATE USER only_read@localhost IDENTIFIED BY 'OnlyR3ad.';

-- VERIFICAR permisos del nuevo usuario
SELECT * FROM mysql.user WHERE user LIKE 'only_read';

-- ESTABLECIENDO permisos de lectura para el nuevo usuario

-- ACTUALMENTE NO POSEE PERMISOS
SHOW GRANTS FOR only_read@localhost;

-- OTORGAR permiso de lectura al usuario
GRANT SELECT ON virtualwallet.* TO only_read@localhost;

-- REVISAR que permisos posee ahora el usuario
SHOW GRANTS FOR only_read@localhost;

-- PARA ELIMINAR AL USUARIO
DROP USER only_read@localhost;

-- CREAR usuario que tiene permiso de lectura, insercion y modificacion de datos
CREATE USER read_insert_update@localhost IDENTIFIED BY 'R3adIn5ertUpdat3.';

-- VERIFICAR permisos del nuevo usuario
SELECT * FROM mysql.user WHERE user LIKE 'read_insert_update';

-- ACTUALMENTE NO POSEE PERMISOS
SHOW GRANTS FOR read_insert_update@localhost;

-- ESTABLECIENDO permisos de lectura, insercion y modificacion de datos sobre las tablas
GRANT SELECT,INSERT, UPDATE ON virtualwallet.* TO read_insert_update@localhost;

-- REVISAR que permisos posee ahora el usuario
SHOW GRANTS FOR read_insert_update@localhost;

-- PARA ELIMINAR AL USUARIO
DROP USER read_insert_update@localhost;