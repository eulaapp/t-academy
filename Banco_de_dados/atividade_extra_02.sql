#1
CREATE TABLE alunos(
	codigo_aluno INT PRIMARY KEY AUTO_INCREMENT,
	nome_aluno VARCHAR(30) NOT NULL,
	nota1_aluno DOUBLE NOT NULL,
	nota2_aluno DOUBLE NOT NULL,
	media_aluno DOUBLE,
	situacao_aluno VARCHAR(15)
);

CREATE TRIGGER gerar_media
BEFORE INSERT ON alunos
FOR EACH ROW
SET NEW.media_aluno = ((new.nota1_aluno + new.nota2_aluno) / 2);

INSERT INTO alunos(nome_aluno, nota1_aluno, nota2_aluno) VALUE ('José', 7.5, 8);

DELIMITER $$

CREATE TRIGGER resultado
BEFORE INSERT ON alunos
FOR EACH ROW
BEGIN
	IF (new.media_aluno >= 7) THEN 
		SET NEW.situacao_aluno = 'Aprovado';
	ELSE 
		SET NEW.situacao_aluno = 'Reprovado';
	END IF;
   END $$
DELIMITER ;

SELECT * FROM alunos;

DROP TRIGGER gerar_media;
DROP TRIGGER resultado;
DROP TABLE alunos;

#2
CREATE TABLE produtos(
	codigo_produto INT PRIMARY KEY AUTO_INCREMENT,
	nome_produto VARCHAR(30) NOT NULL,
	valor_produto DOUBLE NOT NULL,
	valor_promocional DOUBLE
);

CREATE TRIGGER cadastrar_desconto
BEFORE INSERT ON produtos
FOR EACH ROW
SET NEW.valor_promocional = (new.valor_produto - 0.1 * new.valor_produto);

INSERT INTO produtos(nome_produto, valor_produto) VALUE ('Televisão', 100);

SELECT * FROM produtos;

DROP TRIGGER cadastrar_desconto;
DROP TABLE produtos;

#3
CREATE TABLE produtos(
	codigo_produto INT PRIMARY KEY AUTO_INCREMENT,
	nome_produto VARCHAR(30),
	segmento_produto VARCHAR(20)
);

CREATE TABLE qtd_segmentos(
	nome_segmento VARCHAR(30),
	qtd_segmento INT
);

INSERT INTO qtd_segmentos(nome_segmento, qtd_segmento) VALUES
('Alimentos', 0),
('Têxtil', 0),
('Automotivo', 0);

CREATE TRIGGER cadastro_produtos
BEFORE INSERT ON produtos
FOR EACH ROW
UPDATE qtd_segmentos SET qtd_segmento = qtd_segmento+1 WHERE new.segmento_produto = nome_segmento;

INSERT INTO produtos(nome_produto, segmento_produto) VALUES ('Carro', 'Automotivo');

SELECT * FROM qtd_segmentos;

DROP TRIGGER cadastro_produtos;
DROP TABLE produtos;
DROP TABLE qtd_segmentos;



