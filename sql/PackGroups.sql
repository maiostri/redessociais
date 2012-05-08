create or replace
PACKAGE PackGroups IS 

  -- procedimento que retorna em um array (table of) todos os amigos de um usuário
  PROCEDURE getGroups(v_idusuario IN usuario.IdUsuario%TYPE, groupes OUT GRUPOS);
  PROCEDURE changeGroup(v_idusuario IN usuario.IdUsuario%TYPE, v_amigo IN usuario.IdUsuario%TYPE, v_grupo IN grupo.nome%TYPE);
  PROCEDURE getGroupsUser(v_idusuario IN usuario.IdUsuario%TYPE, groupes OUT GRUPOOS);
  procedure createGroup(v_idusuario IN usuario.Idusuario%TYPE, grupo IN grupo.nome%TYPE);

END PackGroups;

/

CREATE OR REPLACE PACKAGE BODY PackGroups IS 


  PROCEDURE getGroups(v_idusuario IN usuario.IdUsuario%TYPE, groupes OUT GRUPOS) IS          
            
        
  CURSOR c_groups is   
  SELECT DISTINCT U.idusuario, U.nome, U.sobrenome, cm.grupo
        FROM Usuario U JOIN Amizade AM ON (AM.remetente = v_idusuario ) AND U.idusuario = am.destinatario
                      JOIN COMPOE cm ON cm.Idamizade = am.idamizade
        WHERE U.idusuario <> v_idusuario and cm.idusuario = v_idusuario
        ORDER BY cm.grupo;                      
        
  TYPE t_groups is table of c_groups%ROWTYPE index by PLS_INTEGER;
  v_groups t_groups; 
      
  temp Group_t := Group_t(null, null, null, null); 
  
    BEGIN
    
      OPEN c_groups; 
      
      groupes := grupos(); 
      
      fetch c_groups bulk collect into v_groups;
      
      groupes.extend(v_groups.count);
      
      for i in v_groups.first .. v_groups.last loop
        begin
          temp.id_usuario:= v_groups(i).idusuario;
          temp.nome := v_groups(i).nome;
          temp.sobrenome := v_groups(i).sobrenome;
          temp.grupo := v_groups(i).grupo;
          groupes(i) := temp; 
        end; 
      end loop;
      
      CLOSE c_groups; 
      
         EXCEPTION 
        WHEN NO_DATA_FOUND THEN
          RAISE_APPLICATION_ERROR(-20000, 'Usuário não tem amigos'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN 
          RAISE_APPLICATION_ERROR(-20001, 'Elemento não existe'); 
        WHEN OTHERS THEN
          RAISE_APPLICATION_ERROR(-20002, 'Erro: código: ' || SQLCODE || ' mensagem: ' || SQLERRM);     
   
    
    END getGroups; 
    
   PROCEDURE changeGroup(v_idusuario IN usuario.IdUsuario%TYPE, v_amigo IN usuario.IdUsuario%TYPE, v_grupo IN grupo.nome%TYPE) is
   
   amizades number;   
   gtemp varchar2(10);
   
   begin
      select cm.idamizade, cm.grupo into amizades, gtemp
      from amizade am join compoe cm on (am.idamizade = cm.idamizade)
      where (cm.idusuario = v_idusuario) and ((am.remetente = v_amigo ) or (am.destinatario = v_amigo));

      update compoe
      set grupo = v_grupo
      where idamizade = amizades;
      
      update grupo
      set nmembros = nmembros - 1
      where nome = gtemp;
      
      commit;

   end changeGroup;  
   
   PROCEDURE getGroupsUser(v_idusuario IN usuario.IdUsuario%TYPE, groupes OUT GRUPOOS) is
   begin   
      select distinct g.nome bulk collect into groupes
      from grupo g
      where g.idusuario = v_idusuario;
   end getGroupsUser;   
   
   procedure createGroup(v_idusuario IN usuario.Idusuario%TYPE, grupo IN grupo.nome%TYPE) is
   begin
    insert into grupo values(v_idusuario, grupo, 0);
   end; 
   
END PackGroups;



