CREATE TABLE cargos(
	codigo_cargo INT PRIMARY KEY AUTO_INCREMENT,
    nome_cargo VARCHAR(20),
    salario_cargo DOUBLE
);

CREATE TABLE colaboradores(
	codigo_colaborador INT PRIMARY KEY AUTO_INCREMENT,
    nome_colaborador VARCHAR(20),
    nascimento_colaborador DATE,
    codigo_cargo INT,
    FOREIGN KEY(codigo_cargo) REFERENCES cargos(codigo_cargo),
    estado_trabalho VARCHAR(2),
    cidade_trabalho VARCHAR(20),
    genero_colaborador VARCHAR(10)
);

INSERT INTO cargos(nome_cargo, salario_cargo) VALUES
('Desenvolvedor', 3000),
('Analista', 4.500),
('Arquiteto Software', 6.200),
('DBA', 7.700),
('Gerente de Projetos', 9.000);

INSERT INTO colaboradores(nome_colaborador, nascimento_colaborador, codigo_cargo, estado_trabalho, cidade_trabalho, genero_colaborador) VALUES
('Jefferson', '1973-05-19', 1, 'SC', 'Blumenau', 'Masculino'),
('Larissa', '1991-01-22', 5, 'SC', 'Joinville', 'Feminino'),
('Cleber', '1987-03-18', 2, 'PR', 'Curitiba', 'Masculino'),
('Luciano', '1995-08-09', 1, 'SC', 'Blumenau', 'Masculino'),
('Jéssica', '1988-08-22', 4, 'SC', 'Florianópolis', 'Feminino'),
('Guilherme', '1982-11-16', 2, 'SC', 'Blumenau', 'Masculino'),
('Marcelo', '1993-04-15', 2, 'PR', 'Londrina', 'Masculino'),
('Brenda', '1992-02-17', 1, 'SC', 'Joinville', 'Feminino'),
('Rebeca', '1984-06-26', 1, 'SC', 'Blumenau', 'Feminino'),
('Cristiano', '1983-04-15', 1, 'SC', 'Florianópolis', 'Masculino'),
('Éder', '1991-11-10', 2, 'PR', 'Curitiba', 'Masculino'),
('William', '1992-12-17', 2, 'PR', 'Curitiba', 'Masculino'),
('Vanessa', '1996-09-29', 1, 'SC', 'Blumenau', 'Feminino'),
('Robson', '1984-05-30', 1, 'PR', 'Londrina', 'Masculino'),
('Tatiana', '1999-02-03', 5, 'PR', 'Curitiba', 'Feminino'),
('Henrique', '1999-10-07', 1, 'SC', 'Blumenau', 'Masculino'),
('Lorena', '1996-04-20', 1, 'SC', 'Joinville', 'Feminino'),
('Carla', '1988-09-28', 4, 'PR', 'Curitiba', 'Feminino'),
('Alexandre', '1982-07-17', 2, 'SC', 'Blumenau', 'Masculino');

SELECT * FROM cargos;

SELECT 
	cargos.nome_cargo,
    cargos.salario_cargo,
    colaboradores.nome_colaborador
FROM cargos INNER JOIN colaboradores ON colaboradores.codigo_cargo = cargos.codigo_cargo;

SELECT cargos.nome_cargo, COUNT(*) FROM cargos INNER JOIN colaboradores ON colaboradores.codigo_cargo = cargos.codigo_cargo GROUP BY(cargos.nome_cargo);

SELECT 
	colaboradores.genero_colaborador, 
    AVG(cargos.salario_cargo) 
FROM cargos 
INNER JOIN colaboradores 
ON colaboradores.codigo_cargo = cargos.codigo_cargo 
GROUP BY(colaboradores.genero_colaborador);

SELECT nome_colaborador, DATE_FORMAT(NOW(),'%Y') -DATE_FORMAT(nascimento_colaborador,'%Y')
AS 'Idade' 
FROM colaboradores 
WHERE DATE_FORMAT(NOW(),'%Y') -DATE_FORMAT(nascimento_colaborador,'%Y') 
BETWEEN 20 AND 30;

SELECT estado_trabalho, COUNT(*) FROM colaboradores GROUP BY(estado_trabalho);

SELECT cidade_trabalho, COUNT(*) FROM colaboradores GROUP BY(cidade_trabalho);

SELECT 
	COUNT(*) 
AS 'Quantidade de mulheres com mais de 30 anos que trabalham no Paraná'
FROM colaboradores 
WHERE DATE_FORMAT(NOW(),'%Y') - DATE_FORMAT(nascimento_colaborador, '%Y') > 30
AND estado_trabalho = 'PR'
AND genero_colaborador = 'Feminino';

SELECT 
    AVG(cargos.salario_cargo),
	cidade_trabalho
FROM cargos
INNER JOIN colaboradores
ON colaboradores.codigo_cargo = cargos.codigo_cargo 
GROUP BY(cidade_trabalho);

SELECT
	AVG(cargos.salario_cargo)
AS 'Média salarial de todos os colaboradores'
FROM cargos
INNER JOIN colaboradores
ON colaboradores.codigo_cargo = cargos.codigo_cargo;

SELECT 
	nome_colaborador, nascimento_colaborador, codigo_cargo, estado_trabalho, cidade_trabalho, genero_colaborador,
    MIN(nascimento_colaborador)
FROM colaboradores;

SELECT 
	COUNT(*) 
FROM colaboradores 
WHERE DATE_FORMAT(nascimento_colaborador, '%Y')
BETWEEN 1990 AND 1999;

DROP TABLE colaboradores;
DROP TABLE cargos;




