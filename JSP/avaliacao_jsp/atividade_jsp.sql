CREATE DATABASE atividade;
USE atividade;

CREATE TABLE publicacao(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(45),
    conteudo VARCHAR(4096)
);

CREATE TABLE comentario(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    mensagem VARCHAR(250),
    aprovado BOOLEAN,
    codigo_publicacao INT,
    codigo_usuario INT,
    FOREIGN KEY (codigo_publicacao) REFERENCES publicacao(codigo),
    FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo)
);

CREATE TABLE usuario(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    sobrenome VARCHAR(255),
    email VARCHAR(255),
    senha VARCHAR(255),
    isActive boolean,
    isAdmin boolean
);

INSERT INTO usuario(nome, sobrenome, email, senha, isActive, isAdmin) VALUE ('Eula', 'Pereira', 'eula@gmail.com', '123abc', true, true);

INSERT INTO publicacao (titulo, conteudo) VALUES 
('Caipirinha', '1 limão grande<br>2 colheres de açúcar<br>gelo a gosto<br>cachaça'),
('Bolo de Maçã, Aveia e Canela', '3 maçãs<br>3 ovos<br>2 e meia xícaras (chá) de Aveia Flocos Orgânica NESTLÉ®<br>3 colheres (sopa) de óleo de coco<br>1 colher (sopa) de fermento em pó<br>1 pitada de canela em pó para polvilhar'),
('Açaí com Banana e Leite em pó ', '1 banana madura<br>1 polpa de açaí congelada, sem açúcar<br>fatias de banana<br>2 colheres (sopa) de Leite em pó Molico® Desnatado'),
('Toucinho do céu', '1 litro de leite<br>4 ovos<br>2 xícaras de açúcar<br>1 1/2 xícaras de trigo<br>1 colher margarina<br>100 g de coco ralado'),
('Mousse de Limao', '1 Leite MOÇA® (lata ou caixinha) 395 g<br>meia xícara (chá) de suco de limão<br>raspas da casca de 1 limão<br>3 claras<br>2 colheres (sopa) de açúcar'),
('Pudim', '1 Leite MOÇA® (lata ou caixinha)<br>2 medidas (da lata) de Leite Líquido NINHO® Forti+ Integral<br>3 ovos'),
('Omelete', '2 ovos<br>sal<br>queijo'),
('Salada', 'Alface<br>Azeite<br>Milho<br>Tomate'),
('Bolo de Cenoura', '3 cenouras médias (250g) <br> 4 ovos <br> meia xícara (chá) de óleo <br> 2 e meia xícaras (chá) de farinha de trigo <br> 2 xícaras (chá) de açúcar <br> 1 colher (sopa) de fermento em pó'),
('Mingau de Aveia', '250 ml de Leite Líquido MOLICO® Total Cálcio <br> 3 colheres (sopa) de Aveia Flocos NESTLÉ®'),
('Pão de Queijo', '1 e meia xícara (chá) de Leite Líquido NINHO® Forti+ Integral <br>1 colher (sopa) de MAGGI® Fondor <br> meia xícara (chá) de óleo <br>500 g de polvilho doce<br>2 ovos ligeiramente batidos<br>3 xícaras (chá) de queijo meia cura ralado');






