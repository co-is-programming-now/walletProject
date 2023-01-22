/*SCRIPT DE CREACION DE TRIGGERS*/

-- SCRIPT DE CREACION DE TRIGGERS

-- TRIGGER NUMERO 1 reg_user
-- CREAR TABLA REGISTRO DE USUARIO
CREATE TABLE REG_USER(name_surname VARCHAR(90), CUIL VARCHAR(30), inserted_date DATE, inserted_hour TIME);
-- crear trigger que almacenara la informacion del usuario que se creo (dentro de la tabla reg_user) DESPUES de que se inserte en la tabla usuario

-- CREAR TRIGGER
DELIMITER $$

CREATE TRIGGER USER_AI 

AFTER INSERT ON user

FOR EACH ROW 

BEGIN

INSERT INTO REG_USER(name_surname, CUIL, inserted_date, inserted_hour) VALUES(NEW.name_surname, NEW.CUIL,CURRENT_DATE(),CURRENT_TIME());

END;
$$

-- SE CREARA AL usuario numero 9 
INSERT INTO user VALUES(DEFAULT,30111306,'223011130','PAOLA ARGUELLO',6258943304958342, 3,'ARGUELO1234pao@email.com', 035254747);
-- CONSULTAR TRIGGER 1
SELECT * FROM REG_USER;



-- TRIGGER NUMERO 2 
-- CREAR TABLA REGISTRO DE PLAZO FIJO
CREATE TABLE REG_FIXED_TERM(id_user_headline INT, inverted DECIMAL, TNA VARCHAR(30), DATE_REG DATE, TIME_REG TIME);

-- crear triger que ANTES de insertar en la tabla plazo fijo un nuevo registro evalue que no haya inconsistencia en los datos.
DELIMITER $$

CREATE TRIGGER FIXED_T_BI

BEFORE INSERT ON fixed_term

FOR EACH ROW

BEGIN

IF(NEW.inverted > 0)THEN

INSERT INTO REG_FIXED_TERM(id_user_headline,inverted,TNA,DATE_REG,TIME_REG) VALUES(NEW.id_user_headline, NEW.inverted, NEW.TNA, CURRENT_DATE(), CURRENT_TIME());

END IF;

END;

$$
    
-- este registro no debe insertarse
INSERT INTO fixed_term VALUES(DEFAULT,6,0,'01-01-23', '01-01-24', '85%','0',1);
    
-- insertar nuevo registro en fixed_term table
INSERT INTO fixed_term VALUES(DEFAULT,3,32000,'01-01-23', '01-01-24', '85%','2266',1);

SELECT * FROM REG_FIXED_TERM;