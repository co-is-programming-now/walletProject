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

CREATE TABLE answer(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(30),
    description VARCHAR(225)
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
CREATE TABLE Account(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cbu VARCHAR(40) NOT NULL,
    alias VARCHAR(50),
    id_user INT NOT NULL,
    id_coin INT NOT NULL,
    id_card INT NOT NULL,
    password VARCHAR(30),
    id_bank INT NOT NULL,
    id_operation INT NOT NULL,
    CONSTRAINT FK_id_user FOREIGN KEY (id_user)
    REFERENCES User(id),
    CONSTRAINT FK_id_coin FOREIGN KEY (id_coin)
    REFERENCES Coin(id),
    CONSTRAINT FK_id_card FOREIGN KEY (id_card)
    REFERENCES card(id)
);

CREATE TABLE operations(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_transfer INT NOT NULL DEFAULT 0,
    id_fixed_term INT NOT NULL DEFAULT 0
);

CREATE TABLE transfer(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_transfer_movement INT NOT NULL DEFAULT 0,
    id_history_transfer INT NOT NULL DEFAULT 0
);

CREATE TABLE transfer_movement(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_get_money INT NOT NULL,
    id_send_money INT NOT NULL
);

CREATE TABLE history_of_transfer(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_send_money_history INT NOT NULL DEFAULT 0,
    id_get_money_history INT NOT NULL DEFAULT 0
);

CREATE TABLE send_money_history(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user_send INT NOT NULL,
    id_answer INT NOT NULL,
    AMOUNT INT NOT NULL DEFAULT 0,
    date_hour DATETIME NOT NULL,
    CONSTRAINT FK_id_user_send FOREIGN KEY (id_user_send)
    REFERENCES account(id),
    CONSTRAINT FK_id_answer FOREIGN KEY (id_answer)
    REFERENCES answer(id)
);

CREATE TABLE get_money_history(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user_get INT NOT NULL,
    id_answer INT NOT NULL,
    AMOUNT INT NOT NULL DEFAULT 0,
    date_hour DATETIME NOT NULL,
    CONSTRAINT FK_id_user_get FOREIGN KEY (id_user_get)
    REFERENCES account(id),
    CONSTRAINT FK_answer FOREIGN KEY (id_answer)
    REFERENCES answer(id)
);

CREATE TABLE get_money(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_contact_send INT NOT NULL,
    id_account_recive INT NOT NULL,
    amount DECIMAL NOT NULL DEFAULT 0,
    date DATE NOT NULL,
    hour TIME NOT NULL,
    CONSTRAINT FK_id_contact_send FOREIGN KEY (id_contact_send)
    REFERENCES user_contacts(id),
    CONSTRAINT FK_id_account_recive FOREIGN KEY (id_account_recive)
    REFERENCES account(id)
);

CREATE TABLE send_money(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_account_send INT NOT NULL,
    id_contact_recive INT NOT NULL,
    amount DECIMAL NOT NULL DEFAULT 0,
    date DATE NOT NULL,
    hour TIME NOT NULL,
    CONSTRAINT FK_id_account_send FOREIGN KEY (id_account_send)
    REFERENCES account(id),
    CONSTRAINT FK_id_contact_recive FOREIGN KEY (id_contact_recive)
    REFERENCES User_contacts(id)
);

CREATE TABLE fixed_term(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user_headline INT NOT NULL,
    inverted DECIMAL NOT NULL,
    START DATE NOT NULL,
    END DATE NOT NULL,
    TNA VARCHAR(20) NOT NULL, 
    interest_earned DECIMAL NOT NULL DEFAULT 0,
    CONSTRAINT FK_id_user_headline FOREIGN KEY (id_user_headline)
    REFERENCES user(id)
);

/*FOREIGN KEY OPERATION REFERENCES OPERATION ID*/
ALTER TABLE account
ADD FOREIGN KEY (id_operation) REFERENCES operations(id);

/*history of transfer foreign keys*/  
ALTER TABLE history_of_transfer
ADD FOREIGN KEY (id_send_money_history) REFERENCES send_money_history(id),
add FOREIGN KEY (id_get_money_history) REFERENCES get_money_history(id);

/*TRANSFER MOVEMENT FK REFERENCES GET MONEY AND SEND MONEY TABLES*/
ALTER TABLE transfer_movement 
ADD FOREIGN KEY (id_get_money) REFERENCES get_money(id),
ADD FOREIGN KEY (id_send_money) REFERENCES send_money(id);

/*OPERATION FK*/
ALTER TABLE operations 
ADD FOREIGN KEY (id_transfer) REFERENCES transfer(id),
ADD FOREIGN KEY (id_fixed_term) REFERENCES fixed_term(id);