drop database blog;

create database blog;

use blog;

create table postagem (
	cd_postagem integer auto_increment,
    nm_cliente varchar(50) not null,
    ds_titulo varchar(100) not null,
    ds_mensagem varchar(255) not null,
    hr_postagem datetime,
	primary key (cd_postagem)
);

create table comentario (
	cd_comentario integer auto_increment,
    nm_cliente varchar(50) not null,
    ds_mensagem varchar(150) not null,
    cd_postagem integer not null,
    hr_postagem datetime,
    primary key (cd_comentario),
    foreign key (cd_postagem) references postagem(cd_postagem)
);
