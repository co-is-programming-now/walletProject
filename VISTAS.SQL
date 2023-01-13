/*SCRIPT DE CREACION DE VISTAS*/

/*VISTA CON EL NOMBRE DE USUARIO ID DE CUENTA CBU ALIAS PASSWORD*/
CREATE VIEW user_account_data AS

(SELECT u.name_surname as USER, a.id as ACCOUNT_ID, a.cbu as CBU, a.alias as ALIAS, a.password as PASSWORD

FROM user u

LEFT JOIN account a ON a.id = u.id);

#SELECT * FROM user_account_data;

/*VISTA PARA SABER CUANTOS CONTACTOS TIENE UN USUARIO*/   
CREATE VIEW how_much_contacts AS 
  
(SELECT u.name_surname AS USER, COUNT(uc.id_contact_of) AS USER_CONTACTS

FROM user u

LEFT JOIN user_contacts uc ON uc.id_contact_of = u.id

GROUP BY u.name_surname

HAVING count(*) > 0);

#SELECT * FROM how_much_contacts;


/*VISTA PARA PODER VISUALIZAR LA INFORMACION DE LA TABLA HISTORIAL DE MOVIMINETOSMAS DETALLADA*/
CREATE or replace VIEW visualice_history AS

(SELECT u.name_surname, m.type, a.title

FROM user u

JOIN history_of_movements hm ON hm.id_account_made = u.id

JOIN movements m on hm.id_movement = m.id

JOIN answer a on hm.id_answer = a.id

ORDER BY hm.id asc

);

/*VISTA QUE ENSEÑE DATOS DE la operacion de recivir dinero */
CREATE or replace VIEW get_money_operation_DITAILS AS

(SELECT u.name_surname AS USER, a.id ,uc.name_surname , gm.id_account_recive, gm.id_contact_send, amount,gm.DATE_OPERATION as date

FROM user u

 JOIN account a ON u.id = a.id

 JOIN get_money gm ON a.id = gm.id

 JOIN user_contacts uc ON uc.id = gm.id
 
 ORDER BY gm.date_operation
);


SELECT * FROM get_money_operation_DITAILS;

SELECT * FROM get_money;
select * from account;
select * from user;