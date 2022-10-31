CREATE DATABASE atividade;

CREATE TABLE publicacoes(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    titulo VARCHAR(45),
    conteudo VARCHAR(250)
);

SELECT * FROM publicacoes;