/*SCRIPT DE CREACION DE VISTAS*/

/*VISTA CON EL NOMBRE DE USUARIO ID DE CUENTA CBU ALIAS PASSWORD*/
CREATE VIEW user_account_data AS
(SELECT u.name_surname as USER, a.id as ACCOUNT_ID, a.cbu as CBU, a.alias as ALIAS, a.password as PASSWORD
FROM user u
LEFT JOIN account a ON a.id = u.id);

#SELECT * FROM user_account_data;

/*VISTA QUE ENSEÑE DATOS SOBRE RECIBO , NOMBRE DE USUARIO, ID CUENTA, QUE CUENTA LO RECIVE, QUE USUARIO, CANTIDAD ETC */

CREATE VIEW RECIVE_DITAILS AS
(SELECT u.name_surname AS USER, a.id AS ACCOUNT_ID, r.id_account_recive AS ACCOUNT_RECIVE, r.id_user_contact AS USER_CONTACT, amount
FROM user u
LEFT JOIN account a ON u.id = a.id
RIGHT JOIN recive_cash_data r ON a.id = r.id
);

#SELECT * FROM RECIVE_DITAILS;


/*VISTA PARA SABER CUANTOS CONTACTOS TIENE UN USUARIO*/   
CREATE VIEW how_much_contacts AS   
(SELECT u.name_surname AS USER, COUNT(uc.id_contact_of) AS USER_CONTACTS
FROM user u
LEFT JOIN user_contacts uc ON uc.id_contact_of = u.id
GROUP BY u.name_surname
HAVING count(*) > 0);

#SELECT * FROM how_much_contacts;

/*VISTA QUE MUESTRA, QUE CUENTA REALIZO UNA TRANSFERENCIA, A QUIEN, LA CANTIDAD FECHA Y HORA*/
CREATE VIEW Transfer_data AS
(SELECT u.name_surname AS USER, tcd.id_account_transfer AS account_send_to, tcd.id_user_contact AS contact_had_recived,tcd.amount, tcd.date, tcd.hour
FROM transfer_cash_data tcd
JOIN user u ON u.id = tcd.id_account_transfer
ORDER BY amount desc
);

#SELECT * FROM Transfer_data;

/*VISTA CONFIGURABLE PARA SABER CUAL FUE EL USUARIO QUE TRANSFIRIO EL MAYOR MONTO*/
CREATE VIEW maxTransfer AS
(SELECT u.name_surname AS MAX_TRANSFER, tcd.amount AS MAX_AMOUNT,date,hour
FROM transfer_cash_data tcd
JOIN user u ON u.id = tcd.id_account_transfer
WHERE tcd.amount = (SELECT max(amount) FROM transfer_cash_data));

#SELECT * FROM maxTransfer;