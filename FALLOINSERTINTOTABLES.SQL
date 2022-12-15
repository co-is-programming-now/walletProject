
#Alberto tengo un problema al insertar datos que me llevó un rato darme cuenta,
#yo trato de crear por ejemplo un usuario con un id de tarjeta 1, pero en la tabla tarjetas no existe
#una con id uno porq no existe ningun registro, y asi sucesivamente con otras tablas que 
#tengan fk q las relaciones, no tengo idea de como solucionar esto, SE ENTIENDE MEJOR SI EJECUTA LOS QUERYS, AYUDAAAAA
INSERT INTO user VALUES(DEFAULT,4509348,264509348-2,'Maria Acuña', 4577769923, 1, 'MariA@email.com', 0351888456);
INSERT INTO card VALUES(1, 'Maria Acuña', 1, true);
INSERT INTO account VALUES (1, 2394857395748, 'TOMATE.rojo.BINGO',1,3,'mArIAeSTUVOaqui19',1,1);