CREATE TABLE produtos (
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    marca VARCHAR(25),
    valor DOUBLE,
    estoque INT
);

INSERT INTO produtos(nome, marca, valor, estoque) VALUES 
('Teclado', 'Microsoft', 220, 60),
('Monitor 32', 'Samsung', 3700, 20),
('Mouse', 'Logitech', 129.90, 45),
('Impressora', 'Epson', 430, 15),
('Mouse', 'Microsoft', 199.90, 50),
('Monitor 27', 'LG', 1990.80, 30),
('Cadeira Gamer', 'Multilaser', 1170.00, 20),
('Teclado', 'Dell', 110.00, 50),
('Mouse', 'HP', 80.00, 70),
('Placa de vídeo - GeForce GTX 1660', 'ASUS', 2800.00, 10),
('SSD de 256GB', 'Kingston', 400.00, 15),
('Processador Core i5 - 10º geração', 'Intel', 1800.00, 10),
('Mouse', 'Multilaser', 44.90, 70),
('Monitor 23', 'Dell', 1080.00, 40),
('Teclado', 'HP', 119.90, 25);

SELECT marca, COUNT(*) FROM produtos GROUP BY(marca);

SELECT AVG(valor) FROM produtos;

SELECT marca, valor FROM produtos GROUP BY(marca);

SELECT nome, valor FROM produtos ORDER BY(valor) DESC;

SELECT nome, MAX(valor) FROM produtos;

SELECT nome, valor FROM produtos WHERE valor >= (SELECT AVG(valor) FROM produtos);

SELECT nome, marca, valor, estoque FROM produtos WHERE estoque = (SELECT MAX(estoque) FROM produtos);

SELECT nome, marca, valor FROM produtos WHERE valor BETWEEN 100 AND 500;

SELECT nome, marca, valor FROM produtos WHERE nome = 'Mouse' ORDER BY valor;

SELECT marca, SUM(valor) FROM produtos GROUP BY marca;

SELECT nome, length(nome) FROM produtos;

UPDATE produtos SET marca = 'Alienware' WHERE marca = 'Dell';

DROP TABLE produtos;


