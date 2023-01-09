/*SCRIPT PARA LA CREACION DE FUNCIONES*/


-- FUNCION 1 FUNCION PARA SABER SI UN USUARIO EXISTE EN LA DB
CREATE FUNCTION does_it_exist(exist_user int)
RETURNS INT
DETERMINISTIC
RETURN(SELECT id FROM user WHERE id = exist_user);

SELECT does_it_exist(1);
SELECT does_it_exist(12);

-- FUNCION 2 FUNCION PARA SABER EL MONTO QUE ENVIO UN USUARIO
CREATE FUNCTION amount_user(user int)
RETURNS INT
DETERMINISTIC 
RETURN(SELECT amount FROM send_money WHERE id_account_send = user);

SELECT amount_user(2);
SELECT amount_user(5);