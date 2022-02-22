CREATE DATABASE IF NOT EXISTS bdImobiliaria;

USE bdImobiliaria;

/*CRIAÇÃO DAS TABELAS DO BANCO*/
CREATE TABLE IF NOT EXISTS Vendedor(
cd_Vendedor INT,
nm_Endereco VARCHAR(40),
cd_CPF DECIMAL(11),
nm_Cidade VARCHAR(20),
nm_Bairro VARCHAR(20),
sg_Estado CHAR(2),
cd_Telefone VARCHAR(20),
ds_Email VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS Comprador(
cd_Comprador INT,
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
cd_imovel INT,
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
cd_Comprador INT,
cd_Imovel INT,
vl_Oferta DECIMAL(15,2),
dt_Oferta DATE
);

CREATE TABLE IF NOT EXISTS Estado(
sg_Estado CHAR(2),
nm_Estado VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Cidade(
cd_Cidade INT,
sg_Estado CHAR(2),
nm_Cidade VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Bairro(
cd_Bairro INT,
cd_Cidade INT,
sg_Estado CHAR(2),
nm_Bairro VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Faixa_Imovel(
cd_Faixa INT,
nm_Faixa VARCHAR(30),
vl_Maximo DECIMAL(15,2),
vl_Minimo DECIMAL(15,2)
);

/* CHAVES PRIMÁRIAS E ESTRANGEIRAS */
ALTER TABLE Vendedor
ADD PRIMARY KEY(cd_Vendedor);

ALTER TABLE Comprador
ADD PRIMARY KEY(cd_Comprador);

ALTER TABLE Imovel
ADD PRIMARY KEY(cd_Imovel);

ALTER TABLE Estado
ADD PRIMARY KEY(sg_Estado);

ALTER TABLE Cidade
ADD PRIMARY KEY(cd_Cidade);

ALTER TABLE Bairro
ADD PRIMARY KEY(cd_Bairro);

ALTER TABLE Faixa_Imovel
ADD PRIMARY KEY(cnm_Faixa);

ALTER TABLE Imovel
ADD CONSTRAINT cd_Vendedor
FOREIGN KEY cd_Vendedor
REFERENCES Vendedor(cd_Vendedor);


