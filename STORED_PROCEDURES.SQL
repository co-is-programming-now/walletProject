-- SCRIPT DE STORED PROCEDURES

-- STORE PROCEDURE 1 INSERTAR UN NUEVO USUARIO PERO ANTES EVALUAR SI EXISTE EN LA BASE DE DATOS

USE `virtualwallet`;
DROP procedure IF EXISTS `create_new_user`;

USE `virtualwallet`;
DROP procedure IF EXISTS `virtualwallet`.`create_new_user`;
;

DELIMITER $$
USE `virtualwallet`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_user`(IN dni INT, in CUIL VARCHAR(30), IN name_surname VARCHAR(40), IN account_num VARCHAR(40), IN id_card_user INT, IN email VARCHAR(90), IN phone INT)
BEGIN
DECLARE err VARCHAR(225);
	IF(dni = null OR name_surname = ' ' OR id_card_user = 0 ) THEN
		SET err = 'something went wrong, please verify the information.';
        SELECT err;
    ELSE 
		SET err = '._.';
        SELECT err;
        END IF;
        IF EXISTS(SELECT name_surname FROM user WHERE EXISTS(SELECT dni FROM user WHERE user.dni = dni)) THEN
			SET err = CONCAT('The user ', name_surname,' already exist on this database');
            SELECT err;
        ELSE
			INSERT INTO user (dni,cuil,name_surname,account_num,id_card_user,email,phone)
				values(dni,cuil,name_surname,account_num,id_card_user,email,phone);
				SELECT * from user;  
        END IF; 
END$$

-- se creara el usuario 8
CALL create_new_user(26330304,'27263303046','ROCIO CARRANZA',2345849304958342, 3,'ROcaranza@email.com', 0351423555);
-- repetir sencencia create_new_user, luego consultar tabla usuario
select * from user;


-- STORE PROCEDURE 2 RETORNA QUE BANCO UTILIZA CADA USUARIO

USE `virtualwallet`;
DROP procedure IF EXISTS `who_use_bank`;

DELIMITER $$
USE `virtualwallet`$$
CREATE PROCEDURE who_use_bank()

DETERMINISTIC

BEGIN
	(SELECT b.name as bank_name, b.id as id_bank, u.name_surname as name_account
		
        FROM bank b
        
        JOIN account a ON b.id = a.id_bank
        
        JOIN user u ON a.id = u.id
	);
 END$$


CALL who_use_bank();




