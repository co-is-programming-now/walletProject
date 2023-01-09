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

/*CRETE TABLE ANSWER*/
CREATE TABLE answer(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type INT,
    title VARCHAR(30),
    details VARCHAR(225)
);

/*CREATE TABLE ORG*/
CREATE TABLE org(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(100),
    location VARCHAR(60),
    phone INT DEFAULT 0,
    email VARCHAR(100)
);

/* CREATE TABLE MOVEMENTS */
CREATE TABLE Movements(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(30),
    details TEXT(225)
);

/* CREATE TABLE USER_CONTACTS */
CREATE TABLE User_contacts(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_surname VARCHAR(80) NOT NULL,
    id_contact_of INT NOT NULL DEFAULT 0,
    alias VARCHAR(50) NOT NULL,
    cvu VARCHAR(22) NOT NULL,
    account_num VARCHAR(12) NOT NULL,
    id_bank INT NOT NULL,
    CONSTRAINT FK_id_bank FOREIGN KEY (id_bank)
    REFERENCES bank(id),
    CONSTRAINT FK_id_contact_of_user FOREIGN KEY (id_contact_of)
    REFERENCES user(id)
);

/* CREATE TABLE ACCOUNT */
CREATE TABLE account(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cbu BIGINT NOT NULL,
    alias VARCHAR(50),
    id_user INT NOT NULL,
    id_coin INT NOT NULL,
    id_card INT NOT NULL,
    password VARCHAR(30),
    id_bank INT NOT NULL,
    CONSTRAINT FK_id_user FOREIGN KEY (id_user)
    REFERENCES User(id),
    CONSTRAINT FK_id_coin FOREIGN KEY (id_coin)
    REFERENCES Coin(id),
    CONSTRAINT FK_id_card FOREIGN KEY (id_card)
    REFERENCES card(id),
    CONSTRAINT FK_id_banc FOREIGN KEY (id_bank)
    REFERENCES bank(id)
);

/* CREATE TABLE HISTORY OF MOVEMENTES */
CREATE TABLE history_of_movements(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_movement INT NOT NULL,
    id_account_made INT NOT NULL,
    id_answer INT NOT NULL,
    CONSTRAINT FK_id_movement FOREIGN KEY (id_movement)
    REFERENCES Movements(id),
    CONSTRAINT FK_id_account_made FOREIGN KEY (id_account_made)
    REFERENCES account(id),
    CONSTRAINT FK_id_answer FOREIGN KEY (id_answer)
    REFERENCES answer(id)
);

/*CREATE TABLE GET MONEY*/
CREATE TABLE get_money(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_account_recive INT NOT NULL,
    id_contact_send INT NOT NULL,
    DATE_OPERATION VARCHAR(8) NOT NULL,
    HOUR time NOT NULL,
    AMOUNT DECIMAL NOT NULL DEFAULT 0,
    id_coin INT NOT NULL,
    id_answer INT NOT NULL,
    CONSTRAINT FK_id_account_recive FOREIGN KEY (id_account_recive)
    REFERENCES account(id),
    CONSTRAINT FK_id_contact_send FOREIGN KEY (id_contact_send)
    REFERENCES user_contacts(id),
    CONSTRAINT FK_id_coin_get FOREIGN KEY (id_coin)
    REFERENCES Coin(id),
    CONSTRAINT FK_id_answer_get FOREIGN KEY (id_answer)
    REFERENCES answer(id)
);

/*CREATE TABLE SEND MONEY*/
CREATE TABLE send_money(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_account_send INT NOT NULL,
    id_contact_recive INT NOT NULL,
    DATE_OPERATION VARCHAR(8) NOT NULL,
    HOUR time NOT NULL,
    AMOUNT DECIMAL NOT NULL DEFAULT 0,
    id_coin INT NOT NULL,
    id_answer INT NOT NULL,
    CONSTRAINT FK_id_account_send FOREIGN KEY (id_account_send)
    REFERENCES account(id),
    CONSTRAINT FK_id_contact_recive FOREIGN KEY (id_contact_recive)
    REFERENCES user_contacts(id),
    CONSTRAINT id_coin_send FOREIGN KEY (id_coin)
    REFERENCES Coin(id),
    CONSTRAINT id_answer_send FOREIGN KEY (id_answer)
    REFERENCES answer(id)
);

/*CREATE TABLE FIXED TERM*/
CREATE TABLE fixed_term(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user_headline INT NOT NULL,
    inverted DECIMAL NOT NULL DEFAULT 0,
    DATE_START_OPERATION VARCHAR(8) NOT NULL,
    DATE_END_OPERATION VARCHAR(8) NOT NULL,
    TNA VARCHAR(30),
    interest_earned VARCHAR(30),
    id_answer INT NOT NULL,
    CONSTRAINT FK_id_user_headline FOREIGN KEY (id_user_headline)
    REFERENCES account(id),
    CONSTRAINT FK_id_answer_fixed_term FOREIGN KEY (id_answer)
    REFERENCES answer(id)
);

/*CREATE TABLE DONATION*/
CREATE TABLE donations(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_donor_account INT NOT NULL,
    DATE_OPERATION VARCHAR(8) NOT NULL,
    AMOUNT INT NOT NULL DEFAULT 0,
    id_coin INT NOT NULL,
    id_org INT NOT NULL,
    id_answer INT NOT NULL,
    CONSTRAINT FK_id_donor_account FOREIGN KEY (id_donor_account)
    REFERENCES account(id),
    CONSTRAINT FK_id_coin_donor FOREIGN KEY (id_coin)
    REFERENCES coin(id),
    CONSTRAINT FK_org FOREIGN KEY (id_org)
    REFERENCES org(id),
    CONSTRAINT FK_id_answer_donation FOREIGN KEY (id_answer)
    REFERENCES answer(id)
);

/*CREATE TABLE INVESTMENT*/
CREATE TABLE investment(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_investment_account INT NOT NULL,
    id_coin_investment INT NOT NULL,
    DATE_OPERATION VARCHAR(8) NOT NULL,
    AMOUNT DECIMAL NOT NULL DEFAULT 0,
    id_answer INT NOT NULL,
    CONSTRAINT FK_id_investment_account FOREIGN KEY (id_investment_account)
    REFERENCES account(id),
    CONSTRAINT FK_id_coin_investment FOREIGN KEY (id_coin_investment)
    REFERENCES coin(id),
    CONSTRAINT FK_id_answer_investment FOREIGN KEY (id_answer)
    REFERENCES answer(id)
);

