/*TR04*/

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
SELECT ds_Endereco, nm_Bairro, vl_Maximo, vl_Minimo 
FROM Imovel, Bairro, Faixa_Imovel
WHERE Imovel.cd_Bairro = Bairro.cd_Bairro
ORDER BY ds_Endereco ASC;

SELECT COUNT(*) 
FROM Vendedor;

/*9*/
SELECT COUNT(*) AS Total_Imovel, Vendedor.nm_Vendedor FROM Imovel 
INNER JOIN Vendedor
ON Imovel.cd_Vendedor = Vendedor.cd_Vendedor
GROUP BY Vendedor.nm_Vendedor
ORDER BY Total_Imovel ASC;

/*10*/
SELECT MAX(vl_Preco) AS 'MAX', MIN(vl_Preco) AS 'MIN',
(MAX(vl_Preco) - MIN(vl_Preco)) AS 'DIFERENCA'
FROM Imovel;

/*11*/
SELECT cd_Vendedor, MIN(vl_Preco)
FROM Imovel
GROUP BY cd_Vendedor
HAVING MIN(vl_Preco) > 10000;

/*12*/
SELECT Oferta.cd_Comprador, nm_Comprador, AVG(vl_Oferta) AS MEDIA, COUNT(*) AS qtd_Ofertas
FROM Oferta
RIGHT OUTER JOIN Comprador
ON Comprador.cd_Comprador = Oferta.cd_Comprador
GROUP BY cd_Comprador;