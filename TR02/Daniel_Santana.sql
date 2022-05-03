#Questão n01
INSERT INTO Estado(sg_Estado, nm_Estado) VALUES ('SP', "SÃO PAULO"), ('RJ', "RIO DE JANIERO");

#Questão n02
INSERT INTO Cidade(cd_Cidade, nm_Cidade, sg_Estado) VALUES (1, "SÃO PAULO", 'SP');
INSERT INTO Cidade(cd_Cidade, nm_Cidade, sg_Estado) VALUES (2, "SANTO ANDRÉ", 'SP');
INSERT INTO Cidade(cd_Cidade, nm_Cidade, sg_Estado) VALUES (3, "CAMPINAS", 'SP');
INSERT INTO Cidade(cd_Cidade, nm_Cidade, sg_Estado) VALUES (1, "RIO DE JANEIRO", 'RJ');
INSERT INTO Cidade(cd_Cidade, nm_Cidade, sg_Estado) VALUES (2, "NITEROI", 'RJ');

#Questão n03
INSERT INTO Bairro(cd_Bairro, nm_Bairro, cd_Cidade, sg_Estado)
VALUES (1, "JARDINS", 1, 'SP'),
(2, "MORUMBI", 1, 'SP'),
(3, "AEROPORTO", 1, 'SP'),
(1, "AEROPORTO", 1, 'RJ'),
(2, "NITEROI", 2, 'RJ');

#Questão n04
INSERT INTO Vendedor(cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email)
VALUES (1, "MARIA DA SILVA", "RUA DO GRITO, 45", "msilva@nova.com"),
(2, "MARCO ANDRADE", "AV. DA SAUDADE,325", "mandrade@nova.com"),
(3, "ANDRÉ CARDOSO", "AV. BRASIL, 401", "acardoso@nova.com"),
(4, "TATIANA SOUZA", "RUA DO IMPERADOR, 778", "tsouza@nova.com");

#Questão n05
INSERT INTO Imovel(cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco)
VALUES (1, 1, 1, 1, 'SP', "AL. TIETE, 3304/101", 250, 400, 180000),
(2, 1, 2, 1, 'SP', "AV. MORUMBI, 2230", 150, 250, 135000),
(3, 2, 1, 1, 'RJ', "R. GAL. OSORIO, 445/34", 250, 400, 185000),
(4, 2, 2, 2, 'RJ', "R. D. PEDRO I, 882", 120, 200, 110000),
(5, 3, 3, 1, 'SP', "AV. RUBEN BERTA, 2355", 110, 200, 95000),
(6, 4, 1, 1, 'RJ', "R. GETULIO VARGAS, 552", 200, 300, 99000);

#Questão n06
INSERT INTO Comprador(cd_Comprador, nm_Comprador, ds_Endereco, ds_Email)
VALUES (1, "EMMANUEL ANTUNES", "R. SARAIVA, 452", "eantunes@nova.com"),
(2, "JOANA PEREIRA", "AV PORTUGAL,52", "jpereira@nova.com"),
(3, "RONALDO CAMPELO", "R. ESTADOS UNIDOS,13", "rcampelo@nova.com"),
(4, "MANFRED AUGUSTO", "AV. BRASIL,351", "maugusto@nova.com");

#Questão n07
INSERT INTO Oferta(cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta)
VALUES (1, 1, 170000, "2009/01/10"),
(1, 3, 180000, "2009/01/10"),
(2, 2, 135000, "2009/01/15"),
(2, 4, 100000, "2009/02/15"),
(3, 1, 160000, "2009/01/05"),
(3, 2, 140000, "2009/02/20");

#Questão n08
UPDATE Imovel SET vl_Preco = vl_Preco + (vl_Preco *  0.1);

#Questão n09
UPDATE Imovel SET vl_Preco = vl_Preco - (vl_Preco *  0.05)  WHERE cd_Vendedor = 1;

#Questão n10
UPDATE Oferta SET vl_Oferta = vl_Oferta + (vl_Oferta * 0.05) WHERE cd_Comprador = 2;

#Questão n11
UPDATE Comprador SET ds_Endereco = "R. ANANÁS, 45" WHERE cd_Comprador = 3;
UPDATE Comprador SET sg_Estado = 'RJ' WHERE cd_Comprador = 3;

#Questão n12
UPDATE Oferta SET vl_Oferta = 101000 WHERE cd_Comprador = 2 AND cd_Imovel = 4;

#Questão n13
DELETE FROM Oferta WHERE cd_Comprador = 3 AND cd_Imovel = 1;

#Questão n14
DELETE FROM Cidade WHERE cd_Cidade = 3 AND sg_Estado = 'SP';

#Questão n15
INSERT INTO Faixa_Imovel(cd_Faixa, nm_Faixa, vl_Minimo, vl_Maximo)
VALUES (1, "BAIXO", 0, 105000),
(2, "MEDIO", 105001, 180000),
(3, "ALTO", 180001, 999999);