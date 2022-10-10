CREATE DATABASE exercicio04;

USE exercicio04;

CREATE TABLE cargos (
    cd_cargo INT PRIMARY KEY AUTO_INCREMENT,
    nm_cargo VARCHAR(50),
    vl_salario DOUBLE
);

CREATE TABLE colaboradores (
    cd_colaborador INT PRIMARY KEY AUTO_INCREMENT,
    nm_colaborador VARCHAR(40),
    dt_nascimento DATE,
    cd_cargo INT,
    sg_estado VARCHAR(2),
    nm_cidade VARCHAR(20),
    ds_genero VARCHAR(10),
    FOREIGN KEY (cd_cargo) REFERENCES cargos(cd_cargo)
);

INSERT INTO cargos (nm_cargo, vl_salario) VALUES
("Desenvolvedor", 3000),
("Analista", 4500),
("Arquiteto de Software", 6200),
("Administrador de Banco de Dados", 7700),
("Gerente de Projetos", 9000);

SELECT * FROM cargos;

INSERT INTO colaboradores
(nm_colaborador, dt_nascimento,
 cd_cargo, sg_estado, nm_cidade, ds_genero)
VALUES
    ("Jefferson", "1973-05-19", 1, "SC", "Blumenau", "Masculino"),
    ("Larissa", "1991-01-22", 5, "SC", "Joinville", "Feminino"),
    ("Cleber", "1987-03-18", 2, "PR", "Curitiba", "Masculino"),
    ("Luciano", "1995-08-09", 1, "SC", "Blumenau", "Masculino"),
    ("Jéssica", "1988-08-22", 4, "SC", "Florianópolis", "Feminino"),
    ("Guilherme", "1982-11-16", 2, "SC", "Blumenau", "Masculino"),
    ("Marcelo", "1993-04-15", 2, "PR", "Londrina", "Masculino"),
    ("Brenda", "1992-02-17", 1, "SC", "Joinville", "Feminino"),
    ("Rebeca", "1984-06-26", 4, "SC", "Joinville", "Feminino"),
    ("Cristiano", "1983-07-02", 1, "SC", "Florianópolis", "Masculino"),
    ("Éder", "1991-11-10", 1, "SC", "Blumenau", "Masculino"),
    ("William", "1992-12-17", 2, "PR", "Curitiba", "Masculino"),
    ("Vanessa", "1996-09-29", 1, "SC", "Blumenau", "Feminino"),
    ("Robson", "1984-05-30", 1, "PR", "Londrina", "Masculino"),
    ("Tatiana", "1990-02-03", 5, "PR", "Curitiba", "Feminino"),
    ("Henrique", "1999-10-07", 1, "SC", "Blumenau", "Masculino"),
    ("Lorena", "1996-04-20", 1, "SC", "Joinville", "Feminino"),
    ("Carla", "1988-09-28", 4, "PR", "Curitiba", "Feminino"),
    ("Alexandre", "1982-07-17", 2, "SC", "Blumenau", "Masculino");

SELECT * FROM colaboradores;

#1
SELECT colaboradores.nm_colaborador, nm_cargo, vl_salario FROM colaboradores
    JOIN cargos ON colaboradores.cd_cargo = cargos.cd_cargo;

#2
SELECT nm_cargo, COUNT(nm_colaborador) FROM colaboradores
JOIN cargos c on c.cd_cargo = colaboradores.cd_cargo GROUP BY nm_cargo;

#3
SELECT ds_genero, AVG(vl_salario) from colaboradores
join cargos c on c.cd_cargo = colaboradores.cd_cargo GROUP BY ds_genero;

#4
SELECT nm_colaborador, dt_nascimento FROM colaboradores
WHERE DATEDIFF(CURRENT_DATE, dt_nascimento) >= (20*365.25) AND
DATEDIFF(CURRENT_DATE, dt_nascimento) <= (30*365.25);

#5
SELECT sg_estado, COUNT(cd_colaborador) FROM colaboradores
GROUP BY sg_estado;

#6
SELECT nm_cidade, COUNT(cd_colaborador) FROM colaboradores
GROUP BY nm_cidade;

#7
SELECT COUNT(cd_colaborador) FROM colaboradores
WHERE sg_estado = "PR" &&
DATEDIFF(CURRENT_DATE, dt_nascimento) >= 30 * 365.25;

#8
SELECT nm_cidade, AVG(vl_salario) AS media FROM colaboradores
JOIN cargos c on c.cd_cargo = colaboradores.cd_cargo
GROUP BY nm_cidade;

#9
SELECT AVG(vl_salario) As media FROM colaboradores
LEFT JOIN cargos c on colaboradores.cd_cargo = c.cd_cargo;

#10
SELECT * FROM colaboradores
WHERE dt_nascimento = (SELECT MIN(dt_nascimento)
FROM colaboradores);

#11
SELECT COUNT(cd_colaborador) AS quantidade_anos_90 FROM colaboradores
WHERE dt_nascimento BETWEEN '1990-01-01' AND '1999-12-31';

#12
DROP TABLE colaboradores;
DROP TABLE cargos;


