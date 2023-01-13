/*SCRIPT DE CREACION DE TRIGGERS*/

-- CREAR TABLA REGISTRO DE USUARIO
CREATE TABLE reg_user(name_surname VARCHAR(90), CUIL INT, inserted DATETIME);
-- crear trigger que almacenara la informacion del usuario que se creo despues de que se inserte en la tabla usuario
CREATE TRIGGER USER_AI AFTER INSERT ON user
FOR EACH ROW INSERT INTO reg_user(name_surname, CUIL, inserted)
VALUES(NEW.name_surname, NEW.CUIL, NEW.inserted) ;

-- CREAR TABLA REGISTRO SEND MONEY 
CREATE TABLE reg_send_money(id_account_send INT, amount DECIMAL, sended DATETIME);
-- CREAR TRIGGER QUE ANTES DE QUE SE INSERTE EN LA TABLA SEND_MONEY LA OPERACION, EVALUARA QUE EL ID DE LA CUENTA
-- QUE ENVIA EL DINERO, NO SEA NULO
CREATE TRIGGER send_money_BI BEFORE INSERT ON send_money
FOR EACH ROW INSERT INTO send_money_BI();