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



/*VISTA PARA PODER VISUALIZAR LA INFORMACION DE LA TABLA HISTORIAL DE MOVIMINETOS*/
CREATE or replace  VIEW visualice_history AS
(SELECT u.name_surname AS ACCOUNT_MADE
FROM user u
JOIN history_of_movements hm ON hm.id_account_made = u.id,
 (SELECT m.type AS MADE
	FROM movements m
    JOIN history_of_movements hm on hm.id_movement = m.id) AS m_type
);

select * from visualice_history;
-- -- esto devuelve history_of_movements
select type from history_of_movements;
-- quiero crear una vista que me permita ver el nombre del usuario,
--  el tipo de
-- movimiento que realizo y el titulo de la respuesta
-- pero esto es toda la query q pude desarrollar :(





/*VISTA QUE ENSEÑE DATOS la operacion de recivir dinero */

CREATE VIEW get_money_operation_DITAILS AS
(SELECT u.name_surname AS USER, a.id AS ACCOUNT_ID, gm.id_account_recive AS ACCOUNT_RECIVE, gm.id_contact_send AS USER_CONTACT, amount
FROM user u
LEFT JOIN account a ON u.id = a.id
RIGHT JOIN get_money gm ON a.id = gm.id
);

#SELECT * FROM get_money_operation_DITAILS;