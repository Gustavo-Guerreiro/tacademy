CREATE DATABASE exercicio01;

USE exercicio01;

CREATE TABLE clientes (
    cd_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nm_cliente VARCHAR(40),
    nm_cidade VARCHAR(20),
    nr_idade INT
);

INSERT INTO clientes (nm_cliente, nm_cidade, nr_idade) VALUES
("Érica", "Curitiba", 28),
("Lucas", "Blumenau", 16),
("Larissa", "Florianópolis", 36),
("Murilo", "Joinville", 23),
("Cristine", "Blumenau", 31),
("Robson", "Joinville", 42),
("Mariana", null, 37),
("Jean", "Blumenau", 43),
("Luana", "Pomerode", 19),
("Cleber", "Brusque", 34),
("Hellen", "Blumenau", 28),
("Paulo", "Joinville", 44),
("Alessandra", "São Paulo", 28),
("Dênis", "Blumenau", 37),
("Bianca", "Campinas", 23),
("Gabriel", "São Paulo", 26);

#1 - Selecionar todos os registros da tabela.
SELECT * FROM clientes;

#2 - Contar quantos registros possui a tabela.
SELECT COUNT(*) FROM clientes;

#3 - Retornar a maior idade e o nome da pessoa com essa idade.
SELECT nm_cliente, nr_idade from clientes
         WHERE nr_idade = (
         SELECT MAX(nr_idade) from clientes);

#4 - Exiba todas as cidades registradas sem repetição.
SELECT (nm_cidade) FROM clientes
                   WHERE nm_cidade IS NOT NULL
                   GROUP BY nm_cidade;

#5 - Exibir todas as cidades registradas e a quantidade de pessoas que moram na respectiva cidade.
SELECT nm_cidade, COUNT(nm_cidade) FROM clientes
                   WHERE nm_cidade IS NOT NULL
                   GROUP BY nm_cidade;

#6 - Exibir o nome da pessoa e a idade, onde a cidade seja nula.
SELECT nm_cliente, nr_idade FROM clientes WHERE nm_cidade IS NULL;

#7 - Exibir a média das idades.
SELECT AVG(nr_idade) AS media from clientes;

#8 - Informar o nome e a idade da pessoa mais jovem.
SELECT nm_cliente, nr_idade FROM clientes
WHERE nr_idade = (SELECT MIN(nr_idade) FROM clientes);

#9 - Exibir o nome e a idade de todas as pessoas com idade maior ou igual a média de todas as idades cadastradas.
SELECT nm_cliente, nr_idade FROM clientes
WHERE nr_idade >= (SELECT AVG(nr_idade) FROM clientes);

#10 - Listar todas nome, cidade e idade de todas as pessoas com idade entre 20 e 30 anos.
SELECT nm_cliente, nm_cidade, nr_idade FROM clientes
WHERE nr_idade >= 20 AND nr_idade <= 30;

#11 - Exibir o nome, cidade e idade de todos os clientes que moram em Blumenau e tem idade maior ou igual a 30 anos.
SELECT nm_cliente, nm_cidade, nr_idade FROM clientes
WHERE nm_cidade = "BLUMENAU" AND nr_idade >=30;

#12 - Listar o nome e cidade de todos os clientes que moram em Florianópolis ou Curitiba.
SELECT nm_cliente, nm_cidade FROM clientes
WHERE nm_cidade = "FLORIANÓPOLIS" OR nm_cidade = "CURITIBA";

#13 - Listar o nome de todos os clientes que contenham a letra L.
SELECT nm_cliente FROM clientes
WHERE nm_cliente LIKE ("%L%");

#14 - Exibir todos os nomes em ordem alfabética.
SELECT nm_cliente FROM clientes
ORDER BY nm_cliente;

#15 - Alterar para Blumenau todos os registros onde a cidade seja NULL.
UPDATE clientes SET nm_cidade = "Blumenau" WHERE nm_cidade IS NULL;

#16 - Excluir todos os clientes onde a cidade seja diferente de Blumenau.
DELETE FROM clientes WHERE nm_cidade != "Blumenau";

#17 - Excluir a tabela.
DROP TABLE clientes;