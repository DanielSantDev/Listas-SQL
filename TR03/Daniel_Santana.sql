USE bdimobiliaria;
SELECT * FROM Comprador;

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
WHERE vl_Preco < 150000.00 AND sg_Estado = 'RJ';

/*5*/
SELECT cd_Imovel, cd_Vendedor, vl_Preco, sg_Estado
FROM Imovel
WHERE vl_Preco < 150000.00 AND cd_Vendedor != 2;

/*6*/
SELECT cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado
FROM Comprador
WHERE sg_Estado IS NULL;

/*7*/
SELECT cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta
FROM Oferta
WHERE vl_Oferta > 100000.00 AND vl_Oferta < 150000.00;

/*8*/
SELECT dt_Oferta AS DataOferta
FROM Oferta
WHERE dt_Oferta BETWEEN "2009-01-01" AND "2009-03-01";

/*9*/
SELECT nm_Vendedor
FROM Vendedor
WHERE nm_Vendedor LIKE 'M%';

/*10*/
SELECT nm_Vendedor
FROM Vendedor
WHERE nm_Vendedor LIKE '_A%';

/*11*/

/*12*/

/*13*/

/*14*/

/*15*/

/*16*/

/*17*/