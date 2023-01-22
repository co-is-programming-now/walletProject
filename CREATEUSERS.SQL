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
GRANT SELECT ON virtualwallet.account TO only_read@localhost;
GRANT SELECT ON virtualwallet.answer TO only_read@localhost;
GRANT SELECT ON virtualwallet.bank TO only_read@localhost;
GRANT SELECT ON virtualwallet.card TO only_read@localhost;
GRANT SELECT ON virtualwallet.coin TO only_read@localhost;
GRANT SELECT ON virtualwallet.donations TO only_read@localhost;
GRANT SELECT ON virtualwallet.fixed_term TO only_read@localhost;
GRANT SELECT ON virtualwallet.get_money TO only_read@localhost;
GRANT SELECT ON virtualwallet.history_of_movements TO only_read@localhost;
GRANT SELECT ON virtualwallet.investment TO only_read@localhost;
GRANT SELECT ON virtualwallet.movements TO only_read@localhost;
GRANT SELECT ON virtualwallet.org TO only_read@localhost;
GRANT SELECT ON virtualwallet.send_money TO only_read@localhost;
GRANT SELECT ON virtualwallet.user TO only_read@localhost;
GRANT SELECT ON virtualwallet.user_contacts TO only_read@localhost;

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
GRANT SELECT,INSERT, UPDATE ON virtualwallet.account TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.answer TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.bank TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.card TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.coin TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.donations TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.fixed_term TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.get_money TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.history_of_movements TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.investment TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.movements TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.org TO only_read@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.send_money TO only_read@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.user TO read_insert_update@localhost;
GRANT SELECT,INSERT, UPDATE ON virtualwallet.user_contacts TO read_insert_update@localhost;

-- REVISAR que permisos posee ahora el usuario
SHOW GRANTS FOR read_insert_update@localhost;

-- PARA ELIMINAR AL USUARIO
DROP USER read_insert_update@localhost;