#Criar base de dados
CREATE DATABASE jsp;

use jsp;

create table pessoas(
	codigo INT auto_increment primary key,
    nome varchar(30),
    idade int
);

select * from pessoas;