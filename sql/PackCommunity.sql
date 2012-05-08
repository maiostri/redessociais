
--pacote referente as operações sobre comunidades
CREATE OR REPLACE PACKAGE PackCommunity IS

  -- recupera as informações das comunidade de um usuário para mostra-las na página inicial
  PROCEDURE getInitialCommunities(v_idusuario IN usuario.IdUsuario%TYPE, communities OUT initial_communitys); 
  
  -- recupera todas as informações das comunidades das quais um usuário é dono
  PROCEDURE getCommunities(v_idusuario IN usuario.IdUsuario%TYPE, communities OUT communitys); 
  
  -- recupera os usuários de uma comunidade
  PROCEDURE getUsersCommunities(v_idusuario IN usuario.IdUsuario%TYPE, nome_c IN comunidade.nome%TYPE, usuarios OUT users); 
  
  -- atualiza os dados de um comunidade
  PROCEDURE updateCommunity(v_idusuario IN usuario.IdUsuario%TYPE, nome_c IN comunidade.nome%TYPE, Descr comunidade.Descricao%TYPE, Categ Categoria.Categoria%TYPE); 
  
  -- insere os dados de uma comunidade
  PROCEDURE insertCommunity(v_idusuario IN usuario.IdUsuario%TYPE, nome_c IN comunidade.nome%TYPE, Descr comunidade.Descricao%TYPE, Categ Categoria.Categoria%TYPE); 

  -- remove os dados de uma comunidade
  PROCEDURE removeCommunity(v_idusuario IN usuario.IdUsuario%TYPE, nome_c IN comunidade.nome%TYPE); 
  
  -- recupera as informações das comunidades que um usuário participa
  PROCEDURE getCommunitiesP(v_idusuario IN usuario.IdUsuario%TYPE, communities OUT communitys); 
  
  -- deixa de participar de uma comunidade
  PROCEDURE exitCommunity(v_idusuario IN usuario.IdUsuario%TYPE, v_idusuariocom IN usuario.IdUsuario%TYPE, Nome IN Comunidade.Nome%TYPE); 


END PackCommunity;
/
CREATE OR REPLACE PACKAGE BODY PackCommunity IS


  PROCEDURE getInitialCommunities(v_idusuario IN usuario.IdUsuario%TYPE, communities OUT initial_communitys) IS
  
    CURSOR c_community IS SELECT IdUsuario, Comunidade FROM Participa WHERE Participante = v_idusuario;  
    
    TYPE t_community is table of c_community%ROWTYPE index by PLS_INTEGER;
    v_community t_community; 
    
    temp initial_community_t := initial_community_t(null, null); 
  
    BEGIN
    
      communities := initial_communitys(); 
    
      -- busca as comunidades nas quais um usuário participa, por meio de seu id
      OPEN c_community; 
      
      FETCH c_community BULK COLLECT INTO v_community;
      
      communities.extend(c_community%ROWCOUNT); 
      
      FOR i IN v_community.FIRST .. v_community.LAST LOOP
        BEGIN
          temp.IdDono := v_community(i).IdUsuario; 
          temp.Nome := v_community(i).Comunidade;
          communities(i) := temp; 
        END;
      END LOOP; 
      
      CLOSE c_community; 
      
      EXCEPTION 
        WHEN NO_DATA_FOUND THEN
          RAISE_APPLICATION_ERROR(-20000, 'Usuário não participa de comunidades (FOREVER ALONE)'); 
        WHEN OTHERS THEN
          RAISE_APPLICATION_ERROR(-20001, 'Erro qualquer'); 
    
    END getInitialCommunities; 
    
    
    
  PROCEDURE getCommunities(v_idusuario IN usuario.IdUsuario%TYPE, communities OUT communitys) IS
  
  
      CURSOR c_community IS SELECT Com.IdUsuario, Com.Nome, Com.Descricao, Com.NMembros, Cat.Categoria, Com.DataCriacao
                              FROM Comunidade Com JOIN Categoria Cat ON Com.IdUsuario = Cat.IdUsuario AND Com.Nome = Cat.Comunidade
                              WHERE Com.IdUsuario = v_idusuario;  
                              
      TYPE t_community IS TABLE OF c_community%ROWTYPE INDEX BY PLS_INTEGER; 
      v_community t_community; 
      
      temp community_t := community_t(null, null, null, null, null, null, null); 
  
    BEGIN

      OPEN c_community; 
      
      FETCH c_community BULK COLLECT INTO v_community; 
      
      communities := communitys(); 
      communities.EXTEND(v_community.COUNT);   
      
      FOR i IN 1 .. v_community.COUNT LOOP
        BEGIN
          temp.IdDono := v_community(i).IdUsuario;  
          temp.Nome := v_community(i).Nome; 
          temp.Descricao := v_community(i).Descricao;
          temp.NMembros := v_community(i).NMembros; 
          temp.Categoria := v_community(i).Categoria; 
          temp.DataCriacao := TO_CHAR(v_community(i).DataCriacao, 'dd/mm/yyyy');  
          temp.Membros := null;  
          communities(i) := temp;  
        END; 
      END LOOP; 
      
      CLOSE  c_community; 
      
      
      EXCEPTION 
        WHEN OTHERS THEN
          RAISE_APPLICATION_ERROR(-20000, 'Erro qualquer'); 
    
    END getCommunities; 
    
  
  
  PROCEDURE getUsersCommunities(v_idusuario IN usuario.IdUsuario%TYPE, nome_c IN comunidade.nome%TYPE, usuarios OUT users) IS
  
    CURSOR c_users IS SELECT U.IdUsuario, U.Nome, U.Sobrenome 
                              FROM Comunidade Com JOIN Participa P ON Com.IdUsuario = P.IdUsuario AND Com.Nome = P.Comunidade
                                JOIN Usuario U ON U.IdUsuario = P.Participante
                                WHERE Com.IdUsuario = v_idusuario AND Com.Nome = nome_c; 
                                
    TYPE t_users IS TABLE OF c_users%ROWTYPE INDEX BY PLS_INTEGER; 
    v_users t_users;  
    
    temp user_t := user_t(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);  
  
    BEGIN
            
      usuarios := users(); 
      
      
      OPEN c_users;
      
      FETCH c_users BULK COLLECT INTO v_users; 
      usuarios.EXTEND(v_users.COUNT); 
        
      FOR i IN 1 .. v_users.COUNT LOOP
        BEGIN
          temp.Id_Usuario := v_users(i).IdUsuario; 
          temp.Nome := v_users(i).Nome; 
          temp.Sobrenome := v_users(i).Sobrenome; 
          usuarios(i) := temp; 
        END; 
      END LOOP;
      
      
      CLOSE c_users; 
      
    
    END getUsersCommunities; 
    
    
  PROCEDURE updateCommunity(v_idusuario IN usuario.IdUsuario%TYPE, nome_c IN comunidade.nome%TYPE, Descr comunidade.Descricao%TYPE, Categ Categoria.Categoria%TYPE) IS
  
    BEGIN
    
       SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;   
       
       UPDATE Comunidade Com SET Com.Descricao = Descr WHERE Com.IdUsuario = v_idusuario AND Com.Nome = nome_c; 
       UPDATE Categoria Cat SET Cat.Categoria = Categ WHERE Cat.IdUsuario = v_idusuario AND Cat.Comunidade = nome_c;  
       
       COMMIT; 

        EXCEPTION         
          WHEN OTHERS THEN
            BEGIN
              ROLLBACK;
              RAISE_APPLICATION_ERROR(-20000, 'Erro');  
            END; 
    
    END updateCommunity; 
    
    
  PROCEDURE insertCommunity(v_idusuario IN usuario.IdUsuario%TYPE, nome_c IN comunidade.nome%TYPE, Descr comunidade.Descricao%TYPE, Categ Categoria.Categoria%TYPE) IS
  
    BEGIN
    
       SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;   
       
       INSERT INTO Comunidade VALUES(v_idusuario, nome_c, Descr, 0, SYSDATE); 
       INSERT INTO Categoria VALUES(Categ, v_idusuario, nome_c); 
       INSERT INTO Participa VALUES(1, v_idusuario, nome_c); 
       
       COMMIT; 

        EXCEPTION         
          WHEN OTHERS THEN
            BEGIN
              ROLLBACK;
              RAISE_APPLICATION_ERROR(-20000, 'Erro');  
            END; 
    
    END insertCommunity; 
    
    
  
  PROCEDURE removeCommunity(v_idusuario IN usuario.IdUsuario%TYPE, nome_c IN comunidade.nome%TYPE) IS
  
    BEGIN
    
       SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;   
       
       
       -- remoção dos posts da comunidade
       DELETE FROM Post P WHERE P.IdObjeto IN (SELECT O.IdObjeto FROM Objeto O WHERE O.DonoComunidade = v_idusuario AND O.Comunidade = nome_c); 
       
       -- remoção dos albuns da comunidade
       DELETE FROM Album AL WHERE Al.IdObjeto IN (SELECT O.IdObjeto FROM Objeto O WHERE O.DonoComunidade = v_idusuario AND O.Comunidade = nome_c); 
       
       -- remoção das fotos da comunidade
       DELETE FROM Foto F WHERE F.IdObjeto IN (SELECT O.IdObjeto FROM Objeto O WHERE O.DonoComunidade = v_idusuario AND O.Comunidade = nome_c); 
       
       -- remoção dos objetos da comunidade
       DELETE FROM Objeto O  WHERE O.DonoComunidade = v_idusuario AND O.Comunidade = nome_c;  
       
       
       -- remoção das informações da comunidade
       DELETE FROM Participa P WHERE P.Comunidade = nome_c AND P.IdUsuario = v_idusuario; 
       DELETE FROM Categoria Ct WHERE Ct.Comunidade  = nome_c AND Ct.IdUsuario = v_idusuario;
       DELETE FROM Comunidade Cm WHERE Cm.Nome  = nome_c AND Cm.IdUsuario = v_idusuario;       
       
       COMMIT; 

        EXCEPTION         
          WHEN OTHERS THEN
            BEGIN
              ROLLBACK;
              RAISE_APPLICATION_ERROR(-20000, 'Erro');  
            END; 
    
    END removeCommunity; 
    
    
  PROCEDURE getCommunitiesP(v_idusuario IN usuario.IdUsuario%TYPE, communities OUT communitys) IS
  
    CURSOR c_community IS SELECT IdUsuario, Nome, Descricao, NMembros, Categoria, DataCriacao
                              FROM view_community
                              WHERE Participante = v_idusuario;  
                              
      TYPE t_community IS TABLE OF c_community%ROWTYPE INDEX BY PLS_INTEGER; 
      v_community t_community; 
      
      temp community_t := community_t(null, null, null, null, null, null, null); 
  
    BEGIN

      OPEN c_community; 
      
      FETCH c_community BULK COLLECT INTO v_community; 
      
      communities := communitys(); 
      communities.EXTEND(v_community.COUNT);   
      
      FOR i IN 1 .. v_community.COUNT LOOP
        BEGIN
          temp.IdDono := v_community(i).IdUsuario;  
          temp.Nome := v_community(i).Nome; 
          temp.Descricao := v_community(i).Descricao;
          temp.NMembros := v_community(i).NMembros; 
          temp.Categoria := v_community(i).Categoria; 
          temp.DataCriacao := TO_CHAR(v_community(i).DataCriacao, 'dd/mm/yyyy');  
          temp.Membros := null;  
          communities(i) := temp;  
        END; 
      END LOOP; 
      
      CLOSE  c_community; 
      
      
      EXCEPTION 
        WHEN OTHERS THEN
          RAISE_APPLICATION_ERROR(-20000, 'Erro qualquer'); 
    
    END getCommunitiesP; 
    
    
  PROCEDURE exitCommunity(v_idusuario IN usuario.IdUsuario%TYPE, v_idusuariocom IN usuario.IdUsuario%TYPE, Nome IN Comunidade.Nome%TYPE) IS
  
    BEGIN
    
      DELETE FROM Participa WHERE Participante = v_idusuario AND IdUsuario = v_idusuariocom AND Comunidade = Nome;  
    
    END; 


END PackCommunity;