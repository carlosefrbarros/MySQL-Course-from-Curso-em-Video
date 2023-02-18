#3th and 4th Classes

create database cadastro
default character set utf8mb4
default collate utf8mb4_general_ci;

use cadastro;

create table pessoas (
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) default 'Brasil',
primary key(id)
)default charset utf8mb4;

#5th Class

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil');

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Maria', '1999-12-30', 'F', '55.2', '1.65', 'Portugal');

insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', default);

insert into pessoas values
(default, 'Adalgiza', '1930-11-02', 'F', '63.2', '1.75', 'Irlanda');

insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Cláudio', '1975-04-22', 'M', '99.0', '2.15', 'Brasil'),
(default, 'Pedro', '1999-12-03', 'M', '87', '2', default),
(default, 'Janaína', '1987-11-12', 'F', '75.4', '1.66', 'EUA');

select * from pessoas;

#6th class

#descreve as colunas e as especificações
describe pessoas;
desc pessoas;

alter table pessoas
add column profissao varchar(10);

alter table pessoas
drop column profissao;

alter table pessoas
add column profissao varchar(10) after nome;

alter table pessoas
add codigo int first;

alter table pessoas
modify column profissao varchar(20);

alter table pessoas
modify profissao varchar(20) not null default '';

alter table pessoas
change column profissao prof varchar(20);

alter table pessoas
rename to gafanhotos;

create table if not exists cursos (
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
totalaulas int unsigned,
ano year default '2016'
) default charset utf8mb4;

alter table cursos
add column idcurso int first;

describe cursos;

alter table cursos
add primary key (idcurso);

alter table cursos
drop primary key;

alter table cursos
modify column idcurso int primary key first;

drop table cursos;

#7th Class

insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Progamação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
('5', 'Jarva', 'Introdução à Linguagem Java', '10', '29', '2000'),
('6', 'MySQL', 'Banco de Dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de Word', '40', '30', '2016'),
('8', 'Sapateado', 'Danças Rítmicas', '40', '37', '2018'),
('9', 'Cozinha Árabe', 'Aprender a fazer Kibe', '40', '30', '2018'),
('10', 'YouTuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2018');

select * from cursos;

update cursos
set nome = 'HTML5'
where idcurso = '1';

select * from cursos;

update cursos
set nome = 'PHP', ano = '2015'
where idcurso = '4';

select * from cursos;

update cursos
set nome = 'Java', carga = '40', ano = '2015'
where idcurso = '5'
limit 1;

select * from cursos;

delete from cursos
where idcurso = '8';

select * from cursos;

delete from cursos
where ano = '2018'
limit 1;

truncate table cursos;

select * from cursos;

#8th Class

#dump created -> server > data export

drop database cadastro;

#dump imported -> server > data import

use cadastro;

show tables;

desc cursos;

select * from cursos;

#9th Class

#commands used at the MySQL Console

show databases;

#status;

use cadastro;

show tables;

describe cursos;

#11th Class

use cadastro;

select * from gafanhotos;

select * from cursos 
order by nome;

select * from cursos
order by nome desc;

select * from cursos
order by nome asc;

select nome, carga, ano from cursos
order by nome;

select ano, nome, carga from cursos
order by ano;

select ano, nome, carga from cursos
order by ano, nome;

select * from cursos
where ano = '2016'
order by nome;

select nome, carga from cursos
where ano = '2016'
order by nome;

select nome, descricao, ano from cursos
where ano <= '2015'
order by ano, nome;

select nome, descricao, ano from cursos
where ano != '2016'
order by ano, nome;

select nome, descricao, ano from cursos
where ano <> '2016'
order by ano, nome;

select nome, ano from cursos
where ano between '2014' and '2016'
order by ano desc, nome;

select nome, descricao, ano from cursos
where ano in ('2014', '2016')
order by ano, nome;

select nome, carga, totaulas from cursos
where carga > 35 and totaulas < 30;



