CREATE DATABASE extra02;

USE extra02;

# 1 - Criar uma tabela alunos com a seguinte estrutura:
# codigo_aluno - Int e PK
# nome_aluno - Varchar(30) Not Null
# nota1_aluno - Double Not Null
# nota2_aluno - Double Not Null
# media_aluno - Double
# situacao_aluno - Varchar(15)

CREATE TABLE aluno (
    codigo_aluno INT PRIMARY KEY,
    nome_aluno VARCHAR(30) NOT NULL,
    nota1_aluno DOUBLE NOT NULL,
    nota2_aluno DOUBLE NOT NULL,
    media_aluno DOUBLE,
    situacao_aluno VARCHAR(15)
);

# 2 - Criar uma trigger para gerar a média do aluno automaticamente.
CREATE TRIGGER calcular_media
BEFORE INSERT ON aluno
FOR EACH ROW
SET NEW.media_aluno = (NEW.nota2_aluno+NEW.nota1_aluno)/2;

# 3 - Com base na média do aluno, faça uma trigger para retornar a situação do aluno.
# Caso a média seja 7 ou superior, estará aprovado(a) e caso contrário reprovado(a).
CREATE TRIGGER definir_situacao
BEFORE INSERT ON aluno
FOR EACH ROW
BEGIN
    IF NEW.media_aluno >= 7 THEN
        SET NEW.situacao_aluno = "Aprovado";
    ELSE
        SET NEW.situacao_aluno = "Reprovado";
    END IF;
END;

SELECT * FROM aluno;
# 4 - Exclua as triggers e em seguida as tabelas.
DROP TRIGGER calcular_media;
DROP TRIGGER definir_situacao;
DROP TABLE aluno;

# ===========================================================

# 1 - Criar uma tabela chamada produtos contendo a seguinte estrutura:
# codigo_produto - Int AI, e PK
# nome_produto - Varchar(30) Not Null
# valor_produto - Double Not Null
# valor_promocional - Double
CREATE TABLE produto (
    codigo_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(30) NOT NULL,
    valor_produto DOUBLE NOT NULL,
    valor_promocional DOUBLE
);

# 2 - Criar uma trigger para cadastrar o valor_promocional, deverá ser cadastrado
# o valor do produto com 10% de desconto. Sempre que o usuário informar o produto e seu valor,
# deverá ser registrado: código, nome do produto, valor do produto e valor promocional.
CREATE TRIGGER cadastrar_valor_promocional
BEFORE INSERT ON produto FOR EACH ROW
SET NEW.valor_promocional = NEW.valor_produto*0.9;

# 3 - Realize uma inserção, informando o nome do produto e o valor.
INSERT INTO produto (nome_produto, valor_produto)
VALUES ("Computador", 2000);

# 4 - Remova a trigger e a tabela.
DROP TRIGGER cadastrar_valor_promocional;
DROP TABLE produto;

# ================================================================================================

# 1 - Criar uma tabela chamada produtos com a seguinte estrutura
# a. codigo_produto - Int AI e PK
# b. nome_produto - Varchar(30)
# c. segmento_produto - Varchar(20)
CREATE TABLE produtos (
    codigo_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(30),
    segmento_produto VARCHAR(20)
);

# 2 - Crie uma outra tabela chamada qtd_segmentos com a seguinte estrutura:
# a. nome_segmento - Varchar(30)
# b. quantidade_segmento - Int
CREATE TABLE qtd_segmentos (
    nome_segmento VARCHAR(30),
    quantidade_segmento INT
);

# 3 - Cadastre três segmentos e informe a quantidade zero na tabela qtd_segmentos.
INSERT INTO qtd_segmentos VALUES
("Segmento 1" ,0),
("Segmento 2", 0),
("Segmento 3", 0);

# 4 - Crie uma trigger para cadastro, quando efetuado o cadastro de um novo produto (nome do produto e o segmento),
# a tabela qtd_segmento deverá incrementar aquele determinado segmento.
CREATE TRIGGER atualizar_qtd_segmentos
AFTER INSERT ON produtos
FOR EACH ROW
    UPDATE qtd_segmentos
    SET quantidade_segmento = quantidade_segmento + 1
    WHERE qtd_segmentos.nome_segmento = NEW.segmento_produto;

INSERT INTO produtos (nome_produto, segmento_produto)
VALUES
("Produto 1", "Segmento 1"),
("Produto 2", "Segmento 2"),
("Produto 3", "Segmento 2");

# 5 - Remove a trigger e as tabelas.
DROP TRIGGER atualizar_qtd_segmentos;
DROP TABLE produtos;
DROP TABLE qtd_segmentos;