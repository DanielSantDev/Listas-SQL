/*TR01*/

CREATE DATABASE IF NOT EXISTS bdImobiliaria;

USE bdImobiliaria;

/*CRIAÇÃO DAS TABELAS DO BANCO*/
CREATE TABLE IF NOT EXISTS Vendedor(
cd_Vendedor INT NOT NULL,
nm_Vendedor VARCHAR(40),
ds_Endereco VARCHAR(40),
cd_CPF DECIMAL(11),
nm_Cidade VARCHAR(20),
nm_Bairro VARCHAR(20),
sg_Estado CHAR(2),
cd_Telefone VARCHAR(20),
ds_Email VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS Comprador(
cd_Comprador INT NOT NULL,
nm_Comprador VARCHAR(40),
ds_Endereco VARCHAR(40),
cd_CPF DECIMAL(11),
nm_Cidade VARCHAR(20),
nm_Bairro VARCHAR(20),
sg_Estado VARCHAR(2),
cd_Telefone VARCHAR(20),
ds_Email VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS Imovel(
cd_imovel INT NOT NULL,
cd_Vendedor INT,
cd_Bairro INT,
cd_Cidade INT,
sg_Estado CHAR(2),
ds_Endereco VARCHAR(40),
qt_AreaUtil DECIMAL(10,2),
qt_AreaTotal DECIMAL(10,2),
ds_Imovel VARCHAR(300),
vl_Preco DECIMAL(15,2),
qt_Ofertas INT,
ic_Vendido CHAR(1),
dt_Lancto DATE,
qt_ImovelIndicado INT
);

CREATE TABLE IF NOT EXISTS Oferta(
cd_Comprador INT NOT NULL,
cd_Imovel INT NOT NULL,
vl_Oferta DECIMAL(15,2),
dt_Oferta DATE
);

CREATE TABLE IF NOT EXISTS Estado(
sg_Estado CHAR(2) NOT NULL,
nm_Estado VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Cidade(
cd_Cidade INT NOT NULL,
sg_Estado CHAR(2) NOT NULL,
nm_Cidade VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Bairro(
cd_Bairro INT NOT NULL,
cd_Cidade INT NOT NULL,
sg_Estado CHAR(2) NOT NULL,
nm_Bairro VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Faixa_Imovel(
cd_Faixa INT NOT NULL,
nm_Faixa VARCHAR(30),
vl_Maximo DECIMAL(15,2),
vl_Minimo DECIMAL(15,2)
);

/* CHAVES PRIMÁRIAS */
ALTER TABLE Vendedor
ADD PRIMARY KEY(cd_Vendedor);

ALTER TABLE Comprador
ADD PRIMARY KEY(cd_Comprador);

ALTER TABLE Imovel
ADD PRIMARY KEY(cd_Imovel);

ALTER TABLE Estado
ADD PRIMARY KEY(sg_Estado);

ALTER TABLE Cidade
ADD PRIMARY KEY(cd_Cidade, sg_Estado);

ALTER TABLE Bairro
ADD PRIMARY KEY(cd_Bairro, cd_Cidade, sg_Estado);

ALTER TABLE Faixa_Imovel
ADD PRIMARY KEY(cd_Faixa);

ALTER TABLE Oferta
ADD PRIMARY KEY(cd_Comprador, cd_Imovel);

/* CHAVES ESTRANGEIRAS */
ALTER TABLE Cidade
ADD FOREIGN KEY (sg_Estado)
REFERENCES Estado(sg_Estado);

ALTER TABLE Bairro
ADD FOREIGN KEY (cd_Cidade)
REFERENCES Cidade(cd_Cidade);

ALTER TABLE Bairro
ADD FOREIGN KEY (sg_Estado)
REFERENCES Cidade(sg_Estado);

ALTER TABLE Imovel
ADD FOREIGN KEY (cd_Vendedor)
REFERENCES Vendedor(cd_Vendedor);

ALTER TABLE Imovel
ADD FOREIGN KEY (cd_Bairro)
REFERENCES Bairro(cd_Bairro);

ALTER TABLE Imovel
ADD FOREIGN KEY (cd_Cidade)
REFERENCES Bairro(cd_Cidade);

ALTER TABLE Imovel
ADD FOREIGN KEY (sg_Estado)
REFERENCES Bairro(sg_Estado);

ALTER TABLE Oferta
ADD FOREIGN KEY (cd_Comprador)
REFERENCES Comprador(cd_Comprador);

ALTER TABLE Oferta
ADD FOREIGN KEY (cd_Imovel)
REFERENCES Imovel(cd_Imovel);

/**************************************************/
/*TR01*/

INSERT INTO Estado(sg_Estado, nm_Estado)
VALUES ('SP', "SÃO PAULO"),
('RJ', "RIO DE JANIERO");

INSERT INTO Cidade(cd_Cidade, nm_Cidade, sg_Estado)
VALUES (1, "SÃO PAULO", 'SP');
INSERT INTO Cidade(cd_Cidade, nm_Cidade, sg_Estado)
VALUES (2, "SANTO ANDRÉ", 'SP');
INSERT INTO Cidade(cd_Cidade, nm_Cidade, sg_Estado)
VALUES (3, "CAMPINAS", 'SP');
INSERT INTO Cidade(cd_Cidade, nm_Cidade, sg_Estado)
VALUES (1, "RIO DE JANEIRO", 'RJ');
INSERT INTO Cidade(cd_Cidade, nm_Cidade, sg_Estado)
VALUES (2, "NITEROI", 'RJ');

INSERT INTO Bairro(cd_Bairro, nm_Bairro, cd_Cidade, sg_Estado)
VALUES (1, "JARDINS", 1, 'SP'),
(2, "MORUMBI", 1, 'SP'),
(3, "AEROPORTO", 1, 'SP'),
(1, "AEROPORTO", 1, 'RJ'),
(2, "NITEROI", 2, 'RJ');

INSERT INTO Vendedor(cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email)
VALUES (1, "MARIA DA SILVA", "RUA DO GRITO, 45", "msilva@nova.com"),
(2, "MARCO ANDRADE", "AV. DA SAUDADE,325", "mandrade@nova.com"),
(3, "ANDRÉ CARDOSO", "AV. BRASIL, 401", "acardoso@nova.com"),
(4, "TATIANA SOUZA", "RUA DO IMPERADOR, 778", "tsouza@nova.com");

INSERT INTO Imovel(cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco)
VALUES (1, 1, 1, 1, 'SP', "AL. TIETE, 3304/101", 250, 400, 180000),
(2, 1, 2, 1, 'SP', "AV. MORUMBI, 2230", 150, 250, 135000),
(3, 2, 1, 1, 'RJ', "R. GAL. OSORIO, 445/34", 250, 400, 185000),
(4, 2, 2, 2, 'RJ', "R. D. PEDRO I, 882", 120, 200, 110000),
(5, 3, 3, 1, 'SP', "AV. RUBEN BERTA, 2355", 110, 200, 95000),
(6, 4, 1, 1, 'RJ', "R. GETULIO VARGAS, 552", 200, 300, 99000);

INSERT INTO Comprador(cd_Comprador, nm_Comprador, ds_Endereco, ds_Email)
VALUES (1, "EMMANUEL ANTUNES", "R. SARAIVA, 452", "eantunes@nova.com"),
(2, "JOANA PEREIRA", "AV PORTUGAL,52", "jpereira@nova.com"),
(3, "RONALDO CAMPELO", "R. ESTADOS UNIDOS,13", "rcampelo@nova.com"),
(4, "MANFRED AUGUSTO", "AV. BRASIL,351", "maugusto@nova.com");

INSERT INTO Oferta(cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta)
VALUES 
(1, 1, 170000, "10/01/09"),
(1, 3, 180000, "10/01/09"),
(2, 2, 135000, "15/01/09"),
(2, 4, 100000, "15/02/09"),
(3, 1, 160000, "05/01/09"),
(3, 2, 140000, "20/02/09");

SELECT * FROM Oferta;