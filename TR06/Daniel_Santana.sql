/*Stored Procedure*/

/*questão 1*/
DELIMITER //
CREATE PROCEDURE quest1 (nome_bairro VARCHAR(20), percentual INT)
       BEGIN
         UPDATE (imovel inner join bairro on bairro.cd_bairro = imovel.cd_bairro and bairro.cd_Cidade = imovel.cd_Cidade and bairro.sg_Estado = imovel.sg_Estado) 
         SET imovel.vl_Preco = imovel.vl_Preco * (100 + percentual)/100
         WHERE bairro.nm_bairro = nome_bairro;
       END//
DELIMITER ;


/*questão 2*/
DELIMITER //
CREATE PROCEDURE quest2 (cod_compr INT, percentual INT)
	BEGIN
		UPDATE ((comprador inner join oferta on oferta.cd_Comprador = comprador.cd_Comprador) inner join imovel on oferta.cd_Imovel = imovel.cdImovel)
        set oferta.vl_Oferta = oferta.vl_Oferta * (100 + percentual)/100
        WHERE 
			oferta.vl_Oferta <= imovel.vl_Preco * 1.1 
            and 
            oferta.cd_Comprador = cod_compr 
            and 
            oferta.vl_Oferta = (select max(vl_Oferta) from oferta where oferta.cd_Comprador = cod_compr)
            and
            oferta.dt_Oferta =  (select max(dt_Oferta) from oferta o2 where o2.cd_Comprador = cod_compr);
	END//
DELIMITER ;

/*questão 3*/
DELIMITER //
CREATE PROCEDURE quest3 ()
	BEGIN
		UPDATE (imovel inner join oferta on imovel.cd_Imovel = oferta.cd_Comprador) 
        set imovel.vl_Preco = (select avg(vl_Oferta) from oferta where oferta.cd_Imovel = imovel.cd_Imovel);
	END//
DELIMITER ;

/*questão 4*/
DELIMITER //
create procedure quest4(percentual int)
	begin
		update(imovel left join faixa_imovel on imovel.vl_Preco between faixa_imovel.vl_Minimo and faixa_imovel.vl_Maximo)
        set imovel.vl_Preco = imovel.vl_Preco *(100 + percentual)/100
        where faixa_imovel.nm_Faixa = "BAIXO";
	end//
DELIMITER ;

/*questão 5*/
DELIMITER //
CREATE PROCEDURE quest5 (percentual INT)
       BEGIN
         UPDATE imovel 
         SET imovel.vl_Preco = imovel.vl_Preco * (100 - percentual)/100
         WHERE imovel.sg_Estado = "SP";
       END//
DELIMITER ;

/*questão 6*/
DELIMITER //
create procedure quest6(cod_imovel int,parcelas int)		
    begin
		DECLARE valor_tot int; 
        DECLARE valor_parc int; 
        
        if parcelas = 1
        then
			select "pedido à vista" as mensagem;
		else
			if parcelas > 10
            then
				select "Quantidade de parcelas inválida" as mensagem;
            else
				create table if not exists parcelas(
					cd_Parcela int NOT NULL UNIQUE auto_increment,
					cd_Imovel int NOT NULL,
					qt_parcela int not null default 2,
					vl_total int,
					vl_parcela int,
					PRIMARY KEY (cd_Parcela),
					FOREIGN KEY (cd_Imovel) REFERENCES imovel(cd_Imovel)
				);
                
                if parcelas > 3
                then
					set valor_tot = (select vl_Preco from imovel where cd_Imovel = cod_imovel) * 1.1;
				else
					set valor_tot = (select vl_Preco from imovel where cd_Imovel = cod_imovel);
                end if;
                
                
                set valor_parc = valor_tot / parcelas;
                
                insert into parcelas(cd_imovel,qt_parcela,vl_total,vl_parcela)values
					(cod_imovel,parcelas,valor_tot,valor_parc);
				end if;
		end if;		
	end//		
DELIMITER ;


/*FUNCTIONS*/

/*questão 1*/
DELIMITER //
create function questao1(cod_imov int) 
returns int
READS SQL DATA
begin
	return (select count(*) from oferta where oferta.cd_imovel = cod_imov);
end//

DELIMITER ;

/*questão 2*/

DELIMITER //
create function questao2(cod_imov int) 
returns varchar(20)
READS SQL DATA

begin
	DECLARE cod_compr int;
	
    
    set cod_compr = (select o1.cd_Comprador from oferta o1 where o1.cd_Imovel = cod_imov and o1.dt_Oferta = (select max(dt_Oferta) from oferta o2 where o2.cd_Imovel = cod_imov));
    
    return(select comprador.nm_Comprador from comprador where comprador.cd_Comprador =  cod_compr);
    
    
    
end//
DELIMITER ;


