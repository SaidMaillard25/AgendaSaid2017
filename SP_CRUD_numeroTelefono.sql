CREATE PROCEDURE `CRUD_numeroTelefono` (P_Op smallint(1), P_id int(10), P_numero varchar(128), P_tbl_Usuario_id int(10))
BEGIN
	/* 0 para insert, 1 para select, 2 para update, 3 para eldelete */
    if P_Op = 0 then
		insert into  agendadb.tbl_numerotelefono (numero,tbl_Usuario_id) values (P_numero,P_tbl_Usuario_id);
	elseif P_Op = 1 then
		select * from agendadb.tbl_numerotelefono;
	elseif P_Op = 2 then
		update agendadb.tbl_numeortelefono set numero = P_numero, tbl_Usuario_id = P_tbl_Usuario_id where idtbl_NumeroTel = P_id;
    elseif P_Op = 3 then
		delete from agendadb.tbl_numerotelefono where idtbl_NumeroTel = P_id;
	end if;
END