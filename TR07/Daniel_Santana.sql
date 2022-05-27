
#Questão n01
DELIMITER //
create procedure alterarmedia()
	begin
		DECLARE countagem int;
        DECLARE alterados int;
        declare cod int;
        
        set countagem = (select count(*) from imovel);
        set alterados = 0;
        set cod = 0;
        
        while(alterados < countagem) do
					if(select count(*) from imovel where imovel.cd_Imovel = cod) <> 0
                    then
						update imovel set imovel.vl_Preco = (select avg(vl_Oferta) from oferta where oferta.cd_Imovel=cod) where imovel.cd_Imovel=cod;
                        set alterados = alterados + 1;
                    end if;
                    set cod = cod + 1;                    
        end while;    
    end//
DELIMITER ;
DELIMITER //
Create trigger valorMedioIns after Insert on oferta
	for each row
    begin
		call alteramedia();
    end//
DELIMITER ;
DELIMITER //
Create trigger valorMedioUp after update on oferta
	for each row
    begin
		call alteramedia();
    end//
DELIMITER ;
DELIMITER //
Create trigger valorMedioDel after delete on oferta
	for each row
    begin
		call alteramedia();
    end//
DELIMITER ;




#Questão n02
DELIMITER //
Create trigger limitadorDelEst before delete on estado
	for each row
    begin
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Não é permitida a exclusão de registros desta tabela';
    end//
DELIMITER ;

DELIMITER //
Create trigger limitadorUpEst before update on estado
	for each row
    begin
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Não é permitida a alteração de registros desta tabela';
    end//
DELIMITER ;




#Questão n03
DELIMITER //
Create trigger limitadorDelFaixa before delete on faixa_imovel
	for each row
    begin
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Não é permitida a exclusão de registros desta tabela';
    end//
DELIMITER ;

DELIMITER //
Create trigger limitadorUpFaixa before update on faixa_imovel
	for each row
    begin
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Não é permitida a alteração de registros desta tabela';
    end//
DELIMITER ;

