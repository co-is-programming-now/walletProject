-- SCRIPT DE STORED PROCEDURES

-- STORE PROCEDURE 1 INSERTAR UN NUEVO USUARIO
CREATE PROCEDURE create_new_user (in dni INT,
                                in cuil VARCHAR(30),
                                in name_surname VARCHAR(40),
                                in account_num VARCHAR(40),
                                in id_card_user INT,
                                in email VARCHAR(90),
                                inphone INT)
 INSERT INTO user (dni,cuil,name_surname,account_num,id_card_user,email,phone)
 values(dni,cuil,name_surname,account_num,id_card_user,email,phone);

-- se creara el usuario 8
CALL create_new_user(26330304,'27-26330304-6','ROCIO CARRANZA',2345849304958342, 3,'ROcaranza@email.com', 0351423555);

-- STORE PROCEDURE 2 PARA BORRAR UN USUARIO DE LA DB
CREATE PROCEDURE delete_user(deleted INT)
DELETE FROM user WHERE id = deleted;

-- borrar usuario 8
CALL delete_user(8);

SELECT * FROM user;