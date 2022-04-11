/*TR04*/
select * from Comprador;

/*01*/
SELECT cd_Imovel, Vendedor.cd_Vendedor, nm_Vendedor, Imovel.sg_Estado
FROM Imovel, Vendedor
WHERE Vendedor.cd_Vendedor = Imovel.cd_Vendedor;

/*02*/
SELECT Comprador.cd_Comprador, nm_Comprador, cd_Imovel, vl_Oferta
FROM Comprador, Oferta
WHERE Comprador.cd_Comprador = Oferta.cd_Comprador;

/*03*/
SELECT cd_Imovel, vl_Preco, nm_Bairro, cd_Vendedor
FROM Imovel, Bairro
WHERE Imovel.cd_Bairro = Bairro.cd_Bairro
AND cd_Vendedor = 3;

/*04*/
SELECT Imovel.cd_Imovel AS Imovel, vl_Oferta AS Oferta_Cadastrada
FROM Imovel
INNER JOIN Oferta
ON Imovel.cd_Imovel = Oferta.cd_Imovel;

/*05*/
SELECT Imovel.cd_Imovel AS Imovel, Imovel.cd_Vendedor, vl_Oferta AS Oferta
FROM Imovel
LEFT OUTER JOIN Oferta
ON Imovel.cd_Imovel = Oferta.cd_Imovel;

/*6*/
SELECT Oferta.cd_Comprador AS cod, nm_Comprador AS Nome, vl_Oferta AS Oferta_Realizada
FROM Oferta
LEFT OUTER JOIN Comprador
ON Oferta.cd_Comprador = Comprador.cd_Comprador;

/*7*/
SELECT Oferta.cd_Comprador AS cod, nm_Comprador AS Nome, vl_Oferta AS Oferta_Realizada
FROM Oferta
RIGHT OUTER JOIN Comprador
ON Oferta.cd_Comprador = Comprador.cd_Comprador;

/*8*/
