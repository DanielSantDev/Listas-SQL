# TRABALHO DESAFIO 1 - LABORATÓRIO DE BANCO DE DADOS


# Criação do database e das tabelas
create database bd_Desafio1;

use bd_Desafio1;

create table if not exists empregado (
cd_Emp char(8),
nm_Emp char(30),
end_Emp char(50),
city_Emp char(20),
estado_Emp char(2),
tel_Emp char(11),
dtNasc_Emp date);

create table if not exists dependente (
cd_Emp char(8),
cd_Dep int,
nm_Dep char(30),
gr_Parentesco int,
dtNasc_Dep date);

create table if not exists parentesco (
cd_parentesco int,
nm_parentesco varchar(25)
);

#Inserindo valores na tabela parentesco
insert into parentesco(cd_parentesco, nm_parentesco)
values (99, "esposa");

insert into parentesco(cd_parentesco, nm_parentesco)
values (1, "filho");

insert into parentesco(cd_parentesco, nm_parentesco)
values (2, "filha");

# Questão n. 01
alter table empregado
add primary key(cd_emp);

alter table dependente
add primary key(cd_emp,cd_dep);

alter table parentesco
add primary key(cd_Parentesco);


# Questão n. 02
alter table dependente
add foreign key(cd_emp)
references empregado(cd_Emp);

alter table dependente
add foreign key(gr_parentesco)
references parentesco(cd_Parentesco);


# Questão n. 03
#Empregado 1 e seus dependentes
INSERT INTO empregado(cd_Emp ,nm_Emp ,end_Emp ,city_Emp ,estado_Emp ,tel_Emp , dtNasc_Emp)
VALUES (1,'EDUARDO ANDERSON SILVEIRA','AV. NUMERO UM','LIMEIRA','SP','11939103568','1971/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (1,1,'ISADORA SANDRA SILVEIRA',99,'1964/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (1,2,'RENAN RAFAEL SILVEIRA',1,'2010/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (1,3,'ALANA SILVEIRA',2,'2004/01/01');

#Empregado 2 e seus dependentes
INSERT INTO empregado(cd_Emp ,nm_Emp ,end_Emp ,city_Emp ,estado_Emp ,tel_Emp , dtNasc_Emp)
VALUES (2,'HUGO CAUÃ ARAGÃO','AV. NUMERO DOIS','CAMPOS','RJ','21939112344','1965/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (2,4,'JULIA AGATA ARAGÃO',99,'1969/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (2,5,'PEDRO ARAGÃO',1,'2008/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (2,6,'LORENA MARIANE ARAGÃO',2,'2004/01/01');

#Empregado 3 e seus dependentes
INSERT INTO empregado(cd_Emp ,nm_Emp ,end_Emp ,city_Emp ,estado_Emp ,tel_Emp , dtNasc_Emp)
VALUES (3,'GUSTAVO NELSON DA COSTA','RUA NUMERO TRES','ARUJÁ','SP','11999243245','1960/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (3,7,'MILENA RODSA DA COSTA',99,'1968/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (3,8,'DANILO DA COSTA',1,'2009/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (3,9,'BARBARA DA COSTA',2,'2001/01/01');

#Empregado 4 e seus dependentes
INSERT INTO empregado(cd_Emp ,nm_Emp ,end_Emp ,city_Emp ,estado_Emp ,tel_Emp , dtNasc_Emp)
VALUES (4,'IAN THOMAS DA MATA','RUA NUMERO QUATRO','TERESÓPOLIS','RJ','21933499999','1982/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (4,10,'SOPHIA MARIANE DA MATA',99,'1975/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (4,11,'FILIPE HUGO DA MATA',1,'2015/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (4,12,'ISABEL DA MATA',2,'2008/01/01');

#Empregado 5 e seus dependentes
INSERT INTO empregado(cd_Emp ,nm_Emp ,end_Emp ,city_Emp ,estado_Emp ,tel_Emp , dtNasc_Emp)
VALUES (5,'FRANCISCO NATHAN TEIXEIRA','RUA NUMERO CINCO','SOCORRO','SP','11922339898','1985/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (5,13,'GIOVANNA ISIS TEIXEIRA',99,'1973/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (5,14,'LUIZ JORGE TEIXEIRA',1,'2016/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (5,15,'ESTHER TEIXEIRA',2,'2005/01/01');

#Empregado 6 e seus dependentes
INSERT INTO empregado(cd_Emp ,nm_Emp ,end_Emp ,city_Emp ,estado_Emp ,tel_Emp , dtNasc_Emp)
VALUES (6,'PIETRO JULIO MARTINS','AV. NUMERO SEIS','PETRÓPOLIS','RJ','11945457864','1978/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (6,16,'MARLI SILVEIRA MARTINS',99,'1972/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (6,17,'THALES JOSÉ MARTINS',1,'2014/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (6,18,'TANIA MARTINS',2,'2004/01/01');

#Empregado 7 e seus dependentes
INSERT INTO empregado(cd_Emp ,nm_Emp ,end_Emp ,city_Emp ,estado_Emp ,tel_Emp , dtNasc_Emp)
VALUES (7,'TIAGO FRANCISO MACHADO','RUA NUMERO SETE','BRAGANÇA','SP','11977443158','2000/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (7,19,'NICOLE MACHADO',99,'1998/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (7,20,'JOSÉ THIAGO MACHADO',1,'2020/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (7,21,'VERA MACHADO',2,'2013/01/01');

#Empregado 8 e seus dependentes
INSERT INTO empregado(cd_Emp ,nm_Emp ,end_Emp ,city_Emp ,estado_Emp ,tel_Emp , dtNasc_Emp)
VALUES (8,'VITOR BENTO COSTA','AV. NUMERO OITO','MANGARATIBA','RJ','21934558891','1990/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (8,22,'OLIVIA BARBOSA COSTA',99,'1992/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (8,23,'MARCELO COSTA',1,'2021/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (8,24,'ELIANE COSTA',2,'2016/01/01');

#Empregado 9 e seus dependentes
INSERT INTO empregado(cd_Emp ,nm_Emp ,end_Emp ,city_Emp ,estado_Emp ,tel_Emp , dtNasc_Emp)
VALUES (9,'CARLOS EDUARDO FERREIRA','AV. NUMERO NOVE','CAJAMAR','SP','11904315645','1996/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (9,25,'ADRIANA FERREIRA',99,'1994/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (9,26,'BENÍCIO BENTO FERREIRA',1,'2021/01/01');
INSERT INTO dependente(cd_Emp, cd_Dep, nm_Dep, gr_Parentesco, dtNasc_Dep)
VALUES (9,27,'GABRIELA FERREIRA',2,'2015/01/01');


# Questão n. 04
SELECT E.nm_Emp as Empregado,E.dtNasc_Emp as 'Data de nascimento empregado',
(SELECT D.nm_dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp and gr_Parentesco = 99) as 'Nome da Esposa',
(SELECT D.nm_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 1) as 'Nome do Filho',
(SELECT D.nm_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 2) as 'Nome da Filha'
FROM empregado as E;



# Questao n. 05
SELECT E.nm_Emp as Empregado,
(SELECT D.nm_dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp and gr_Parentesco = 99) as 'Nome da Esposa',
(SELECT D.nm_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 1) as 'Nome do Filho',
(SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 1) as 'Data nascimento filho',
(SELECT D.nm_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 2) as 'Nome da Filha',
(SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 2) as 'Data nascimento filha'
FROM empregado as E;



# Questao n. 06
SELECT E.nm_Emp as 'Nome empregado',E.dtNasc_Emp as 'Data nasc. Empregado',
(SELECT D.nm_Dep FROM Dependente as D 
WHERE E.cd_Emp = D.cd_Emp AND YEAR(curdate())- YEAR(D.dtNasc_Dep) < 12 AND gr_Parentesco = 1) as 'Filho',
(SELECT D.dtNasc_Dep FROM Dependente as D 
WHERE E.cd_Emp = D.cd_Emp AND YEAR(curdate())- YEAR(D.dtNasc_Dep) < 12 AND gr_Parentesco = 1) as 'Data nasc. filho',
(SELECT D.nm_Dep FROM Dependente as D 
WHERE E.cd_Emp = D.cd_Emp AND YEAR(curdate())- YEAR(D.dtNasc_Dep) < 12 AND gr_Parentesco = 2) as 'Filha',
(SELECT D.dtNasc_Dep FROM Dependente as D 
WHERE E.cd_Emp = D.cd_Emp AND YEAR(curdate())- YEAR(D.dtNasc_Dep) < 12 AND gr_Parentesco = 2) as 'Data nasc. filha'
FROM empregado as E
WHERE YEAR(curdate()) - year(dtNasc_Emp) between 35 AND 49;



# Questao n. 07
SELECT E.nm_Emp as 'Nome Empregado',
(SELECT D.nm_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 99) as 'Nome Esposa',
(SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 99) as 'Data nascimento esposa',
(SELECT D.nm_Dep FROM Dependente as D 
WHERE E.cd_Emp = D.cd_Emp AND YEAR(curdate())- year(D.dtNasc_Dep) > 5 AND gr_Parentesco = 1) as 'Filho',
(SELECT D.dtNasc_Dep FROM Dependente as D 
WHERE E.cd_Emp = D.cd_Emp AND YEAR(curdate())- year(D.dtNasc_Dep) > 5 AND gr_Parentesco = 1) as 'Data nasc. filho',
(SELECT D.nm_Dep FROM Dependente as D 
WHERE E.cd_Emp = D.cd_Emp AND YEAR(curdate())- year(D.dtNasc_Dep) > 5 AND gr_Parentesco = 2) as 'Filha',
(SELECT D.dtNasc_Dep FROM Dependente as D 
WHERE E.cd_Emp = D.cd_Emp AND YEAR(curdate())- year(D.dtNasc_Dep) > 5 AND gr_Parentesco = 2) as 'Data nasc. filha'
FROM empregado as E
WHERE year(curdate()) - year((SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 99)) between 20 AND 34;



# Questao n. 08
SELECT E.nm_Emp as 'Nome empregado', (SELECT D.nm_Dep FROM Dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 99) as 'Nome esposa',
(SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 99) as 'Data nasc. esposa',
(SELECT D.nm_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 1 AND YEAR(curdate()) - YEAR(D.dtNasc_Dep) > 17) as 'Nome filho',
(SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 1 AND YEAR(curdate()) - YEAR(D.dtNasc_Dep) > 17) as 'Data nasc. filho',
(SELECT D.nm_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 2 AND YEAR(curdate()) - YEAR(D.dtNasc_Dep) > 17) as 'Nome filha',
(SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 2 AND YEAR(curdate()) - YEAR(D.dtNasc_Dep) > 17) as 'Data nasc. filha'
FROM empregado as E
WHERE YEAR(curdate()) - YEAR((SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp and gr_Parentesco = 99)) > 47;



# Questao n. 09
SELECT E.nm_Emp as 'Nome empregado', (SELECT D.nm_Dep FROM Dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 99) as 'Nome esposa',
(SELECT D.nm_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 1) as 'Nome filho',
(SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 1) as 'Data nasc. filho',
(SELECT D.nm_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 2) as 'Nome filha',
(SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 2) as 'Data nasc. filha',
estado_Emp as Estado
FROM empregado as E
WHERE estado_Emp = 'RJ';



# Questao n. 10
SELECT E.nm_Emp as 'Nome empregado', (SELECT D.nm_Dep FROM Dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 99) as 'Nome esposa',
(SELECT D.nm_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 1) as 'Nome filho',
(SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 1) as 'Data nasc. filho',
(SELECT D.nm_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 2) as 'Nome filha',
(SELECT D.dtNasc_Dep FROM dependente as D
WHERE E.cd_Emp = D.cd_Emp AND gr_Parentesco = 2) as 'Data nasc. filha',
city_Emp as Cidade
FROM empregado as E
WHERE estado_Emp = 'SP';