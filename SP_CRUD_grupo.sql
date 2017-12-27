CREATE PROCEDURE `CRUD_grupo` (P_Op smallint(1), P_id int(10), P_nombregrupo varchar(128))
BEGIN
	/* 0 para insert, 1 para select, 2 para update, 3 para eldelete */
    if P_Op = 0 then
		insert into  agendadb.tbl_grupo (Nombre_Grupo) values (P_nombregrupo);
	elseif P_Op = 1 then
		select * from agendadb.tbl_grupo;
	elseif P_Op = 2 then
		update agendadb.tbl_grupo set Nombre_Grupo = P_nombregrupo where idtbl_Grupo = P_id;
    elseif P_Op = 3 then
		delete from agendadb.tbl_grupo where idtbl_Grupo = P_id;
	end if;
END