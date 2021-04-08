DROP DATABASE IF EXISTS Actividad;
CREATE DATABASE Actividad;
USE Actividad;

CREATE TABLE Usuario(
  Identificador INT PRIMARY KEY NOT NULL,
  Nombre TEXT NOT NULL
)ENGINE = InnoDB;

CREATE TABLE Actividad(
  Identificador INT PRIMARY KEY NOT NULL,
  Nombre TEXT NOT NULL,
  Barrio TEXT NOT NULL
)ENGINE = InnoDB;

CREATE TABLE Relacion(
  Usuario INT NOT NULL,
  FOREIGN KEY(Usuario) REFERENCES Usuario(Identificador),
  Actividad INT NOT NULL,
  FOREIGN KEY(Actividad) REFERENCES Actividad(Identificador),
  Valoracion INT NOT NULL
)ENGINE = InnoDB;

INSERT INTO Usuario VALUES(0,'Juan');
INSERT INTO Usuario VALUES(1,'Pedro');
INSERT INTO Usuario VALUES(2,'Mario');
INSERT INTO Usuario VALUES(3,'Luis');
INSERT INTO Actividad VALUES(0,'jugar','sants');
INSERT INTO Actividad VALUES(1,'actividad','sant andreu');
INSERT INTO Actividad VALUES(2,'leer','santa coloma');
INSERT INTO Actividad VALUES(3,'escribir','bellvitge');
INSERT INTO Relacion VALUES(0,3,4);
INSERT INTO Relacion VALUES(3,0,1);
INSERT INTO Relacion VALUES(2,2,3);
INSERT INTO Relacion VALUES(1,0,5);
INSERT INTO Relacion VALUES(2,1,4);
INSERT INTO Relacion VALUES(2,0,3);
INSERT INTO Relacion VALUES(3,3,1);
INSERT INTO Relacion VALUES(0,0,0);
INSERT INTO Relacion VALUES(1,2,5);
INSERT INTO Relacion VALUES(2,1,4);
INSERT INTO Relacion VALUES(3,1,5);


SELECT Actividad.Nombre FROM (Actividad,Relacion) WHERE (Actividad.Barrio = 'sants' AND Actividad.Identificador = Relacion.Actividad AND Relacion.Valoracion <= 4)


