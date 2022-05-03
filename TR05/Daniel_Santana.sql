/*TR05*/
select * from oferta;

#Questão n01#
select i.cd_Imovel from imovel i
where (i.cd_Bairro = 2) and (i.cd_Imovel != 2);

#Questão n02#
select i.vl_preco from imovel i
where vl_Preco > 
(
	select avg(vl_Preco) 
	from imovel);

#Questão n03#
select o.cd_Comprador as Comprador from Oferta o 
where o.vl_oferta > 70000;

#Questão n04#
select o.cd_Imovel from Oferta o
where o.vl_Oferta > 
(
	select avg(o.vl_Oferta) 
	from Oferta o);

#Questão n05
select i.cd_imovel from imovel i 
where vl_Preco > 
(	
	select avg(i2.vl_Preco) 
	from imovel i2 
	where i2.cd_Bairro = i.cd_Bairro);

#Questão n06
select i.cd_imovel from imovel i 
where vl_Preco = 
(
	select max(i2.vl_Preco) from imovel i2 
	where i2.cd_Bairro = i.cd_Bairro) 
	and vl_Preco >
	(
		select avg(i2.vl_Preco) from imovel i2 
		where i2.cd_Bairro = i.cd_Bairro) 
		group by i.cd_bairro;

#Questão n07
select cd_imovel, vl_preco
from imovel as i
where vl_preco = any 
(
	select min(vl_preco)
	from imovel
	group by cd_vendedor);

#Questão n08
select cd_imovel, vl_preco
from imovel as i
where vl_preco = any (select min(vl_preco)
from imovel
where i.cd_vendedor != cd_vendedor
group by cd_vendedor);

#Questão n09
/*select o.vl_Oferta, o.cd_Comprador
from Oferta o
where o.vl_Oferta <
(
	select sum(o2.cd_comprador = 2) 
    from Oferta o2
	where o.cd_Comprador
    (	
		select o3.cd_Comprador 
        from Oferta o3 
        where o3.cd_Comprador != 2));

select o.vl_Oferta, o.cd_Comprador from Oferta o
where cd_comprador*/

#Questão n10
#Questão n11

