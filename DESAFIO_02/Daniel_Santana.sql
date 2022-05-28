#Laboratório de banco de dados - TRABALHO DESAFIO 2
#  Grupo: 
#  Daniel Santana
#  Victor Monteiro Arnoni
#SGBD USADO: MYSQL

# ***** CRIAÇÃO DAS TABELAS *****
Create database TR2_1sem_22;                               
Use TR2_1sem_22;
CREATE TABLE Empregado 
 (Empr_cd_Empregado Char(8) NOT NULL, 
 Empr_nm_Empregado Char(30), 
 Empr_ds_Endereco Char(50), 
 Empr_nm_Cidade Char(20), 
 Empr_nm_Estado char(2),
 Empr_nm_Telefone char(11),
 Empr_dt_Nascimento Date); 

 CREATE TABLE Dependente 
 (Empr_cd_Empregado Char(8) NOT NULL, 
 Depe_cd_Dependente Integer NOT NULL, 
 Depe_nm_Dependente Char(30), 
 Pare_cd_Parentesco Integer, 
 Depe_dt_Nascimento Date); 
 
 CREATE TABLE Parentesco 
 (Pare_cd_Parentesco Integer NOT NULL, 
 Pare_ds_Parentesco char(25)); 

alter table empregado
add primary key (empr_cd_empregado);

alter table dependente
add primary key (empr_cd_empregado,depe_cd_dependente);

alter table parentesco
add primary key (pare_cd_parentesco);

alter table dependente
add foreign key (empr_cd_empregado) references empregado (empr_cd_empregado);

alter table dependente
add foreign key (pare_cd_parentesco) references parentesco (pare_cd_parentesco);


# ***** INSERINDO REGISTROS *****
insert into parentesco values (99, 'Esposa');
insert into parentesco values (1, 'Filha');
insert into parentesco values (2, 'Filho');

insert into empregado values (1,'Empregado 1','Rua 1','Campinas','sp','33642735','1967-01-01');
insert into empregado values (2,'Empregado 2','Rua 2','Cabo Frio','rj','33257896','1967-01-01');
insert into empregado values (3,'Empregado 3','Rua 3','Franca','sp','33754127','1967-01-01');

insert into empregado values (4,'Empregado 4','Rua 4','Araruama','rj','33675896','1975-01-01');
insert into empregado values (5,'Empregado 5','Rua 5','Barretos','sp','33641258','1975-01-01');
insert into empregado values (6,'Empregado 6','Rua 6','Resende','rj','33634185','1975-01-01');

insert into empregado values (7,'Empregado 7','Rua 7','Taubate','sp','33675896','1990-01-01');
insert into empregado values (8,'Empregado 8','Rua 8','Volta Redonda','rj','33641258','1990-01-01');
insert into empregado values (9,'Empregado 9','Rua 9','Atibaia','sp','33634185','1990-01-01');

insert into dependente values (1,1,'Filho 1',2,'2007-01-01');
insert into dependente values (1,2,'Filha 1',1,'2002-01-01');
insert into dependente values (1,3,'Esposa 1',99,'1971-01-01');

insert into dependente values (2,1,'Filho 2',2,'2007-01-01');
insert into dependente values (2,2,'Filha 2',1,'2002-01-01');
insert into dependente values (2,3,'Esposa 2',99,'1971-01-01');

insert into dependente values (3,1,'Filho 3',2,'2007-01-01');
insert into dependente values (3,2,'Filha 3',1,'2002-01-01');
insert into dependente values (3,3,'Esposa 3',99,'1971-01-01');

insert into dependente values (4,1,'Filho 4',2,'2012-01-01');
insert into dependente values (4,2,'Filha 4',1,'2008-01-01');
insert into dependente values (4,3,'Esposa 4',99,'1979-01-01');

insert into dependente values (5,1,'Filho 5',2,'2012-01-01');
insert into dependente values (5,2,'Filha 5',1,'2008-01-01');
insert into dependente values (5,3,'Esposa 5',99,'1979-01-01');

insert into dependente values (6,1,'Filho 6',2,'2012-01-01');
insert into dependente values (6,2,'Filha 6',1,'2008-01-01');
insert into dependente values (6,3,'Esposa 6',99,'1979-01-01');

insert into dependente values (7,1,'Filho 7',2,'2018-01-01');
insert into dependente values (7,2,'Filha 7',1,'2014-01-01');
insert into dependente values (7,3,'Esposa 7',99,'1998-01-01');

insert into dependente values (8,1,'Filho 8',2,'2018-01-01');
insert into dependente values (8,2,'Filha 8',1,'2014-01-01');
insert into dependente values (8,3,'Esposa 8',99,'1998-01-01');

insert into dependente values (9,1,'Filho 9',2,'2018-01-01');
insert into dependente values (9,2,'Filha 9',1,'2014-01-01');
insert into dependente values (9,3,'Esposa 9',99,'1998-01-01');

# *****QUESTÕES*****

# questao n. 1
SELECT D.DEPE_NM_DEPENDENTE as 'Nome esposa', D.DEPE_DT_NASCIMENTO as 'Data nasc Esposa', 
(SELECT Depe_nm_Dependente FROM dependente 
 WHERE Empr_cd_Empregado = D.Empr_cd_Empregado  
 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) > 17 AND Pare_cd_Parentesco <> 99) as 'Nome filho(a)',
(SELECT Depe_dt_Nascimento FROM dependente 
 WHERE Empr_cd_Empregado = D.Empr_cd_Empregado  
 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) > 17 AND Pare_cd_Parentesco <> 99) as 'Data nasc. filho(a)',
(SELECT empr_nm_cidade FROM empregado WHERE Empr_cd_Empregado = D.Empr_cd_Empregado) as 'Cidade'
FROM dependente as D
WHERE Pare_cd_Parentesco = 99 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) > 47;



# questao n. 2
SELECT D.DEPE_NM_DEPENDENTE as 'Nome esposa', D.DEPE_DT_NASCIMENTO as 'Data nasc Esposa', 
(SELECT Depe_nm_Dependente FROM dependente 
 WHERE Empr_cd_Empregado = D.Empr_cd_Empregado  
 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) < 5 AND Pare_cd_Parentesco <> 99) as 'Nome filho(a)',
(SELECT Depe_dt_Nascimento FROM dependente 
 WHERE Empr_cd_Empregado = D.Empr_cd_Empregado  
 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) < 5 AND Pare_cd_Parentesco <> 99) as 'Data nasc. filho(a)',
(SELECT empr_ds_endereco FROM empregado WHERE Empr_cd_Empregado = D.Empr_cd_Empregado) as 'Endereço'
FROM dependente as D
WHERE Pare_cd_Parentesco = 99 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) >= 20 
AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) <= 34 ;



# questao n. 3
SELECT Empr_nm_Empregado AS 'Nome empregado', Empr_dt_Nascimento AS 'Data nasc. Empregado',
(SELECT Depe_nm_Dependente FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) >= 35 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) <= 49
 AND Pare_cd_Parentesco = 99) AS 'Nome Esposa',
(SELECT Depe_dt_Nascimento FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) >= 35 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) <= 49
 AND Pare_cd_Parentesco = 99) AS 'Data nasc. Esposa',
 (SELECT Depe_nm_Dependente FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) > 12
 AND Pare_cd_Parentesco <> 99) AS 'Nome filho(a)',
 (SELECT Depe_dt_Nascimento FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) > 12
 AND Pare_cd_Parentesco <> 99) AS 'Data Nasc. filho(a)',
 Empr_cd_Empregado AS 'Código do empregado'
FROM empregado as E
WHERE EXISTS (SELECT Depe_nm_Dependente FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) >= 35 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) <= 49
 AND Pare_cd_Parentesco = 99);



# questao n. 4
SELECT Empr_nm_Empregado AS 'Nome empregado', Empr_dt_Nascimento as 'Data nasc. empregado',
(SELECT Depe_nm_Dependente FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
AND Pare_cd_Parentesco = 99) AS 'Nome Esposa',
(SELECT Depe_dt_Nascimento FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
AND Pare_cd_Parentesco = 99) AS 'Data Nasc. Esposa',
(SELECT Depe_nm_Dependente FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
AND Pare_cd_Parentesco <> 99 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) < 17) AS 'Nome filho(a)',
(SELECT Depe_dt_Nascimento FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
AND Pare_cd_Parentesco <> 99 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) < 17) AS 'Data Nasc. filho(a)'
, Empr_nm_Cidade as 'Cidade'
FROM empregado as E
WHERE year(curdate()) - YEAR(Empr_dt_Nascimento) > 50;



# questao n. 5
SELECT Empr_nm_Empregado AS 'Nome empregado', Empr_dt_Nascimento as 'Data nasc. empregado',
(SELECT Depe_nm_Dependente FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
AND Pare_cd_Parentesco = 99) AS 'Nome Esposa',
(SELECT Depe_nm_Dependente FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
AND Pare_cd_Parentesco <> 99 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) > 12) AS 'Nome filho(a)',
(SELECT Depe_dt_Nascimento FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
AND Pare_cd_Parentesco <> 99 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) > 12) AS 'Data nasc. filho(a)'
FROM empregado as E
WHERE year(curdate()) - YEAR(Empr_dt_Nascimento) >= 35 AND year(curdate()) - YEAR(Empr_dt_Nascimento) <= 49;



# questao n. 6
SELECT Empr_nm_Empregado AS 'Nome empregado',
(SELECT Depe_nm_Dependente FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
AND Pare_cd_Parentesco = 99) AS 'Nome Esposa',
(SELECT Depe_dt_Nascimento FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
AND Pare_cd_Parentesco = 99) AS 'Data Nasc. Esposa',
(SELECT Depe_nm_Dependente FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
AND Pare_cd_Parentesco <> 99 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) < 5) AS 'Nome filho(a)',
(SELECT Depe_dt_Nascimento FROM dependente WHERE Empr_cd_Empregado = E.Empr_cd_Empregado
AND Pare_cd_Parentesco <> 99 AND YEAR(curdate()) - YEAR(Depe_dt_Nascimento) < 5) AS 'Data nasc. filho(a)'
FROM empregado as E
WHERE year(curdate()) - YEAR(Empr_dt_Nascimento) >= 20 AND year(curdate()) - YEAR(Empr_dt_Nascimento) <= 34;



# questao n. 7
DELIMITER //
CREATE PROCEDURE ex7 (cd_Empregado char(8),ano int)
BEGIN
	DECLARE diferenca INT; 
	SET diferenca = ano - (SELECT YEAR(Empr_dt_Nascimento) FROM empregado WHERE Empr_cd_Empregado = cd_Empregado);
	UPDATE empregado SET Empr_dt_Nascimento = date_add(Empr_dt_Nascimento, INTERVAL diferenca YEAR)
    WHERE Empr_cd_Empregado = cd_Empregado;
END
//
DELIMITER ;

CALL ex7 (1,1992);
CALL ex7 (2,1987);
CALL ex7 (3,1982);
CALL ex7 (4,1977);
CALL ex7 (5,1972);
CALL ex7 (6,1967);
CALL ex7 (7,1962);
CALL ex7 (8,1957);
CALL ex7 (9,1952);



# questao n. 8
DELIMITER //
CREATE PROCEDURE ex8 (cd_Empregado char(8), ano int)
BEGIN
	DECLARE diferenca INT; 
	SET diferenca = ano - (SELECT YEAR(Depe_dt_Nascimento) FROM dependente 
    WHERE Empr_cd_Empregado = cd_Empregado AND Pare_cd_Parentesco = 99);
	UPDATE dependente SET Depe_dt_Nascimento = date_add(Depe_dt_Nascimento, INTERVAL diferenca YEAR)
    WHERE Empr_cd_Empregado = cd_Empregado AND Pare_cd_Parentesco = 99;
END
//
DELIMITER ;

CALL ex8(1,1953);
CALL ex8(2,1956);
CALL ex8(3,1959);
CALL ex8(4,1973);
CALL ex8(5,1976);
CALL ex8(6,1979);
CALL ex8(7,1983);
CALL ex8(8,1986);
CALL ex8(9,1989);



# questao n. 9
DELIMITER //
CREATE PROCEDURE ex9 (cd_Empregado char(8), ano int)
BEGIN
	DECLARE diferenca INT; 
	SET diferenca = ano - (SELECT YEAR(Depe_dt_Nascimento) FROM dependente 
    WHERE Empr_cd_Empregado = cd_Empregado AND Pare_cd_Parentesco = 2);
	UPDATE dependente SET Depe_dt_Nascimento = date_add(Depe_dt_Nascimento, INTERVAL diferenca YEAR)
    WHERE Empr_cd_Empregado = cd_Empregado AND Pare_cd_Parentesco = 2;
END
//
DELIMITER ;

CALL ex9(1,1994);
CALL ex9(2,1994);
CALL ex9(3,1994);
CALL ex9(4,1994);
CALL ex9(5,1994);
CALL ex9(6,1994);
CALL ex9(7,1994);
CALL ex9(8,1994);
CALL ex9(9,1994);



# questao n. 10
DELIMITER //
CREATE PROCEDURE ex10 (cd_Empregado char(8), ano int)
BEGIN
	DECLARE diferenca INT; 
	SET diferenca = ano - (SELECT YEAR(Depe_dt_Nascimento) FROM dependente 
    WHERE Empr_cd_Empregado = cd_Empregado AND Pare_cd_Parentesco = 1);
	UPDATE dependente SET Depe_dt_Nascimento = date_add(Depe_dt_Nascimento, INTERVAL diferenca YEAR)
    WHERE Empr_cd_Empregado = cd_Empregado AND Pare_cd_Parentesco = 1;
END
//
DELIMITER ;

CALL ex10(1,2010);
CALL ex10(2,2010);
CALL ex10(3,2010);
CALL ex10(4,2010);
CALL ex10(5,2010);
CALL ex10(6,2010);
CALL ex10(7,2010);
CALL ex10(8,2010);
CALL ex10(9,2010);

