DROP TABLE Serie;

CREATE TABLE Serie (
  id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  titulo VARCHAR(250) NOT NULL,
  sinopsis VARCHAR(5000) NOT NULL,
  director VARCHAR(100) NOT NULL,
  episodios INT NOT NULL,
  fechaEstreno DATE NOT NULL

);
-- estado
ALTER TABLE Serie ADD estado SMALLINT NOT NULL DEFAULT 1; -- -1: Eliminado, 0: Inactivo, 1: Activo

-- fun listar
create PROC paSerieListar @parametro VARCHAR(250)
AS
  SELECT * FROM Serie
  WHERE estado<>-1 AND titulo LIKE '%'+REPLACE(@parametro,' ','%')+'%'; 

-- EXEC paSerieListar ; busca uno  X
-- datos
-- Insertar datos para la serie "Breaking Bad"
INSERT INTO Serie (titulo, sinopsis, director, episodios, fechaEstreno)
VALUES ('Breaking Bad', 'Un profesor de química con cáncer se convierte en un fabricante de metanfetamina para asegurar el futuro de su familia.', 'Vince Gilligan', 62, '2008-01-20');

-- Insertar datos para la serie "Game of Thrones"
INSERT INTO Serie (titulo, sinopsis, director, episodios, fechaEstreno)
VALUES ('Game of Thrones', 'Serie basada en la serie de novelas "Canción de hielo y fuego" de George R. R. Martin, que narra las violentas luchas dinásticas entre varias familias nobles por el control del Trono de Hierro.', 'David Benioff, D. B. Weiss', 73, '2011-04-17');

-- Insertar datos para la serie "American Horror Story"
INSERT INTO Serie (titulo, sinopsis, director, episodios, fechaEstreno)
VALUES ('American Horror Story', 'Una serie de antología de horror que presenta una nueva historia y un nuevo conjunto de personajes en cada temporada.', 'Ryan Murphy, Brad Falchuk', 103, '2011-10-05');

select * from Serie