#Criar base de dados
CREATE DATABASE jsp;

use jsp;

create table pessoas(
	codigo INT auto_increment primary key,
    nome varchar(30),
    idade int
);

delete from pessoas where nome like 'Jacinto';


select * from pessoas;