CREATE PROCEDURE `CRUD_correoelectronico` (P_Op smallint(1), P_id int(10), P_correo varchar(128), P_tbl_Usuario_id int(10))
BEGIN
	/* 0 para insert, 1 para select, 2 para update, 3 para eldelete */
    if P_Op = 0 then
		insert into  agendadb.tbl_correoelectronico (correo,tbl_Usuario_id) values (P_correo,P_tbl_Usuario_id);
	elseif P_Op = 1 then
		select * from agendadb.tbl_correoelectronico;
	elseif P_Op = 2 then
		update agendadb.tbl_correoelectronico set correo = P_correo, tbl_Usuario_id = P_tbl_Usuario_id where idtbl_CorreoElectronico = P_id;
    elseif P_Op = 3 then
		delete from agendadb.tbl_correoelectronivo where idtbl_CorreoElectronico = P_id;
	end if;
END