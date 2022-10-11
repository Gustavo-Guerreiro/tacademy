CREATE DATABASE exercicio06;

USE exercicio06;

CREATE TABLE professores(
    cd_professor INT PRIMARY KEY AUTO_INCREMENT,
    nm_professor VARCHAR(20)
);

CREATE TABLE materias(
    cd_materia INT PRIMARY KEY AUTO_INCREMENT,
    cd_professor INT,
    nm_materia VARCHAR(20),
    FOREIGN KEY (cd_professor) REFERENCES professores (cd_professor)
);

CREATE TABLE turmas (
    cd_turma INT PRIMARY KEY AUTO_INCREMENT,
    nm_turma VARCHAR(2),
    ds_turno VARCHAR(10)
);

CREATE TABLE alunos (
    cd_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nm_aluno VARCHAR(30)
);

CREATE TABLE aluno_turmas(
    cd_aluno INT,
    cd_materia INT,
    cd_turma INT,
    FOREIGN KEY (cd_aluno) REFERENCES alunos(cd_aluno),
    FOREIGN KEY (cd_materia) REFERENCES materias(cd_materia),
    FOREIGN KEY (cd_turma) REFERENCES turmas(cd_turma)
);

INSERT INTO professores (nm_professor) VALUES
("Renato"),
("Oscar"),
("Cátia"),
("Osvaldo"),
("Marília"),
("Paula"),
("Otávio"),
("Airton");

INSERT INTO materias (cd_professor, nm_materia) VALUES
(1, "Matemática"),
(2, "Geografia"),
(7, "Química"),
(6, "Filosofia"),
(1, "Física"),
(3, "Português"),
(3, "Inglês"),
(6, "Sociologia"),
(5, "Português"),
(4, "História"),
(4, "Sociologia"),
(5, "Espanhol"),
(8, "Biologia"),
(8, "Química");

INSERT INTO turmas (nm_turma, ds_turno) VALUES
("6A", "Matutino"),
("6B", "Vespertino"),
("7A", "Matutino"),
("7A", "Vespertino"),
("8A", "Matutino"),
("8B", "Vespertino");

INSERT into alunos (nm_aluno) VALUES
("Alessandra"),
("Emanuela"),
("Cíntia"),
("Diego"),
("Eduardo"),
("Larissa"),
("Jonathan"),
("Cleber"),
("Jéssica"),
("Lucas"),
("Murilo"),
("Marcelo"),
("Rebeca"),
("Tatiana"),
("Taís"),
("Gabriel"),
("Felipe"),
("Eliza"),
("Sarah"),
("Patrícia");

INSERT INTO aluno_turmas VALUES
(1,1,1),
(2,5,1),
(3,10,2),
(4,14,1),
(5,1,1),
(6,2,6),
(7,3,2),
(8,6,3),
(9,5,4),
(10,4,4),
(11,1,5),
(12,5,2),
(13,8,3),
(14,13,6),
(15,6,5),
(16,14,3),
(17,9,5),
(18,3,1),
(19,8,4),
(20,5,6),
(4,10,3),
(15,2,1),
(12,10,1),
(9,8,6);

#1 - Exibir o nome do aluno, nome da matéria e nome da turma.
SELECT nm_aluno, nm_materia, nm_turma FROM aluno_turmas
LEFT JOIN alunos a on a.cd_aluno = aluno_turmas.cd_aluno
LEFT JOIN materias m on m.cd_materia = aluno_turmas.cd_materia
LEFT JOIN professores p on p.cd_professor = m.cd_professor
LEFT JOIN turmas t on t.cd_turma = aluno_turmas.cd_turma;

#2 - Nome de cada professor e matéria que leciona.
SELECT nm_professor, nm_materia FROM professores RIGHT JOIN
materias m on professores.cd_professor = m.cd_professor;

#3 - Quantidade de alunos em cada turma.
SELECT nm_turma, COUNT(cd_aluno) FROM aluno_turmas
JOIN turmas t on t.cd_turma = aluno_turmas.cd_turma
GROUP BY nm_turma;

#4 - Quantidade de alunos por turno.
SELECT ds_turno, COUNT(cd_aluno) FROM aluno_turmas
JOIN turmas t on t.cd_turma = aluno_turmas.cd_turma
GROUP BY ds_turno;

#5 - Listar todos os alunos (nome do aluno), turma e matéria, onde o professor Renato leciona.
SELECT nm_aluno, nm_turma, nm_materia FROM aluno_turmas
 JOIN turmas t on t.cd_turma = aluno_turmas.cd_turma
 JOIN alunos a on aluno_turmas.cd_aluno = a.cd_aluno
 JOIN materias m ON aluno_turmas.cd_materia = m.cd_materia
 WHERE cd_professor =
    (SELECT professores.cd_professor FROM professores
        WHERE nm_professor = "Renato");

#6 - Listar o nome de todos os professores que lecionam química.
SELECT nm_professor FROM professores
RIGHT JOIN materias m ON
    professores.cd_professor = m.cd_professor
WHERE nm_materia = "Quimica";

#7 - Quais alunos estão cadastrados na matéria de história?
SELECT nm_aluno FROM aluno_turmas
LEFT JOIN alunos a on a.cd_aluno = aluno_turmas.cd_aluno
LEFT JOIN materias m on aluno_turmas.cd_materia = m.cd_materia
WHERE nm_materia = "História";

#8 - Nome do professor que leciona as matérias de português e inglês.
# Tem alguma solução alternativa usando os conceitos que nós temos?
SELECT nm_professor FROM professores
JOIN materias m on professores.cd_professor = m.cd_professor
WHERE nm_materia IN ("Português", "Inglês")
GROUP BY nm_professor HAVING COUNT(DISTINCT nm_materia) = 2;

#9 - Quantidade de alunos matriculados por matéria.
SELECT nm_materia, COUNT(cd_aluno) AS qt_alunos FROM aluno_turmas
JOIN materias m on m.cd_materia = aluno_turmas.cd_materia
GROUP BY nm_materia;

#10 - Quais são os alunos que têm aula com a professor Cátia da matéria de inglês?
SELECT nm_aluno, nm_materia FROM aluno_turmas
JOIN alunos a on a.cd_aluno = aluno_turmas.cd_aluno
JOIN materias m on m.cd_materia = aluno_turmas.cd_materia
JOIN professores p on p.cd_professor = m.cd_professor
WHERE nm_materia = "Inglês" AND nm_professor="Cátia";

#11 - Quantidade de alunos da turma 6A que tem aula de matemática com o professor Renato?
SELECT COUNT(cd_aluno) FROM aluno_turmas
JOIN materias m on aluno_turmas.cd_materia = m.cd_materia
JOIN professores p on p.cd_professor = m.cd_professor
WHERE nm_professor = "Renato" AND nm_materia = "Matemática";

#12 - Exiba quais matérias o professor Airton leciona.
SELECT nm_materia from materias
WHERE cd_professor =
    (SELECT cd_professor FROM professores WHERE nm_professor = "Airton");

#13 - Quantidade de alunos no período vespertino que estão tendo aula de biologia.
SELECT COUNT(aluno_turmas.cd_aluno) FROM aluno_turmas
JOIN materias m on m.cd_materia = aluno_turmas.cd_materia
JOIN alunos a on a.cd_aluno = aluno_turmas.cd_aluno
JOIN turmas t on aluno_turmas.cd_turma = t.cd_turma
WHERE nm_materia = "Biologia" AND ds_turno = "Vespertino";

#14 - Remover todas as tabelas.
DROP TABLE aluno_turmas;
DROP TABLE alunos;
DROP TABLE turmas;
DROP TABLE materias;
DROP TABLE professores;