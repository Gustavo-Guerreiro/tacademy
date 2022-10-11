CREATE DATABASE exercicio07;

USE exercicio07;

CREATE TABLE professores (
    cd_professor INT PRIMARY KEY AUTO_INCREMENT,
    nm_professor VARCHAR(20)
);

CREATE TABLE cursos (
    cd_curso INT PRIMARY KEY AUTO_INCREMENT,
    nm_curso VARCHAR(20),
    vl_curso DOUBLE,
    cd_professor INT,
    FOREIGN KEY (cd_professor) REFERENCES professores (cd_professor)
);

CREATE TABLE alunos (
    cd_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nm_aluno VARCHAR(20),
    dt_nascimento date,
    nm_estado VARCHAR(20),
    nm_cidade VARCHAR(40)
);

CREATE TABLE alunos_cursos (
    cd_aluno INT,
    cd_curso INT,
    ds_status VARCHAR(20),
    FOREIGN KEY (cd_aluno) REFERENCES alunos (cd_aluno),
    FOREIGN KEY (cd_curso) REFERENCES cursos (cd_curso)
);

INSERT INTO professores (nm_professor) VALUES
("Larissa"),
("Daniel"),
("Gustavo"),
("Carla"),
("Guilherme"),
("Carina"),
("Lúcio"),
("Bianca");

INSERT INTO cursos (nm_curso, vl_curso, cd_professor) VALUES
("Java - Básico", 1000, 2),
("Java - Avançado", 1250, 2),
("Spring Boot", 1800, 2),
("C#", 1140, 7),
("ASP.NET Core", 1800, 7),
("Python", 900, 4),
("Flask", 1020, 4),
("Django", 1400, 4),
("PHP", 950, 4),
("Laravel", 1600, 4),
("Angular", 2300, 1),
("React", 2100, 1),
("HTML", 500, 8),
("CSS", 700, 8),
("JavaScript", 900, 4),
("Banco de dados", 600, 3),
("Design Patterns", 2700, 8);

INSERT INTO alunos (nm_aluno, dt_nascimento, nm_estado, nm_cidade) VALUES
("Aline", "1997-03-01", "Santa Catarina", "Blumenau"),
("Mariana", "1993-08-28", "Santa Catarina", "Joinville"),
("Gustavo", "2000-11-14", "São Paulo", "Campinas"),
("Bianca", "1999-01-07", "Santa Catarina", "Blumenau"),
("Ricardo", "2002-07-30", "Paraná", "Curitiba"),
("Tamara", "2005-02-22", "São Paulo", "São Paulo"),
("Juliano", "1986-09-19", "Paraná", "Londrina"),
("Fernanda", "1987-01-28", "São Paulo", "São Paulo"),
("Alice", "2001-06-13", "Santa Catarina", "Blumenau"),
("Henrique", "1991-01-24", "Rio de Janeiro", "Niterói"),
("Marcelo", "1988-12-08", "Paraná", "Curitiba"),
("Daniela", "1998-10-14", "Santa Catarina", "Florianópolis"),
("Caroline", "2002-04-10", "Paraná", "Maringá"),
("Letícia", "1993-08-22", "São Paulo", "São Paulo"),
("Mauro", "1996-09-08", "Santa Catarina", "Jaraguá do Sul");

INSERT INTO alunos_cursos VALUES
(1,2,"Concluído"),
(3,6,"Em andamento"),
(1,7,"Concluído"),
(4,2,"Em andamento"),
(9,16,"Não iniciado"),
(8,10,"Concluído"),
(1,4,"Concluído"),
(4,9,"Não iniciado"),
(10,2,"Em andamento"),
(7,1,"Concluído"),
(12,2,"Não iniciado"),
(2,1,"Não iniciado"),
(15,7,"Não iniciado"),
(11,2,"Concluído"),
(6,13,"Em andamento"),
(3,4,"Em andamento"),
(4,10,"Em andamento"),
(9,17,"Concluído"),
(1,5,"Em andamento"),
(10,8,"Em andamento");

#1 - Listar a quantidade de cursos que cada aluno esteja participando. Deverá obrigatoriamente exibir o nome de todos
# os alunos e a quantidade de cursos.
SELECT nm_aluno, COUNT(cd_curso) AS qt_cursos FROM alunos
LEFT JOIN alunos_cursos ac on alunos.cd_aluno = ac.cd_aluno
GROUP BY nm_aluno;

#2 - Exibir a quantidade de cursos através do status.
SELECT ds_status, COUNT(cd_curso) AS qt_cursos FROM alunos_cursos
GROUP BY ds_status;

#3 - Exiba o nome do aluno e o nome do curso, onde o status esteja concluído e o valor do curso seja de pelo menos
# R$1.000,00.
SELECT nm_aluno, nm_curso FROM alunos_cursos
JOIN alunos a on a.cd_aluno = alunos_cursos.cd_aluno
JOIN cursos c on c.cd_curso = alunos_cursos.cd_curso
WHERE ds_status = "Concluído" AND vl_curso >=1000;

#4 - Exibir a quantidade de alunos, agrupando pelo estado onde vive.
SELECT nm_estado, COUNT(cd_aluno) FROM alunos
GROUP BY nm_estado;

#5 - Listar o nome dos alunos e o nome dos cursos, onde o status seja Não iniciado.
SELECT nm_aluno, nm_curso FROM alunos_cursos
JOIN cursos c on c.cd_curso = alunos_cursos.cd_curso
JOIN alunos a on a.cd_aluno = alunos_cursos.cd_aluno
WHERE ds_status = "Não iniciado";

#6 - Exiba o nome dos alunos e quantidade de cursos que estão cadastrados, onde a idade seja inferior a 18 anos (deverá
# levar em consideração a data e hora atuais).
SELECT nm_aluno, COUNT(alunos_cursos.cd_curso) AS qt_cursos
FROM alunos_cursos
JOIN alunos a on a.cd_aluno = alunos_cursos.cd_aluno
JOIN cursos c on c.cd_curso = alunos_cursos.cd_curso
WHERE DATEDIFF(CURRENT_DATE, dt_nascimento) >= (18*365.25)
GROUP BY nm_aluno;

#7 - Exiba o nome do curso mais caro, seu valor e a quantidade de alunos que estão participando.
SELECT nm_curso, vl_curso, COUNT(cd_aluno) AS qt_alunos
FROM alunos_cursos
JOIN cursos c on c.cd_curso = alunos_cursos.cd_curso
WHERE vl_curso =
      (SELECT MAX(vl_curso) FROM cursos)
GROUP BY nm_curso;

#8 - Exiba os nomes de todos os professores e a quantidade de cursos que eles lecionam.
SELECT nm_professor, COUNT(cd_curso) AS qt_turmas FROM cursos
RIGHT JOIN professores p on cursos.cd_professor = p.cd_professor
GROUP BY nm_professor;

#9 - Exiba o nome de todos os professores e a quantidade de alunos que participam de todos os cursos.
SELECT nm_professor, nm_curso, COUNT(cd_aluno) AS qt_alunos
FROM alunos_cursos
RIGHT JOIN cursos c on alunos_cursos.cd_curso = c.cd_curso
RIGHT JOIN professores p on p.cd_professor = c.cd_professor
GROUP BY nm_professor, nm_curso;

#10 - Exibir o nome de todos os alunos, além do nome do curso, valor do curso e nome do professor contidos na tabela
# alunos_cursos.
SELECT nm_aluno, nm_curso, vl_curso, nm_professor
FROM alunos_cursos
JOIN alunos a on alunos_cursos.cd_aluno = a.cd_aluno
JOIN cursos c on c.cd_curso = alunos_cursos.cd_curso
JOIN professores p on p.cd_professor = c.cd_professor;

#11 - Realize a média dos valores comercializados em todos os cursos.
SELECT AVG(vl_curso) AS media FROM cursos;

#12 - Retorne o nome do curso, valor e quantidade de alunos, onde o valor do curso seja maior ou igual a média.
SELECT nm_curso, vl_curso, COUNT(alunos_cursos.cd_aluno)
FROM alunos_cursos
JOIN cursos c on alunos_cursos.cd_curso = c.cd_curso
JOIN alunos a on alunos_cursos.cd_aluno = a.cd_aluno
WHERE vl_curso >= (SELECT AVG(vl_curso) AS media FROM cursos)
GROUP BY nm_curso;

SELECT * FROM alunos
ORDER BY dt_nascimento ASC;

#13 - Remover todos os alunos com idade superior a 30 anos.
DELETE FROM alunos WHERE
    DATEDIFF(CURRENT_DATE, dt_nascimento) >= 30*365.25;

#14 - Excluir todas as tabelas.
DROP TABLE alunos_cursos;
DROP TABLE alunos;
DROP TABLE cursos;
DROP TABLE professores;
