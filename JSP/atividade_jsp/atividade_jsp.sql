CREATE DATABASE atividade;

CREATE TABLE publicacao(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(45),
    conteudo VARCHAR(250)
);

CREATE TABLE comentario(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    mensagem VARCHAR(250),
    codigo_publicacao INT,
    FOREIGN KEY (codigo_publicacao) REFERENCES publicacao(codigo)
);

SELECT * FROM publicacao WHERE codigo = 1;

SELECT * FROM publicacao;
SELECT COUNT(*) FROM comentario;
