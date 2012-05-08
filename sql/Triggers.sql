
-- trigger que insere na tabela atualizações a atualização feita por um usuário
-- que fez um comentário
CREATE OR REPLACE TRIGGER TCOMENTARIO 
AFTER INSERT ON COMENTARIO
FOR EACH ROW

DECLARE
  nickcomentario varchar2(50);
  tipo varchar2(1);
  frase varchar2(9);
  nickcriador varchar2(50);

BEGIN
  
  SELECT CON.NICK INTO nickcomentario
    FROM CONTA CON
    WHERE CON.IDUSUARIO = :new.REMETENTE;
  
  SELECT O.TIPO, CON.NICK  INTO tipo, nickcriador
    FROM OBJETO O JOIN CONTA CON ON (O.IDUSUARIO = CON.IDUSUARIO)
    WHERE O.IDOBJETO = :new.IDOBJETO;
  
  
  IF (TIPO LIKE 'P') THEN
    FRASE := 'um post';
  ELSIF (TIPO LIKE 'A') THEN
    FRASE := 'um álbum';
  ELSIF (TIPO LIKE 'F') THEN
    FRASE := 'uma foto';
  END IF;  
  
  INSERT INTO ATUALIZACOES VALUES(SEQIDATUALIZACOES.NEXTVAL, SYSDATE, :new.REMETENTE, null, 
    nickcomentario || ' comentou ' || frase || ' de ' || nickcriador || ' no dia ' || SYSDATE || ' às ' ||
    TO_CHAR(SYSDATE, 'HH24:MI'));  

END TCOMENTARIO;


-- trigger que atualiza a quantidade de fotos no álbum, quando uma nova novo é inserida (verificando a quantidade máxima)
/*CREATE OR REPLACE TRIGGER addFoto
AFTER INSERT ON FOTO
FOR EACH ROW

  BEGIN
  
    UPDATE Album SET NFotos = NFotos + 1 WHERE IdObjeto = :new.Album; 
  
  END addFoto; */
  
  
-- trigger que atualiza a quantidade de fotos no álbum, quando remove-se uma foto
/*CREATE OR REPLACE TRIGGER rmFoto
AFTER DELETE ON FOTO
FOR EACH ROW

  BEGIN
  
    UPDATE Album SET NFotos = NFotos - 1 WHERE IdObjeto = :old.Album; 
  
  END rmFoto; */
  

-- trigger que insere na tabela atualizações a atualização feita por um usuário
-- que publicou uma foto
create or replace
TRIGGER TFOTO
AFTER INSERT ON FOTO_TEMP
FOR EACH ROW

DECLARE
  nickcomentario varchar2(50);
  --album varchar2(50) := 'teste';
  IdUsuario NUMBER; 

BEGIN

  SELECT CON.NICK INTO nickcomentario
    FROM OBJETO O JOIN Conta CON ON (O.IdUsuario = CON.IdUsuario)
    WHERE O.IdObjeto = :new.IdObjeto; 
    
  /*SELECT AL.Nome INTO album
    FROM Foto F JOIN Album AL ON (F.ALbum = AL.IdObjeto)
    WHERE F.IdObjeto = :new.IdObjeto; */
  
  SELECT O.IdUsuario INTO IdUsuario 
    FROM Objeto O 
    WHERE O.IdObjeto = :new.IdObjeto;  
  
  
  INSERT INTO ATUALIZACOES VALUES(SEQIDATUALIZACOES.NEXTVAL, SYSDATE, IdUsuario, null, 
    nickcomentario || ' publicou uma foto em um álbum no dia ' || SYSDATE || ' às ' ||
    TO_CHAR(SYSDATE, 'HH24:MI'));   
 

END TFOTO;

create or replace
TRIGGER TFOTOTEMP
AFTER INSERT ON FOTO
FOR EACH ROW

BEGIN

  INSERT INTO Foto_temp VALUES (:new.IdObjeto, :new.Descricao, :new.Arquivo, DEFAULT, :new.Album);  
  
END TFOTOTEMP;


-- trigger que insere na tabela atualizações a atualização feita por um usuário
-- que publicou um album
CREATE OR REPLACE TRIGGER TALBUM
AFTER INSERT ON ALBUM_TEMP
FOR EACH ROW

DECLARE
  nickcomentario VARCHAR2(50);
  IdUsuario NUMBER; 

BEGIN  
  
  SELECT CON.NICK INTO nickcomentario
    FROM Objeto O JOIN Conta CON ON (O.IdUsuario = CON.IdUsuario)
    WHERE O.IdObjeto = :new.IdObjeto; 
  
  SELECT O.IdUsuario INTO IdUsuario 
    FROM Objeto O 
    WHERE O.IdObjeto = :new.IdObjeto;  
  
  
  INSERT INTO ATUALIZACOES VALUES(SEQIDATUALIZACOES.NEXTVAL, SYSDATE, IdUsuario, null, 
    nickcomentario || ' publicou um novo álbum no dia ' || SYSDATE || ' às ' ||
    TO_CHAR(SYSDATE, 'HH24:MI'));   

END TALBUM;


-- trigger que insere na tabela atualizações a atualização feita por um usuário
-- que publicou um album
CREATE OR REPLACE TRIGGER TALBUMTEMP
AFTER INSERT ON ALBUM
FOR EACH ROW

BEGIN

  INSERT INTO Album_temp VALUES (:new.IdObjeto, :new.Nome, :new.LocalAlbum, :new.NFotos);  

END TALBUMTEMP;


-- trigger que insere na tabela atualizações a atualização feita por um usuário
-- que publicou um post
CREATE OR REPLACE TRIGGER TPOST
AFTER INSERT ON POST_TEMP
FOR EACH ROW

DECLARE
  nickcomentario VARCHAR2(50);
  IdUsuario NUMBER; 

BEGIN

  SELECT CON.NICK INTO nickcomentario
      FROM Objeto O JOIN Conta CON ON (O.IdUsuario = CON.IdUsuario)
      WHERE O.IdObjeto = :new.IdObjeto; 
    
    SELECT O.IdUsuario INTO IdUsuario 
      FROM Objeto O 
      WHERE O.IdObjeto = :new.IdObjeto;  
    
    
    INSERT INTO ATUALIZACOES VALUES(SEQIDATUALIZACOES.NEXTVAL, SYSDATE, IdUsuario, null, 
      nickcomentario || ' publicou um novo post no dia ' || SYSDATE || ' às ' ||
      TO_CHAR(SYSDATE, 'HH24:MI'));  

END TPOST;

CREATE OR REPLACE TRIGGER TPOSTTEMP
BEFORE INSERT ON POST
FOR EACH ROW

BEGIN

  INSERT INTO Post_temp VALUES (:new.IdObjeto, :new.LinkPost, :new.Conteudo);  

END TPOSTTEMP;


-- trigger disparado para inserir para as informações sobre as atualizações de uma nova amizade
CREATE OR REPLACE TRIGGER TAMIZADE
AFTER INSERT ON AMIZADE_TEMP
FOR EACH ROW

DECLARE
  nickamizade1 VARCHAR2(50);
  nickamizade2 VARCHAR2(50);

BEGIN
  
  SELECT CON.NICK INTO nickamizade1
    FROM Conta CON 
    WHERE IdUsuario = :new.Remetente; 
    
  SELECT CON.NICK INTO nickamizade2
    FROM Conta CON 
    WHERE IdUsuario = :new.Destinatario;   
  
  
  INSERT INTO ATUALIZACOES VALUES(SEQIDATUALIZACOES.NEXTVAL, SYSDATE, :new.Remetente, :new.Destinatario, 
    nickamizade1 || ' iniciou amizade com ' || nickamizade2 || ' no dia ' || SYSDATE || ' às ' ||
    TO_CHAR(SYSDATE, 'HH24:MI'));   

END TAMIZADE;


-- trigger disparado para inserir para as informações sobre as atualizações de uma nova amizade
CREATE OR REPLACE TRIGGER TAMIZADETEMP
AFTER INSERT ON AMIZADE
FOR EACH ROW

BEGIN
  
  INSERT INTO AMIZADE_TEMP VALUES (:new.IdAmizade, :new.mensagem, :new.Remetente, :new.Destinatario, :new.Data);  

END TAMIZADETEMP;


/*
-- trigger disparado para inserir as informações sobre uma nova amizade
CREATE OR REPLACE TRIGGER addFriendless 
  AFTER INSERT ON Amizade_temp
  FOR EACH ROW
  
  BEGIN
  
    -- para o usuário A
    INSERT INTO Amizade
      VALUES (:new.IdAmizade, :new.Mensagem, :new.Remetente, :new.Destinatario, SYSDATE); 
  
    INSERT INTO Compoe 
      VALUES (:new.Remetente, 'Friends', :new.IdAmizade); 
    
    -- atualização do número de membros do grupo default
    UPDATE Grupo SET NMembros = NMembros + 1 
      WHERE idusuario = :new.Remetente AND nome = 'Friends'; 
    
    -- para o usuário B (a mesma mensagem enviada por A, apenas por mensagem não poder ser NULL)
    INSERT INTO Amizade
      VALUES (SeqIdAmizade.nextVal, :new.Mensagem, :new.Destinatario, :new.Remetente, SYSDATE); 
      
    INSERT INTO Compoe 
      VALUES (:new.Destinatario, 'Friends', SeqIdAmizade.currval); 
      
    -- atualização do número de membros do grupo default
    UPDATE Grupo SET NMembros = NMembros + 1 
      WHERE idusuario = :new.Destinatario AND nome = 'Friends'; 
        
        
    EXCEPTION
      WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20000,  'Esta amizade já existe');
      WHEN PROGRAM_ERROR THEN
        RAISE_APPLICATION_ERROR(-20001,  'Erro na execução do código PL/SQL'); 
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20999,  'Código do erro: ' || SQLCODE || ' Mensagem: ' || SQLERRM); 
    
  
  END addFriendless;*/
  
  
  -- Trigger que cria um grupo padrão para o usuário
CREATE OR REPLACE TRIGGER GRUPOUSER
AFTER INSERT ON USUARIO
FOR EACH ROW

 BEGIN
     INSERT INTO GRUPO VALUES (:new.Idusuario, 'Friends', 0);
 END;
 
 
 -- atualiza o número de membros de uma comunidade
CREATE OR REPLACE TRIGGER addUserCommunity
  AFTER INSERT ON Participa 
  FOR EACH ROW
  
  BEGIN
  
    UPDATE Comunidade SET nmembros = nmembros + 1 
      WHERE :new.idusuario = idusuario AND :new.comunidade = nome;    
      
  -- não há tratamentos de exceções semânticas, pois o número de membros de uma 
  -- comunidade só é atulizado quando a inserçao na tabela Particpa é
  -- realizada. Além disso, UPDATE não lança nenhuma exceção, nesse caso
  EXCEPTION
    WHEN PROGRAM_ERROR THEN
      RAISE_APPLICATION_ERROR(-20000,  'Erro na execução do código PL/SQL'); 
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20999,  'Código do erro: ' || SQLCODE || ' Mensagem: ' || SQLERRM); 
    
  END addUserCommunity;  
  

create or replace
TRIGGER removeUserCommunity
  AFTER DELETE ON Participa 
  FOR EACH ROW
  
  BEGIN
  
    UPDATE Comunidade SET nmembros = nmembros - 1 
      WHERE :old.idusuario = idusuario AND :old.comunidade = nome;     
  
  -- não há tratamentos de exceções semânticas, pois o número de membros de uma 
  -- comunidade só é atulizado quando a inserçao na tabela Particpa é
  -- realizada. Além disso, UPDATE não lança nenhuma exceção, nesse caso
  EXCEPTION
    WHEN PROGRAM_ERROR THEN
      RAISE_APPLICATION_ERROR(-20000,  'Erro na execução do código PL/SQL'); 
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20999,  'Código do erro: ' || SQLCODE || ' Mensagem: ' || SQLERRM); 
      
  END removeUserCommunity;  
