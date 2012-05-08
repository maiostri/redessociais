-- pacote que trata das consultas, inserções e remoções dos amigos de um usuário
CREATE OR REPLACE PACKAGE PackFriends IS 

  -- procedimento que retorna em um array (table of) todos os amigos de um usuário    
  PROCEDURE getFriends(v_idusuario IN usuario.IdUsuario%TYPE, friendes OUT FRIENDS); 
  
  PROCEDURE removeFriend(v_idusuario IN usuario.IdUsuario%TYPE, v_amigo IN usuario.IdUsuario%TYPE);

END PackFriends; 
/
CREATE OR REPLACE PACKAGE BODY PackFriends IS 

  -- procedimento que retorna em um array (table of) todos os amigos de um usuário
  PROCEDURE getFriends(v_idusuario IN usuario.IdUsuario%TYPE, friendes OUT FRIENDS) IS   
       
     cursor c_friends is 
        SELECT DISTINCT U.idusuario, Co.Nick
        FROM Usuario U JOIN Amizade AM ON (AM.destinatario = v_idusuario OR AM.remetente = v_idusuario) AND U.idusuario IN (AM.destinatario, AM.remetente) 
        JOIN Conta Co ON Co.idusuario = U.idusuario 
        WHERE U.idusuario <> v_idusuario;
      
      
      TYPE t_friends is table of c_friends%ROWTYPE index by PLS_INTEGER;
      v_friends t_friends; 
      
      temp Friend_t := Friend_t(null, null); 
  
    BEGIN
    
      OPEN c_friends; 
      
      friendes := friends(); 
      
      fetch c_friends bulk collect into v_friends;
      
      friendes.extend(v_friends.count);
      
      for i in v_friends.first .. v_friends.last loop
        begin
          temp.id_usuario:= v_friends(i).idusuario;
          temp.nick := v_friends(i).nick;
          friendes(i) := temp; 
        end; 
      end loop;
      
      CLOSE c_friends; 
      
         EXCEPTION 
        WHEN NO_DATA_FOUND THEN
          RAISE_APPLICATION_ERROR(-20000, 'Usuário não tem amigos'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN 
          RAISE_APPLICATION_ERROR(-20001, 'Elemento não existe'); 
        WHEN OTHERS THEN
          RAISE_APPLICATION_ERROR(-20002, 'Erro: código: ' || SQLCODE || ' mensagem: ' || SQLERRM);     
        
    END getFriends; 
    
    PROCEDURE removeFriend(v_idusuario IN usuario.IdUsuario%TYPE, v_amigo IN usuario.IdUsuario%TYPE) IS
    
    amizades amigoos;
    gtemp varchar2(10);
    
    begin
      select am.idamizade bulk collect into amizades
      from amizade am
      where (am.remetente = v_idusuario and am.destinatario = v_amigo) or (am.remetente = v_amigo and am.destinatario = v_idusuario);      
      
      for i in amizades.first .. amizades.last loop
        begin
          select cm.grupo into gtemp from compoe cm where cm.idamizade = amizades(i);
          update grupo set nmembros = nmembros -1 where nome = gtemp;
          delete from compoe  where (idamizade = amizades(i));
          delete from amizade where (idamizade = amizades(i));  
        end;  
      end loop;  
      
     commit; 
      
    end removeFriend;        
    
END PackFriends; 