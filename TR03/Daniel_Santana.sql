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


/*5*/