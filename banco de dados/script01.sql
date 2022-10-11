CREATE DATABASE base;

USE base;

CREATE TABLE produtos(
	codigo INT PRIMARY KEY auto_increment, 
    nome VARCHAR(30), 
    marca VARCHAR(20),
    valor DOUBLE,
    dataCadastrado DATE 
);

#Cadastrar produtos informando todas as colunas 1
INSERT INTO produtos VALUES(null, 'Notebook Inspiron', 'Dell', 4599, '2022-10-10');

#Cadastrar produtos informando apenas algumas opções
INSERT INTO produtos(nome, marca, valor) VALUES('Notebook Dell', 'Dell', 2900);

#Cadastrar vários produtos
INSERT INTO produtos VALUES
(null, 'iPhone 12', 'Apple', 7000,'2022-08-07'),
(null, 'Monitor predator', 'Acer', 1950,'2022-10-07'),
(null, 'Notebook vostro', 'Dell', 3800,'2022-03-16');

#Selecionar todos os dados de uma tabela
SELECT * FROM produtos;

#Seleciona apenas algumas colunas da tabela
SELECT nome, valor FROM produtos;

#Selecionar produtos com valor inferior a tres mil reais
SELECT * FROM produtos WHERE valor < 3000;

#Selecione infos nullas
SELECT * FROM produtos WHERE dataCadastrado IS NULL;

#Agrupar informações
SELECT MAX(valor) AS 'Maior valor' FROM produtos; #maior valor
SELECT MIN(valor) AS 'Menor valor' FROM produtos; #menor valor
SELECT AVG(valor) AS 'Média valor' FROM produtos; #media dos valores
SELECT COUNT(*) AS 'Registros' FROM produtos; #retorna todos os registros

# Condicional
SELECT 
	nome,
    valor,
	IF(valor >= 3000, valor * 0.9, valor * 0.95) AS 'Pagamento à vista'
FROM produtos;

# Escolha (switch case)

SELECT 
	nome,
	valor,
	CASE 
		WHEN valor <= 1000 THEN  valor * 0.95
        WHEN valor <= 2000 THEN  valor * 0.90
        WHEN valor <= 4000 THEN  valor * 0.85
        ELSE valor * 0.80
	END
    AS desconto
FROM produtos;

# Operadores lógicos (AND, OR)
SELECT * FROM produtos WHERE marca = 'Dell' AND valor >= 3000;

# Ordenar dados
SELECT nome FROM produtos ORDER BY nome DESC;

# Agrupar
SELECT marca FROM produtos GROUP BY marca;

# Contém (like)
SELECT nome From produtos WHERE nome LIKE 'n%';
SELECT nome FROM produtos WHERE nome LIKE '%o';
SELECT nome FROM produtos WHERE nome LIKE '%p%';

# Alterar dados - UPDATE
UPDATE produtos SET valor = 7000 WHERE codigo = 1;
SELECT * FROM produtos;

# sub-query (utiliza dois comandos sql ao mesmo tempo)
SELECT * FROM produtos WHERE valor = (SELECT MAX(valor) FROM produtos);

# remover dados - DELETE
DELETE FROM produtos WHERE nome LIKE 'Notebook%';

# limpar a tabela e reiniciar o autro incremento
TRUNCATE TABLE produtos;

# Listar as colunas da tabela
DESCRIBE produtos;

#Adicionar coluna
ALTER TABLE produtos ADD COLUMN dataCadastro DATE;

#Excluir coluna
ALTER TABLE produtos DROP COLUMN dataCadastrado;

# alterar característica das colunas
ALTER TABLE produtos MODIFY COLUMN nome VARCHAR(50);

# renomear produtos
ALTER TABLE produtos RENAME COLUMN nome TO produto;

# excluir table
DROP TABLE produtos;

# excluir base de dados
DROP DATABASE base;




/*
	> Maior
    < Menor
    >= Maior ou igual
    <= Menor ou igual
	= igual
	<> diferente
*/
