CREATE DATABASE jsp;

USE jsp;

CREATE TABLE pessoas(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    idade INT
);

SELECT * FROM pessoas