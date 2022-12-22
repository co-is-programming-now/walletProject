CREATE SCHEMA virtualwallet;
USE virtualwallet;

/* CREATE TABLE CARD */
CREATE TABLE Card(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_card TEXT NOT NULL,
    IIN VARCHAR(30) NOT NULL,
    CVV INT NOT NULL,
    state BOOLEAN NOT NULL
);

/* CREATE TABLE USER  */
CREATE TABLE User(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dni INT NOT NULL,
    cuil VARCHAR(30),
    name_surname TEXT(40),
    account_num VARCHAR(40) NOT NULL,
    id_card_user INT NOT NULL,
    email VARCHAR(90),
    phone INT
);

/* CREATE TABLE COIN */
CREATE TABLE Coin(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name TEXT(30),
    type TEXT(30),
    country TEXT(225)
);

/* CREATE TABLE BANK */
CREATE TABLE Bank(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(90),
    name TEXT(60),
    tel VARCHAR(20)
);

/* CREATE TABLE MOVEMENTS */
CREATE TABLE Movements(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type TEXT(30),
    details TEXT(225)
);


/* CREATE TABLE TYPE_ERROR */
CREATE TABLE Type_error(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title TEXT(50),
    description TEXT(225)
);


/* CREATE TABLE HISTORY OF MOVEMENTES */
CREATE TABLE History_Movements(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_type_movement INT NOT NULL,
    state TEXT(22) NOT NULL,
    description VARCHAR(225),
    id_error INT NOT NULL,
    CONSTRAINT FK_id_type_mov FOREIGN KEY (id_type_movement)
    REFERENCES Movements(id),
    CONSTRAINT FK_id_error FOREIGN KEY (id_error)
    REFERENCES Type_error(id)
);


/* CREATE TABLE ACCOUNT */
CREATE TABLE Account(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cbu VARCHAR(40) NOT NULL,
    alias VARCHAR(50),
    id_user INT NOT NULL,
    id_coin INT NOT NULL,
    id_card INT NOT NULL,
    password VARCHAR(30),
    id_bank INT NOT NULL,
    id_history_mov INT NOT NULL,
    CONSTRAINT FK_id_user FOREIGN KEY (id_user)
    REFERENCES User(id),
    CONSTRAINT FK_id_coin FOREIGN KEY (id_coin)
    REFERENCES Coin(id),
    CONSTRAINT FK_id_card FOREIGN KEY (id_card)
    REFERENCES card(id)
);


/* CREATE TABLE USER_CONTACTS */
CREATE TABLE User_contacts(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_surname VARCHAR(80) NOT NULL,
    id_contact_of INT NOT NULL,
    alias VARCHAR(50) NOT NULL,
    cvu VARCHAR(22) NOT NULL,
    account_num VARCHAR(12) NOT NULL,
    id_bank INT NOT NULL,
    CONSTRAINT FK_id_bank FOREIGN KEY (id_bank)
    REFERENCES bank(id),
    CONSTRAINT FK_id_contact_of_user FOREIGN KEY (id_contact_of)
    REFERENCES user(id)
);

/* CREATE TABLE RECIVE CASH DATA */
CREATE TABLE Recive_cash_data(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_account_recive INT NOT NULL,
    date DATE NOT NULL,
    hour TIME NOT NULL,
    amount REAL NOT NULL DEFAULT 0,
    id_coin INT NOT NULL,
    id_user_contact INT NOT NULL,
    CONSTRAINT FK_id_account_recive FOREIGN KEY(id_account_recive)
    REFERENCES Account(id),
    CONSTRAINT FK_coin FOREIGN KEY(id_coin)
    REFERENCES Coin(id),
    CONSTRAINT FK_id_user_sender FOREIGN KEY(id_user_contact)
    REFERENCES User_contacts(id)
);

/* CREATE TABLE TRANSFER CASH DATA */
CREATE TABLE Transfer_cash_data(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_account_transfer INT NOT NULL,
    date DATE NOT NULL,
    hour TIME NOT NULL,
    amount REAL NOT NULL DEFAULT 0,
    id_coin INT NOT NULL,
    id_user_contact INT NOT NULL,
    CONSTRAINT FK_id_account_transfer FOREIGN KEY(id_account_transfer)
    REFERENCES Account(id),
    CONSTRAINT FK_id_coin_transfer FOREIGN KEY(id_coin)
    REFERENCES Coin(id),
    CONSTRAINT FK_id_user_transfer FOREIGN KEY(id_user_contact)
    REFERENCES User_contacts(id)
);


