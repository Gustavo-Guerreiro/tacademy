CREATE DATABASE exercicio03;

USE exercicio03;

DROP TABLE alunos;

CREATE TABLE alunos (
    nm_aluno VARCHAR(40),
    ds_turma VARCHAR(10),
    vl_nota1 DOUBLE,
    vl_nota2 DOUBLE,
    vl_nota3 DOUBLE,
    ds_turno VARCHAR(10)
);

INSERT INTO alunos (nm_aluno, ds_turma, vl_nota1, vl_nota2, vl_nota3, ds_turno) VALUES
("Ana Paula", "7A", 5, 8, 7, "Vespertino"),
("Caio Neves", "8B", 3, 4, 2, "Matutino"),
("Isabella Fontana", "7C", 9, 8.5, 9, "Vespertino"),
("Daniel Luz", "8A", 2, 5, 4, "Vespertino"),
("Gabriela Braga", "8A", 10, 10, 10, "Vespertino"),
("Elen Souza", "7A", 5, 8, 7, "Matutino"),
("Luciana Biltz", "8B", 9.5, 10, 10, "Vespertino"),
("Paulo Almeida", "8A", 10, 10, 10, "Matutino"),
("Carla Malta", "7B", 3, 7, 9, "Matutino"),
("Diogo Andrade", "8C", 10, 9, 10, "Vespertino"),
("Mônica Mota", "8A", 7, 7, 8, "Vespertino"),
("Juliana Lima", "8C", 9, 8, 2, "Vespertino"),
("Marcelo Matos", "7A", 9, 10, 5, "Matutino");

SELECT * FROM alunos;

#1 - Utilizando condicional IF, retorne o nome do aluno, média e a situação (média 7 ou superior
# aprovado, caso contrário reprovado).
SELECT nm_aluno,
((vl_nota1 + vl_nota2 + vl_nota3)/3) AS media,
IF(((vl_nota1 + vl_nota2 + vl_nota3)/3) >= 7,
"Aprovado", "Reprovado") AS situacao FROM alunos;

#2 - Exibir a quantidade de alunos por turno, exiba o nome do turno e a quantidade.
SELECT ds_turno, count(ds_turno) FROM alunos
GROUP BY ds_turno;

#3 - Exibir a quantidade de alunos por turma, exiba o nome da turma e a quantidade.
SELECT ds_turma, count(ds_turma) FROM alunos
GROUP BY ds_turma;

#4 - Nome e média de todos os alunos com média maior ou igual a 7.
SELECT nm_aluno,
((vl_nota1 + vl_nota2 + vl_nota3)/3) AS media
FROM alunos
WHERE ((vl_nota1 + vl_nota2 + vl_nota3)/3) >= 7;

#5 - Quantidade de alunos do turno vespertino reprovados.
SELECT COUNT(*) FROM alunos
WHERE ((vl_nota1+vl_nota2+vl_nota3)/3) < 7
AND ds_turno = "VESPERTINO";

#6 - Nome de todos os alunos com a maior média.
SELECT nm_aluno FROM alunos WHERE
((vl_nota1+vl_nota2+vl_nota3)/3) =
(SELECT MAX(((vl_nota1+vl_nota2+vl_nota3)/3))
 FROM alunos);

#7 - Exibir a média de cada turma.
SELECT ds_turma,
(AVG((vl_nota1+vl_nota2+vl_nota3)/3)) AS media
FROM alunos GROUP BY ds_turma;

#8 - Migrar os alunos da 8B para a 8A.
UPDATE alunos SET ds_turma = "8A" WHERE ds_turma = "8B";

#9 - Remover tabela.
DROP TABLE alunos;