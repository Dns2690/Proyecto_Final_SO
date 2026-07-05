CREATE DATABASE proyecto_so;
USE proyecto_so;

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  email VARCHAR(100)
);

CREATE TABLE servicios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_servicio VARCHAR(50),
  descripcion VARCHAR(255)
);

CREATE TABLE logs_sistema (
  id INT AUTO_INCREMENT PRIMARY KEY,
  evento VARCHAR(100),
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nombre, email) VALUES ('Denis Salazar', 'denis@empresa.local');
INSERT INTO servicios (nombre_servicio, descripcion) VALUES ('Hosting Web', 'Servicio de alojamiento institucional');
INSERT INTO logs_sistema (evento) VALUES ('Base de datos creada');

SELECT * FROM usuarios;
SELECT * FROM servicios;
SELECT * FROM logs_sistema;
