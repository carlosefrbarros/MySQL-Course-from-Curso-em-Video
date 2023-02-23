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

#12th Class

use cadastro;

select * from cursos
where nome like 'P%';

select * from cursos
where nome like 'a%';

select * from cursos
where nome like '%a';

select * from cursos
where nome like '%a%';

select * from cursos
where nome not like '%a%';

select * from cursos
where nome like 'ph%p%';

select * from cursos
where nome like 'ph%p_';

select distinct carga from cursos;

select nacionalidade from gafanhotos;

select distinct nacionalidade from gafanhotos
order by nacionalidade;

select count(*) from cursos;

select count(*) from cursos
where carga > 40;

select max(carga) from cursos;

select max(totaulas) from cursos;

select max(totaulas) from cursos
where ano = '2016';

select min(totaulas) from cursos
where ano = '2016';

select sum(totaulas) from cursos
where ano = '2016';

select avg(totaulas) from cursos where ano = '2016';

#exercises

#uma lista com o nome de todas as gafanhotas
select nome from gafanhotos where sexo = 'F';

#uma lista com os dados de todos aqueles que nasceram entre 01/jan/2000 e 31/dez/2015
select * from gafanhotos where nascimento > '2000-01-01' and nascimento < '2015-12-31';

#uma lista com o nome de todos os homens que trabalham como Programadores
select nome from gafanhotos where sexo = 'M' and profissao = 'Programador';

#uma lista com os dados de todas as mulheres que nasceram no Brasil e que têm seu nome iniciando com a letra J
select * from gafanhotos where nacionalidade = 'Brasil' and sexo = 'F' and nome like 'j%';

#uma lista com o nome e nacionalidade de todos os homens que têm Silva no nome, não nasceram no Brasil e pesam menos de 100 kg
select nome, nacionalidade from gafanhotos where sexo = 'M' and nacionalidade != 'Brasil' and peso < '100' and nome like '%Silva%';

#qual é a maior altura entre gafanhotos homens que moram no Brasil
select max(altura) from gafanhotos where sexo = 'M' and nacionalidade = 'Brasil';

#qual é a média de peso dos gafanhotos cadastrados
select avg(peso) from gafanhotos;

#qual é o menor peso entre as gafanhotos mulheres que nasceram fora do Brasil e entre 01/jan/1990 e 31/dez/2000
select min(peso) from gafanhotos where sexo = 'F' and nacionalidade != 'Brasil' and nascimento > '1990/01/01' and nascimento < '2000-12-01';

#quantas gafanhotos mulheres têm mais de 1.90 de altura
select count(*) from gafanhotos where altura > '1.90' and sexo = 'F';

#13th Class

use cadastro;

select distinct carga from cursos
order by carga;

select carga from cursos
group by carga;

select carga, count(nome) from cursos
group by carga;

select totaulas from cursos
order by totaulas;

select distinct totaulas from cursos
order by totaulas;

select totaulas from cursos
group by totaulas
order by totaulas;

select totaulas, count(*) from cursos
group by totaulas
order by totaulas;

select * from cursos where totaulas = '30';

select carga, count(*) from cursos
where totaulas = '30'
group by carga;

select carga, count(nome) from cursos
group by carga
having count(nome) > '3';

select ano, count(*) from cursos
group by ano
order by count(*), ano;

select ano, count(*) from cursos
group by ano
having count(*) >= '5'
order by count(*) desc;

select ano, count(*) from cursos
group by ano
having ano > '2016'
order by count(*) desc;

select ano, count(*) from cursos
where totaulas > '30'
group by ano
having ano > '2013'
order by count(*) desc;

select avg(carga) from cursos;

select carga, count(*) from cursos
where ano > '2015'
group by carga
having carga > (select avg(carga) from cursos)
order by carga;

#exercises

#uma lista com as profissões dos gafanhotos e seus respectivos quantitativos
select profissao, count(*) from gafanhotos
group by profissao
order by profissao;

#quantos gafanhotos homens e quantas mulheres nasceram após 01/jan/2005
select sexo, count(*) from gafanhotos
where nascimento > '2005-01-01'
group by sexo;

#uma lista com os gafanhotos que nasceram fora do Brasil, mostrando o país de origem e o total de pessoas nascidas lá. Só nos interessam os países que tiveram mais de 3 gafanhotos com essa nacionalidade
select nacionalidade, count(*) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(*) > '3'
order by nacionalidade;

#uma lista agrupada pela altura dos gafanhotos, mostrando quantas pessoas pesam mais de 100kg e que estão acima da média de altura de todos os cadastrados
select altura, count(*) from gafanhotos
where peso > '100'
group by altura
having altura > (select avg(altura) from gafanhotos)
order by altura;

#15th Class

use cadastro;

desc gafanhotos;

alter table gafanhotos
add column cursopreferido int;

desc gafanhotos;

alter table gafanhotos
add foreign key (cursopreferido)
references cursos (idcurso);

desc gafanhotos;

select * from gafanhotos;
select * from cursos;

update gafanhotos set cursopreferido = '6' where id = '1';

select * from gafanhotos;

delete from cursos
where idcurso = '6';

select nome, cursopreferido from gafanhotos;

select nome, ano from cursos;

select gafanhotos.nome, cursos.nome, cursos.ano 
from gafanhotos join cursos
on cursos.idcurso = gafanhotos.cursopreferido;

select gafanhotos.nome, cursos.nome, cursos.ano 
from gafanhotos join cursos
on cursos.idcurso = gafanhotos.cursopreferido
order by gafanhotos.id;

select g.nome, c.nome, c.ano
from gafanhotos as g inner join cursos as c
on c.idcurso = g.cursopreferido
order by g.nome;

select g.nome, c.nome, c.ano
from gafanhotos as g left outer join cursos as c
on c.idcurso = g.cursopreferido;

select g.nome, c.nome, c.ano
from gafanhotos as g left join cursos as c
on c.idcurso = g.cursopreferido;

select g.nome, c.nome, c.ano
from gafanhotos as g right outer join cursos as c
on c.idcurso = g.cursopreferido;

select g.nome, c.nome, c.ano
from gafanhotos as g right join cursos as c
on c.idcurso = g.cursopreferido;

#16th Class

use cadastro;

create table gafanhoto_assiste_curso (
id int not null auto_increment,
data date,
idgafanhoto int,
idcurso int,
primary key (id),
foreign key (idgafanhoto) references gafanhotos (id),
foreign key (idcurso) references cursos (idcurso)
) default charset=utf8mb4;

insert into gafanhoto_assiste_curso values
(default, '2014-03-01', '1', '2');

select * from gafanhoto_assiste_curso;

select g.nome, c.nome from gafanhotos as g
join gafanhoto_assiste_curso as a
on g.id = a.idgafanhoto
join cursos as c
on c.idcurso = a.idcurso
order by g.nome;

