USE bdimobiliaria;

/*1*/
SELECT cd_Comprador, nm_Comprador, ds_Email 
FROM Comprador;

/*2*/
SELECT cd_Vendedor, nm_Vendedor, ds_Email
FROM Vendedor
ORDER BY nm_Vendedor DESC;

/*3*/
SELECT cd_Imovel, cd_Vendedor, vl_Preco
FROM Imovel
WHERE cd_Vendedor = 2;

/*4*/
SELECT cd_Imovel, cd_Vendedor, vl_Preco, sg_Estado
FROM Imovel
WHERE (vl_Preco < 150000.00 AND sg_Estado = 'RJ');

/*5*/
SELECT cd_Imovel, cd_Vendedor, vl_Preco, sg_Estado
FROM Imovel
WHERE (vl_Preco < 150000.00  AND cd_Vendedor != 2);

/*6*/
SELECT cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado
FROM Comprador
WHERE sg_Estado IS NULL;

/*7*/
SELECT cd_Comprador, cd_Imovel, vl_Oferta as OFERTA
FROM Oferta
WHERE (vl_Oferta BETWEEN 100000 AND 150000);
/*(vl_Oferta > 100000.00 AND vl_Oferta < 150000.00)*/

/*8*/
SELECT vl_Oferta, dt_Oferta AS DataOferta
FROM Oferta
WHERE (dt_Oferta BETWEEN "2009-01-01" AND "2009-03-01");

/*9*/
SELECT nm_Vendedor as VENDEDOR
FROM Vendedor
WHERE nm_Vendedor LIKE 'M%';

/*10*/
SELECT nm_Vendedor as VENDEDOR
FROM Vendedor
WHERE nm_Vendedor LIKE '_A%';

/*11*/
SELECT nm_Vendedor as VENDEDOR, ds_Endereco as ENDERECO
FROM Vendedor
WHERE ds_Endereco LIKE '%U%';

/*12*/
SELECT cd_imovel, ds_Endereco
FROM Imovel
WHERE (cd_imovel = 2 OR cd_imovel = 3)
ORDER BY ds_Endereco;

/*13*/
SELECT vl_Oferta, dt_Oferta, cd_Imovel
FROM Oferta
WHERE (cd_imovel = 2 OR cd_imovel = 3)
AND (vl_Oferta > 140000)
ORDER BY dt_Oferta DESC;

/*14*/
SELECT cd_Imovel, qt_AreaUtil, vl_Preco AS PrecoDeVenda
FROM Imovel
WHERE (vl_Preco BETWEEN 110000 AND 200000)
ORDER BY qt_AreaUtil;
/*(vl_Preco >= 110000) AND (vl_Preco <= 200000)*/

/*15*/
SELECT MAX(vl_Oferta) as MaiorOferta, MIN(vl_Oferta) as MenorOferta, AVG(vl_Oferta) as MediaOferta 
FROM Oferta;

/*16*/
SELECT MAX(vl_Preco) as MaiorPreco, MIN(vl_Preco) as MenorPreco, AVG(vl_Preco) as MediaPreco 
FROM Imovel;

/*17*/
SELECT SUM(qt_Ofertas) as TotalOfertas, dt_Oferta
FROM Imovel, Oferta
WHERE dt_Oferta BETWEEN "2008-01-01" AND "2010-12-31"
GROUP BY dt_Oferta;

SELECT * FROM Imovel;