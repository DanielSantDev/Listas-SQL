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