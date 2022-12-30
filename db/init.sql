CREATE DATABASE clientmanager;
use clientmanager;

CREATE TABLE clients (
  id int NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  direction VARCHAR(50),
  phonenumber VARCHAR(10),
  PRIMARY KEY (id)
);

INSERT INTO clients
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
