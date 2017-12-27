CREATE PROCEDURE `CRUD_contactoGrupo` (P_Op smallint(1), P_Idusuario int(10), P_Idgrupo int(10))
BEGIN
	
    in registro tinyint(1) = select count(*) from agendadb.tbl_usuario_has_tbl_grupo; 
    
    if registro < 1 then
		insert into  agendadb.tbl_usuario_has_tbl_grupo (tbl_Usuario_id,tbl_Grupo_idtbl_Grupo) values (P_Idusuario,P_Idgrupo);
	elseif P_Op = 1 then
		SELECT 'No Puede agregar dos veces un contacto al mismo grupo';
	end if;
END