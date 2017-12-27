CREATE PROCEDURE `CRUD_Usuario` (P_Op smallint(1), P_id int(10), P_nombre varchar(128), P_ApellidoPaterno varchar(128), P_ApellidoMaterno varchar(128))
BEGIN
	/* 0 para insert, 1 para select, 2 para update, 3 para eldelete */
    if P_Op = 0 then
		insert into  agendadb.tbl_usuario (Nombre,Apellido_Paterno,Apellido_Materno) values (P_nombre,P_ApellidoPaterno,P_ApellidoMaterno);
	elseif P_Op = 1 then
		select * from agendadb.tbl_usuario;
	elseif P_Op = 2 then
		update agendadb.tbl_usuario set Nombre = P_nombre, Apellido_Paterno = P_ApellidoPaterno, Apellido_Materno = P_ApellidoMaterno where id = P_id;
    elseif P_Op = 3 then
		delete from agendadb.tbl_usuario where id = P_id;
	end if;
END

