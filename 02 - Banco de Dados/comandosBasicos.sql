# Criar a base de dados.
CREATE DATABASE base;

# Selecionar base de dados
USE base;

# Criar tabela de produtos
CREATE TABLE produtos(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    marca VARCHAR(20),
    valor DOUBLE,
    dataCadastro DATE
);

# Cadastrar produtos #1
INSERT INTO produtos VALUES(null, "Notebook Inspiron", "Dell", 4599, "2022-10-10");

# Cadastrar produtos #2
INSERT INTO produtos (nome, marca, valor) VALUES ("Notebook Dell", "Dell", 2900);

# Cadastrar produtos #3
INSERT INTO produtos VALUES
(null, "IPhone 13", "Apple", 7000, "2020-08-07"),
(null, "Monitor Predator", "Acer", 1950, "2022-10-07"),
(null, "Notebokk Vostro", "Dell", 3800, "2022-03-16");

# Selecionar todos os produtos
SELECT * FROM produtos;

# Selecionar as colunas nome e valor
SELECT nome, valor FROM produtos;

# Selecionar produtos com valor a 3000 reais
SELECT * FROM produtos WHERE valor < 3000;

# Selecionar informações com atributos nulos
SELECT * FROM produtos WHERE dataCadastro IS NULL;

# Agrupar informações
SELECT MAX(valor) AS "Maior Valor" FROM produtos;
SELECT MIN(valor) AS "Menor Valor" FROM produtos;
SELECT AVG(valor) AS "Média Valor" FROM produtos;
SELECT COUNT(*) AS "Registros" FROM produtos;

# Condicional
SELECT 
	nome,
    valor,
    IF(valor >= 3000, valor*0.9, valor*0.95) AS "Pagamento a vista"
FROM produtos;

# Escolha
SELECT
	nome,
	valor,
    CASE 
		WHEN valor <= 1000 THEN valor * 0.95
        WHEN valor <= 2000 THEN valor * 0.90
        WHEN valor <= 4000 THEN valor * 0.85
        ELSE valor * 0.80
	END AS "Desconto"
FROM produtos;

# Operadores lógicos
SELECT * FROM produtos WHERE marca = "Dell" AND valor >= 3000;

# Ordenar dados
SELECT nome FROM produtos ORDER BY nome DESC;

# Agrupar
SELECT marca FROM produtos GROUP BY marca;

# Contem (like)
SELECT nome FROM produtos WHERE nome LIKE "Notebook%";
SELECT nome FROM produtos WHERE nome LIKE "%o";
SELECT nome FROM produtos WHERE nome LIKE "%p%";

# Update
UPDATE produtos SET valor = 7000 WHERE codigo = 1;  

# Sub-query
SELECT * FROM produtos WHERE valor = (SELECT MAX(valor) from produtos);

# Remover dados - DELETE
DELETE FROM produtos WHERE nome LIKE "Notebook%";

# Limpar a tabela e reiniciar auto incremento
TRUNCATE TABLE produtos;

# Listar as colunas da tabela
DESCRIBE produtos;

# Criar coluna
ALTER TABLE produtos ADD COLUMN estoque INT;

# Remover coluna
ALTER TABLE produtos DROP COLUMN estoque;

# Alterar características das colunas
ALTER TABLE produtos MODIFY COLUMN nome varchar(50);

# Renomear coluna
ALTER TABLE produtos RENAME COLUMN nome TO produto;

# Excluir tabela
DROP TABLE produtos;

# Excluir base de dados
DROP DATABASE base;

/*
	> MAIOR
    < MENOR
    >= MENOR OU IGUAL
    <= MENOR OU IGUAL
    = IGUAL
    <> DIFERENTE
*/
