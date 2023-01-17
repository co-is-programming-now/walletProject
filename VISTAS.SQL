-- SCRIPT DE CREACION DE VISTAS

-- VISTA NUMERO 1 USER_ACCOUNT DATA
CREATE VIEW user_account_data AS

(SELECT u.name_surname as USER, a.id as ACCOUNT_ID, a.cbu as CBU, a.alias as ALIAS, a.password as PASSWORD

FROM user u

LEFT JOIN account a ON a.id = u.id);

#SELECT * FROM user_account_data;

-- VISTA NUMERO 2 HOW_MUCH_CONTACTS  
CREATE VIEW how_much_contacts AS 
  
(SELECT u.name_surname AS USER, COUNT(uc.id_contact_of) AS USER_CONTACTS

FROM user u

LEFT JOIN user_contacts uc ON uc.id_contact_of = u.id

GROUP BY u.name_surname

HAVING count(*) > 0);

#SELECT * FROM how_much_contacts;


/*VISTA NUMERO 3 VISUALICE_HISTORY*/
CREATE or replace VIEW visualice_history AS

(SELECT u.name_surname, m.type, a.title

FROM user u

LEFT JOIN  history_of_movements hm ON hm.id_account_made = u.id

JOIN movements m on hm.id_movement = m.id

JOIN answer a on hm.id_answer = a.id

ORDER BY hm.id

);

#SELECT * FROM visualice_history;


/*VISTA NUMERO 4 GET_M_OPERATION_D */
CREATE or replace VIEW get_m_operation_d AS

(SELECT u.name_surname AS USER, a.id ,uc.name_surname , gm.id_account_recive, gm.id_contact_send, amount,gm.DATE_OPERATION as date

FROM user u

 JOIN account a ON u.id = a.id

 JOIN get_money gm ON a.id = gm.id

 JOIN user_contacts uc ON uc.id = gm.id
 
 ORDER BY gm.date_operation
);


#SELECT * FROM get_m_operation_d;


-- VISTA NUMERO 5 