/*SCRIPT PARA LA CREACION DE FUNCIONES*/

-- FUNCION NUMERO 1 SEND_MONEY_FUNC
CREATE function SEND_MONEY_FUNC(id INT)

RETURNS VARCHAR(50)

DETERMINISTIC

READS SQL DATA

RETURN (SELECT count(*)

from user

join account on user.id = account.id_user

join history_of_movements on account.id = history_of_movements.id_account_made

join movements on history_of_movements.id_movement = movements.id

where movements.type ='send money' and user.id = id);

-- ESTE USUARIO SI ENVIO DINERO
SELECT SEND_MONEY_FUNC(2);
-- ESTE USUARIO NO ENVIO DINERO
SELECT SEND_MONEY_FUNC(5);




-- FUNCION NUMERO 2 
CREATE FUNCTION USE_BANK_F(id_account INT)

RETURNS VARCHAR(90)

DETERMINISTIC

READS SQL DATA

RETURN (SELECT count(*)

FROM account a
	JOIN bank b ON b.id = a.id_bank
    WHERE b.id = id_account
 );

-- ninguna cuenta utiliza banco numero 3
SELECT USE_BANK_F(3);
-- dos cuentas utilizan el banco 4
select USE_BANK_F(4);