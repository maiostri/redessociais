create or replace
package PackPost is
 
 -- recupera os posts de um usuário
 procedure getposts(v_idusuario IN usuario.idusuario%type, postes OUT posts);
 
 
 procedure getCommentPosts(v_idpost IN Post.idObjeto%type, comentarios OUT comments);
 
 
 -- insere um post
  PROCEDURE insertPost(v_idusuario IN usuario.idusuario%type, Conteudo IN Post.Conteudo%TYPE, LinkPost IN Post.LinkPost%TYPE);  
  
  -- remover post
  PROCEDURE removePost(v_idobjeto IN Objeto.IdObjeto%TYPE);  
  
  -- insere um comentário em um post
  PROCEDURE insertCommentPost(v_idusuario IN Usuario.IdUsuario%TYPE, v_idalbum IN objeto.IdObjeto%TYPE, Conteudo IN Post.Conteudo%TYPE, LinkPost IN Post.LinkPost%TYPE); 
 
end PackPost;
/
create or replace
package body PackPost as
    
  procedure getposts(v_idusuario IN usuario.idusuario%type, postes OUT posts) is
  
     cursor c_coments is 
      SELECT P.IdObjeto, P.Conteudo, P.LinkPost 
        FROM Post P JOIN Objeto O ON P.IdObjeto = O.IdObjeto 
        WHERE O.IdUsuario = v_idusuario AND P.IdObjeto NOT IN (SELECT Co.Post FROM Comentario Co); 
 
      
      TYPE t_coments is table of c_coments%ROWTYPE index by PLS_INTEGER;
      v_coments t_coments; 
      
      temp Post_t := Post_t(null, null, null); 
  
    BEGIN
    
      OPEN c_coments; 
      
      postes := posts(); 
      
      fetch c_coments bulk collect into v_coments;
      
      postes.extend(v_coments.count);
      
      for i in v_coments.first .. v_coments.last loop
        begin
          temp.conteudo := v_coments(i).conteudo;
          temp.idobjeto := v_coments(i).idobjeto;
          temp.linkpost := v_coments(i).linkpost;
          postes(i) := temp; 
        end; 
      end loop;
      
      CLOSE c_coments; 
      
      EXCEPTION 
        WHEN NO_DATA_FOUND THEN
          RAISE_APPLICATION_ERROR(-20000, 'Usuário não existe ou nunca fez um post'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN 
          RAISE_APPLICATION_ERROR(-20001, 'Elemento não existe'); 
        WHEN OTHERS THEN
          RAISE_APPLICATION_ERROR(-20002, 'Erro: código: ' || SQLCODE || ' mensagem: ' || SQLERRM); 

    END getposts;   
    
    procedure getCommentPosts(v_idpost IN Post.idObjeto%type, comentarios OUT comments) is 
  
    cursor c_coments is 
    SELECT Cn.Nick, P.Conteudo, O.DataCriacao
    FROM Comentario Co JOIN Post P ON Co.Post = P.IdObjeto JOIN Objeto O ON O.IdObjeto = P.IdObjeto JOIN Conta Cn ON Cn.IdUsuario = O.IdUsuario
    WHERE CO.IdObjeto = v_idpost; 

    TYPE t_coments is table of c_coments%ROWTYPE index by PLS_INTEGER;
    v_coments t_coments; 
      
    temp Comment_t := Comment_t(null, null, null); 
  
    BEGIN
    
      OPEN c_coments; 
      
      comentarios := comments(); 
      
      fetch c_coments bulk collect into v_coments;
      
      comentarios.extend(v_coments.count);
      
      for i in v_coments.first .. v_coments.last loop
        begin
          temp.nick := v_coments(i).nick;
          temp.comm := v_coments(i).conteudo;
          temp.datahora := v_coments(i).datacriacao;
          comentarios(i) := temp; 
        end; 
      end loop;
      
      CLOSE c_coments; 
      
      EXCEPTION 
        WHEN NO_DATA_FOUND THEN
          RAISE_APPLICATION_ERROR(-20000, 'Usuário não existe ou nunca fez um post'); 
        WHEN SUBSCRIPT_BEYOND_COUNT THEN 
          RAISE_APPLICATION_ERROR(-20001, 'Elemento não existe'); 
        WHEN OTHERS THEN
          RAISE_APPLICATION_ERROR(-20002, 'Erro: código: ' || SQLCODE || ' mensagem: ' || SQLERRM); 

    END getCommentPosts;         
    
    
  PROCEDURE insertPost(v_idusuario IN usuario.idusuario%type, Conteudo IN Post.Conteudo%TYPE, LinkPost IN Post.LinkPost%TYPE) IS
  
    BEGIN
    
      SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
    
        INSERT INTO Objeto VALUES (SeqIdObjeto.nextVal, 'P', SYSDATE, null, null, v_idusuario); 
        INSERT INTO Post VALUES (SeqIdObjeto.currVal, LinkPost, Conteudo);         
    
      COMMIT; 
    
      EXCEPTION         
        WHEN OTHERS THEN
          BEGIN
            ROLLBACK; 
            RAISE_APPLICATION_ERROR(-20000, 'Erro: código: ' || SQLCODE || ' mensagem: ' || SQLERRM); 
          END; 
    
    END insertPost; 
    
    
  PROCEDURE removePost(v_idobjeto IN Objeto.IdObjeto%TYPE) IS
  
    BEGIN
    
      SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
    
        -- remover os comentários do post
      DELETE FROM Objeto WHERE IdObjeto IN (SELECT P.IdObjeto
                                                FROM Post P JOIN Comentario Com ON P.IdObjeto = Com.Post
                                                WHERE Com.IdObjeto = v_idobjeto);
                                                
      DELETE FROM Post WHERE IdObjeto IN (SELECT P.IdObjeto
                                                FROM Post P JOIN Comentario Com ON P.IdObjeto = Com.Post
                                                WHERE Com.IdObjeto = v_idobjeto);  
                                                
      DELETE FROM Comentario WHERE IdObjeto = v_idobjeto; 
      
      -- remove o post
      DELETE FROM Objeto WHERE IdObjeto = v_idobjeto;  
      DELETE FROM Post WHERE IdObjeto = v_idobjeto;  
    
      COMMIT; 
    
      EXCEPTION         
        WHEN OTHERS THEN
          BEGIN
            ROLLBACK; 
            RAISE_APPLICATION_ERROR(-20000, 'Erro: código: ' || SQLCODE || ' mensagem: ' || SQLERRM); 
          END; 
    
    END removePost; 
    
    
  PROCEDURE insertCommentPost(v_idusuario IN Usuario.IdUsuario%TYPE, v_idalbum IN objeto.IdObjeto%TYPE, Conteudo IN Post.Conteudo%TYPE, LinkPost IN Post.LinkPost%TYPE) IS
  
    BEGIN
    
      SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;   
      
        INSERT INTO Objeto VALUES(SeqIdObjeto.nextVal, 'P', SYSDATE, null, null, v_idusuario);   
        
        INSERT INTO Post VALUES(SeqIdObjeto.currVal, LinkPost, Conteudo); 
        
        INSERT INTO Comentario VALUES(v_idusuario, SeqIdObjeto.currVal, v_idalbum);   
      
      COMMIT; 
      
      EXCEPTION
          WHEN OTHERS THEN
            BEGIN
              ROLLBACK;  
              RAISE_APPLICATION_ERROR(-20000, SQLERRM);  
            END; 
        
    END insertCommentPost; 
  
  
end PackPost;