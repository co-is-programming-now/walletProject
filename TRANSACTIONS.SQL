-- En la primera tabla, si tiene registros, deberás eliminar algunos de ellos iniciando previamente una transacción. Si no tiene registros la tabla, reemplaza eliminación por inserción.
-- TRANSACCIÓN 1 ELIMINAR 5 REGISTROS DE LA TABLA user 
START TRANSACTION;
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM 
	user 
WHERE
	id <=5;

-- ROLLBACK;

-- COMMIT;

SELECT * FROM user;

-- TRANSACCIÓN 2
-- En la segunda tabla, inserta ocho nuevos registros iniciando también una transacción. 

-- Agrega un savepoint a posteriori de la inserción del registro #4 y 
-- otro savepoint a posteriori del registro #8
START TRANSACTION ;

SELECT * FROM user_contacts;

INSERT INTO user_contacts VALUES (DEFAULT, 'MIRCO ROJAS', 1, 'LOTE.permiso.CAFE',56696852475241586256,6662325210,1);        
INSERT INTO user_contacts VALUES(DEFAULT, 'MARCOS ASTRADA', 6, 'limon.AYER.PAZ',228754126444444445,5222585696,2);
INSERT INTO user_contacts VALUES(DEFAULT, 'SEBASTIAN VIDELA', 5, 'CAMARA.luz.gato',333665252878741215477,5841212021,2);
INSERT INTO user_contacts VALUES(DEFAULT, 'CANDACE PEREZ' , 4, 'rosa.AZUCAR.ARROZ',787844112222222222,7414521741,3);
savepoint lote_1;
INSERT INTO user_contacts VALUES(DEFAULT, 'SONIA GUZMAN', 2, 'BAYA.cinco.carton',699999955582136474,1111414111,1);
INSERT INTO user_contacts VALUES(DEFAULT, 'LARA MALDONAD', 6, 'RAYO.LAGO.oso',2120000000000000000,5020036958,1);
INSERT INTO user_contacts VALUES(DEFAULT, 'PAOLA PANDREDON', 5, 'musica.helado.alegria',466933312301014522,8471444444,2);
INSERT INTO user_contacts VALUES(DEFAULT, 'BELEN MATTIONE', 4, 'imposible.DESEO.raton',4141114425896325588,1200000258,1);
savepoint lote_2;

-- Agrega en una línea comentada la sentencia de eliminación del savepoint 
-- de los primeros 4 registros insertados.
-- RELEASE SAVEPOINT lote_1;
