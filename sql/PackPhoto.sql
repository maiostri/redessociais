
--pacote referente as operações sobre fotos e álbuns
CREATE OR REPLACE PACKAGE PackPhoto IS

  -- exceção lançada quando um álbum possui sua capacidade máxima (100 fotos)
  maxPhotoException EXCEPTION; 

  -- retorna os álbuns de um usuário (sem as fotos)
  PROCEDURE getAlbums(v_idusuario IN usuario.idusuario%TYPE, albums_u OUT albums); 
  
  -- recupera as fotos de um álbum
  PROCEDURE getPhotosAlbum(v_idobjeto IN objeto.IdObjeto%TYPE, fotos OUT photos);  
  
  -- recupera os comentários de um álbum ou de uma foto
  PROCEDURE getCommentsAlbum(v_idobjeto IN objeto.IdObjeto%TYPE, comentarios OUT COMMENTS); 
  
  -- recupera a foto de um álbum por meio de seu id
  PROCEDURE getPhoto(v_idobjeto IN objeto.IdObjeto%TYPE, photo OUT photo_t);
  
  -- recupera a quantidade de comentários das fotos de um álbum
  PROCEDURE getNCommentsAlbum(v_idobjeto IN objeto.IdObjeto%TYPE, nro_photos OUT NUMBER); 
  
  -- recupera a quantidade de fotos de um álbum
  PROCEDURE getNPhotosAlbum(v_idobjeto IN objeto.IdObjeto%TYPE, nro_photos OUT NUMBER); 
  
  -- insere um álbum novo
  PROCEDURE insertAlbum(v_idusuario IN Usuario.IdUsuario%TYPE, NomeAlbum IN Album.Nome%TYPE, LocalAlbum IN Album.LocalAlbum%TYPE); 
  
  -- adiciona um comentário a um álbum
  PROCEDURE insertCommentAlbum(v_idusuario IN Usuario.IdUsuario%TYPE, v_idalbum IN objeto.IdObjeto%TYPE, Conteudo IN Post.Conteudo%TYPE, LinkPost IN Post.LinkPost%TYPE); 
  
  -- remove um álbum
  PROCEDURE removeAlbum(v_idobjeto IN Objeto.IdObjeto%TYPE); 
  
  -- insere uma foto em um álbum
  PROCEDURE insertPhotoAlbum(v_idusuario IN Usuario.IdUsuario%TYPE, v_idobjetoalbum IN Objeto.IdObjeto%TYPE, v_idobjetofoto OUT Objeto.IdObjeto%TYPE, Descricao IN Foto.Descricao%TYPE, Arquivo IN Foto.Arquivo%TYPE);
  
  -- remove a foto de um álbum
  PROCEDURE removePhotoAlbum(v_idobjetofoto IN Foto.IdObjeto%TYPE, v_idobjetoalbum IN Foto.IdObjeto%TYPE); 
  
   -- adiciona um comentário a uma foto
  PROCEDURE insertCommentPhoto(v_idusuario IN Usuario.IdUsuario%TYPE, v_idalbum IN objeto.IdObjeto%TYPE, Conteudo IN Post.Conteudo%TYPE, LinkPost IN Post.LinkPost%TYPE); 

END PackPhoto;
/
CREATE OR REPLACE PACKAGE BODY PackPhoto IS
  

  PROCEDURE getAlbums(v_idusuario IN usuario.idusuario%TYPE, albums_u OUT albums) IS
  
    -- cursor que busca os álbuns de um usuário
    CURSOR c_albums IS 
      SELECT Al.IdObjeto, Al.Nome, Al.LocalAlbum 
        FROM Album Al JOIN Objeto O ON O.IdObjeto = Al.IdObjeto 
        WHERE O.IdUsuario = v_idusuario; 
        
    TYPE t_albums IS TABLE OF c_albums%ROWTYPE INDEX BY PLS_INTEGER; 
    v_albums t_albums; 

    
    
    temp album_t := album_t(null, null, null, null);   
        
    BEGIN
    
      OPEN c_albums; 
      
      FETCH c_albums BULK COLLECT INTO v_albums;
    
      albums_u := albums();  
      albums_u.EXTEND(v_albums.COUNT); 
      
      FOR i IN v_albums.FIRST .. v_albums.LAST LOOP
        BEGIN
          temp.IdObjeto := v_albums(i).IdObjeto;  
          temp.Nome := v_albums(i).Nome;
          temp.LocalAlbum := v_albums(i).LocalAlbum;          
          albums_u(i) := temp; 
        END; 
      END LOOP; 
      
      CLOSE c_albums;  
    
    
    END getAlbums; 
    
    
  PROCEDURE getPhotosAlbum(v_idobjeto IN objeto.IdObjeto%TYPE, fotos OUT photos) IS
  
    CURSOR c_photos IS
      SELECT  F.IdObjeto, F.Descricao, F.Arquivo, F.Imagem 
        FROM Foto F 
        WHERE F.Album = v_idobjeto; 
        
    TYPE t_photos IS TABLE OF c_photos%ROWTYPE INDEX BY PLS_INTEGER; 
    v_photos t_photos; 
    
    temp2 photo_t := photo_t(null, null, null, null); 
    
  
    BEGIN
    
      OPEN c_photos; 
      FETCH c_photos BULK COLLECT INTO v_photos;
      fotos := photos();  
      fotos.EXTEND(v_photos.COUNT);   
      
      FOR j IN 1 .. c_photos%ROWCOUNT LOOP
        BEGIN
          temp2.IdObjeto := v_photos(j).IdObjeto; 
          temp2.Descricao := v_photos(j).Descricao; 
          temp2.Arquivo := v_photos(j).Arquivo; 
          temp2.Imagem := v_photos(j).Imagem; 
          fotos(j) := temp2;  
        END;   
      END LOOP;  
      
      CLOSE c_photos;       
    
    END getPhotosAlbum; 
    
    
    PROCEDURE getCommentsAlbum(v_idobjeto IN objeto.IdObjeto%TYPE, comentarios OUT COMMENTS) IS 
    
      CURSOR c_comments IS SELECT Po.Conteudo, Co.Nick, O.DataCriacao 
                              FROM Comentario Com JOIN Post Po ON Com.Post = Po.IdObjeto JOIN Objeto O ON Po.IdObjeto = O.IdObjeto 
                                JOIN Conta Co ON Co.IdUsuario = O.IdUsuario
                              WHERE Com.IdObjeto = v_idobjeto
                              ORDER BY O.DataCriacao DESC;   
                                
      TYPE t_comments IS TABLE OF c_comments%ROWTYPE INDEX BY PLS_INTEGER; 
      v_comments t_comments; 
      
      temp comment_t := comment_t(null, null, null); 
    
      BEGIN
      
        OPEN c_comments; 
        FETCH c_comments BULK COLLECT INTO v_comments;
        
        comentarios := comments();           
        
        FOR i IN 1 .. c_comments%ROWCOUNT LOOP
        --FOR i IN v_comments.FIRST .. v_comments.LAST LOOP
          BEGIN
            comentarios.EXTEND(); 
            temp.Nick := v_comments(i).Nick; 
            temp.Comm := v_comments(i).Conteudo; 
            temp.DataHora := TO_CHAR(v_comments(i).DataCriacao);  
            comentarios(i) := temp;  
          END;   
        END LOOP;  
        
        CLOSE c_comments;  
        
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          RAISE_APPLICATION_ERROR(-20000, 'Nenhum comentário no álbum'); 
      
      END getCommentsAlbum; 
      
      
    PROCEDURE getPhoto(v_idobjeto IN objeto.IdObjeto%TYPE, photo OUT photo_t) IS
    
      BEGIN
      
        photo := photo_t(null, null, null, null); 
      
        SELECT F.IdObjeto, F.Descricao, F.Arquivo, F.Imagem INTO photo.IdObjeto, photo.Descricao, photo.Arquivo, photo.Imagem
          FROM Foto F WHERE F.IdObjeto = v_idobjeto; 
          
        EXCEPTION 
          WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Foto não existe'); 
      
      END getPhoto; 
      
      
    
    PROCEDURE getNCommentsAlbum(v_idobjeto IN objeto.IdObjeto%TYPE, nro_photos OUT NUMBER) IS
    
      BEGIN
      
        SELECT COUNT(*) INTO nro_photos
          FROM Comentario Com
          WHERE Com.IdObjeto IN (SELECT F.IdObjeto FROM Foto F WHERE F.Album = v_idobjeto);  
        
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Não há comentários'); 
      
      END getNCommentsAlbum; 
      
      
      
    PROCEDURE getNPhotosAlbum(v_idobjeto IN objeto.IdObjeto%TYPE, nro_photos OUT NUMBER) IS
    
      BEGIN
      
        SELECT COUNT(*) INTO nro_photos 
          FROM Foto F 
          WHERE F.Album = v_idobjeto; 
      
      END getNPhotosAlbum;
      
      
      
    PROCEDURE insertAlbum(v_idusuario IN Usuario.IdUsuario%TYPE, NomeAlbum IN Album.Nome%TYPE, LocalAlbum IN Album.LocalAlbum%TYPE) IS
    
      BEGIN
      
        SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;   
      
        INSERT INTO Objeto VALUES (SeqIdObjeto.nextVal, 'A', SYSDATE, null, null, v_idusuario);  
        
        INSERT INTO Album VALUES (SeqIdObjeto.currVal, NomeAlbum, LocalAlbum, 0); 
        
        COMMIT; 

        EXCEPTION         
          WHEN OTHERS THEN
            BEGIN
              ROLLBACK;
              RAISE_APPLICATION_ERROR(-20000, 'Erro');  
            END; 
      
      END insertAlbum; 
      
      
    PROCEDURE removeAlbum(v_idobjeto IN Objeto.IdObjeto%TYPE) IS 
    
      BEGIN
      
        SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;   
        
        --deve remover todas as fotos e comentários sobre as fotos e os álbuns
        
        --remoção dos comentários do álbum          
        DELETE FROM Objeto WHERE IdObjeto IN (SELECT P.IdObjeto
                                                FROM Post P JOIN Comentario Com ON P.IdObjeto = Com.Post
                                                WHERE Com.IdObjeto = v_idobjeto); 
                                                
        DELETE FROM Post WHERE IdObjeto IN (SELECT P.IdObjeto
                                              FROM Post P JOIN Comentario Com ON P.IdObjeto = Com.Post
                                              WHERE Com.IdObjeto = v_idobjeto);    
                                                
        DELETE FROM Comentario WHERE IdObjeto = v_idobjeto;
        
        
        
        --remoção dos comentários das fotos do álbum        
        DELETE FROM Objeto WHERE IdObjeto IN (SELECT P.IdObjeto
                                                FROM Post P JOIN Comentario Com ON P.IdObjeto = Com.Post
                                                WHERE Com.IdObjeto IN (SELECT F.IdObjeto FROM Foto F WHERE F.album = v_idobjeto)); 
        
        DELETE FROM Post WHERE IdObjeto IN (SELECT P.IdObjeto
                                              FROM Post P JOIN Comentario Com ON P.IdObjeto = Com.Post
                                              WHERE Com.IdObjeto IN (SELECT F.IdObjeto FROM Foto F WHERE F.album = v_idobjeto));            
        
        DELETE FROM Comentario Com WHERE Com.IdObjeto IN (SELECT F.IdObjeto FROM Foto F WHERE F.album = v_idobjeto);
                                
                                
             
                                
        --remoção das fotos do álbum   
        DELETE FROM Objeto WHERE IdObjeto IN (SELECT F.IdObjeto FROM Foto F WHERE F.Album = v_idobjeto); 
        DELETE FROM Foto WHERE Album = v_idobjeto;  
      
      
        -- remoção do álbum vazio e sem nenhuma referência
        DELETE FROM Album WHERE IdObjeto = v_idobjeto; 
        DELETE FROM Objeto WHERE IdObjeto = v_idobjeto; 
        
        COMMIT; 
        
        EXCEPTION
          WHEN OTHERS THEN
            BEGIN
              ROLLBACK;  
              RAISE_APPLICATION_ERROR(-20000, SQLERRM);  
            END; 
      
      END removeAlbum; 
      

  PROCEDURE insertCommentAlbum(v_idusuario IN Usuario.IdUsuario%TYPE, v_idalbum IN objeto.IdObjeto%TYPE, Conteudo IN Post.Conteudo%TYPE, LinkPost IN Post.LinkPost%TYPE) IS
  
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
        
    END insertCommentAlbum; 



    PROCEDURE insertPhotoAlbum(v_idusuario IN Usuario.IdUsuario%TYPE, v_idobjetoalbum IN Objeto.IdObjeto%TYPE, v_idobjetofoto OUT Objeto.IdObjeto%TYPE, Descricao IN Foto.Descricao%TYPE, Arquivo IN Foto.Arquivo%TYPE) IS   
  
    nro_fotos NUMBER := 0; 
    IdFoto NUMBER; 
  
    BEGIN
    
      SELECT NFotos INTO nro_fotos
        FROM Album
        WHERE IdObjeto = v_idobjetoalbum; 
        
      IF (nro_fotos = 100) THEN
        RAISE maxPhotoException; 
      END IF; 
    
      SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;  
      
      --v_idobjetofoto := SeqIdObjeto.nextVal;  
      
      --INSERT INTO Objeto VALUES (v_idobjetofoto, 'F', SYSDATE, null, null, v_idusuario);  
      
      --INSERT INTO FOTO(IdObjeto, Descricao, Arquivo, Album) VALUES (v_idobjetofoto, Descricao, Arquivo, v_idobjetoalbum); 
      
      INSERT INTO Objeto VALUES (SeqIdObjeto.nextVal, 'F', SYSDATE, null, null, v_idusuario);  
      
      INSERT INTO FOTO(IdObjeto, Descricao, Arquivo, Album) VALUES (SeqIdObjeto.currVal, Descricao, Arquivo, v_idobjetoalbum); 
      
      nro_fotos := nro_fotos + 1;  
      
      UPDATE Album SET NFotos = nro_fotos WHERE IdObjeto = v_idobjetoalbum;  
      
      COMMIT; 
      
      EXCEPTION
          WHEN maxPhotoException THEN 
            BEGIN
              ROLLBACK;  
              RAISE_APPLICATION_ERROR(-20001, 'Capacidade Máxima Atingida');   
            END; 
          WHEN OTHERS THEN
            BEGIN
              ROLLBACK;  
              RAISE_APPLICATION_ERROR(-20000, SQLERRM);  
            END; 
            
        SELECT SeqIdObjeto.currVal INTO v_idobjetofoto
          FROM DUAL; 
    
    END insertPhotoAlbum;   
    
    
    
  PROCEDURE removePhotoAlbum(v_idobjetofoto IN Foto.IdObjeto%TYPE, v_idobjetoalbum IN Foto.IdObjeto%TYPE) IS
  
    BEGIN
    
      SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
      
      -- remoção dos comentários da foto
      DELETE FROM Objeto WHERE IdObjeto IN (SELECT P.IdObjeto
                                                FROM Post P JOIN Comentario Com ON P.IdObjeto = Com.Post
                                                WHERE Com.IdObjeto = v_idobjetofoto);
                                                
      DELETE FROM Post WHERE IdObjeto IN (SELECT P.IdObjeto
                                                FROM Post P JOIN Comentario Com ON P.IdObjeto = Com.Post
                                                WHERE Com.IdObjeto = v_idobjetofoto);  
                                                
      DELETE FROM Comentario WHERE IdObjeto = v_idobjetofoto; 
      
      
      -- remoção da foto
      DELETE FROM Foto WHERE IdObjeto = v_idobjetofoto;  
      DELETE FROM Objeto WHERE IdObjeto = v_idobjetofoto;  
      
      
      -- atualiza o número de foto do álbum
      UPDATE Album SET NFotos = NFotos - 1 WHERE IdObjeto = v_idobjetoalbum; 
    
      COMMIT; 
      
      EXCEPTION          
          WHEN OTHERS THEN
            BEGIN
              ROLLBACK;  
              RAISE_APPLICATION_ERROR(-20000, SQLERRM);  
            END; 
    
    END removePhotoAlbum; 
    
    
    
    
  PROCEDURE insertCommentPhoto(v_idusuario IN Usuario.IdUsuario%TYPE, v_idalbum IN objeto.IdObjeto%TYPE, Conteudo IN Post.Conteudo%TYPE, LinkPost IN Post.LinkPost%TYPE) IS
  
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
        
    END insertCommentPhoto; 

END PackPhoto;