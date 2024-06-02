﻿CREATE DATABASE Parcial2Mvajc;

USE [master]
GO
CREATE LOGIN [usrparcial2] WITH PASSWORD=N'12345678',
  DEFAULT_DATABASE = [Parcial2Mvajc],
  CHECK_EXPIRATION = OFF,
  CHECK_POLICY = ON
GO
USE [Parcial2Mvajc]
GO
CREATE USER [usrparcial2] FOR LOGIN [usrparcial2]
GO
ALTER ROLE [db_owner] ADD MEMBER [usrparcial2]
GO

DROP TABLE Serie;

CREATE TABLE Serie (
  id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  titulo VARCHAR(250) NOT NULL,
  sinopsis VARCHAR(5000) NOT NULL,
  director VARCHAR(100) NOT NULL,
  episodios INT NOT NULL,
  fechaEstreno DATE NOT NULL,

);

ALTER TABLE Serie ADD estado SMALLINT NOT NULL DEFAULT 1; -- -1: Eliminado, 0: Inactivo, 1: Activo

ALTER PROC paSerieListar @parametro VARCHAR(50)
AS
  SELECT * FROM Serie
  WHERE estado<>-1 AND titulo LIKE '%'+REPLACE(@parametro,' ','%')+'%'; 

EXEC paProductoListar 'hoja carta';