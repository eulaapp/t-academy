CREATE TABLE clientes (
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    cidade VARCHAR(20),
    idade INT
);

INSERT INTO clientes(nome, cidade, idade) VALUES 
('Érica', 'Curitiba', 28),
('Lucas', 'Blumenau', 16),
('Larissa', 'Florianópolis', 36),
('Murilo', 'Joinville', 23),
('Cristiane', 'Blumenau', 31),
('Robson', 'Joinville', 41),
('Mariana', null, 37),
('Jean', 'Blumenau', 43),
('Luana', 'Pomerode', 19),
('Cleber', 'Brusque', 34),
('Hellen', 'Blumenau', 28),
('Paulo', 'Joinville', 44),
('Alessandra', 'São Paulo', 28),
('Dênis', 'Blumenau', 37),
('Bianca', 'Campinas', 23),
('Gabriel', 'São Paulo', 26);

SELECT * FROM clientes;

SELECT COUNT(*) FROM clientes;

SELECT nome, idade FROM clientes WHERE idade = (SELECT MAX(idade) FROM clientes);

SELECT DISTINCT cidade FROM clientes;

SELECT cidade, COUNT(*) FROM clientes GROUP BY (cidade);

SELECT nome, idade FROM clientes WHERE cidade IS NULL;

SELECT AVG(idade) FROM clientes;

SELECT nome, MIN(idade) FROM clientes;

SELECT nome, idade FROM clientes WHERE idade >= (SELECT AVG(idade) FROM clientes);

SELECT nome, cidade, idade FROM clientes WHERE idade BETWEEN 20 AND 30;

SELECT nome, cidade, idade FROM clientes WHERE cidade = 'Blumenau' AND idade >= 30;

SELECT nome, cidade FROM clientes WHERE cidade = 'Blumenau' OR cidade = 'Florianópolis';

SELECT nome FROM clientes WHERE nome LIKE '%L%';

SELECT nome FROM clientes ORDER BY nome ASC;

UPDATE clientes SET cidade = 'Blumenau' WHERE cidade IS NULL;

SELECT nome, cidade FROM clientes WHERE idade = 37;

DELETE FROM clientes WHERE cidade <> 'Blumenau';

SELECT * FROM clientes;

DROP TABLE clientes;
