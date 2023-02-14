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

