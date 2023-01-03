CREATE DATABASE clientmanager;
use clientmanager;

CREATE TABLE Client (
  clientId int NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  direction VARCHAR(50),
  phonenumber VARCHAR(10),
  PRIMARY KEY (clientId)
);

CREATE TABLE Bill (
  billId int NOT NULL AUTO_INCREMENT,
  clientId int NOT NULL,
  description VARCHAR(60),
  price int,
  date date,
  FOREIGN KEY(clientId) REFERENCES Client(clientId),

  PRIMARY KEY (billId)
);

INSERT INTO Client
  (name, direction, phonenumber)
VALUES
  ( 'Damián Martínez Ávila', 'Calle Gonzalo de Berceo 1-3-1', '658632348'),
  ( 'Damián Martínez Ávila', 'Calle Gonzalo de Berceo 1-3-1', '658632348'),
  ( 'Damián Martínez Ávila', 'Calle Gonzalo de Berceo 1-3-1', '658632348'),
  ( 'Damián Martínez Ávila', 'Calle Gonzalo de Berceo 1-3-1', '658632348'),
  ( 'Damián Martínez Ávila', 'Calle Gonzalo de Berceo 1-3-1', '658632348'),
  ( 'Damián Martínez Ávila', 'Calle Gonzalo de Berceo 1-3-1', '658632348'),
  ( 'Damián Martínez Ávila', 'Calle Gonzalo de Berceo 1-3-1', '658632348'),
  ( 'Damián Martínez Ávila', 'Calle Gonzalo de Berceo 1-3-1', '658632348'),
  ( 'Damián Martínez Ávila', 'Calle Gonzalo de Berceo 1-3-1', '658632348'),
  ( 'Maria Martínez Ávila', 'Calle Gonzalo de Berceo 1-3-2', '653537243');

INSERT INTO Bill
  (clientId,description, price, date)
VALUES
  ( 1, 'Potato', 10, '2023-01-03'),
  ( 2, 'Potato', 10, '2023-01-03'),
  ( 1, 'Potato', 10, '2023-01-03'),
  ( 2, 'Potato', 10, '2023-01-03'),
  ( 1, 'Potato', 10, '2023-01-03'),
  ( 2, 'Potato', 10, '2023-01-03'),
  ( 1, 'Potato', 10, '2023-01-03'),
  ( 2, 'Potato', 10, '2023-01-03'),
  ( 3, 'Potato', 10, '2023-01-03');
