create or replace
package PackInicialPage is

 procedure insertphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type);
 
 procedure getphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type); 
 
 PROCEDURE getUpdates(v_idusuario IN usuario.idusuario%type, v_updates OUT updates);  
 
end PackInicialPage;
/
create or replace
package body PackInicialPage as

  procedure insertphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type) is
    begin
      select u.foto into photo from usuario u where u.idusuario = iduser for update;
    end insertphoto;
    
  procedure getphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type) is
    begin
      select u.foto into photo from usuario u where u.idusuario = iduser; 
    end; 
    
  PROCEDURE getUpdates(v_idusuario IN usuario.idusuario%type, v_updates OUT updates) IS 
  
    type temp is table of date; 
    
    t1 temp := temp(); 
  
    BEGIN
      
      SELECT DISTINCT UP.mensagem, UP.datahoraatualizacao
        BULK COLLECT INTO v_updates, t1 
        FROM Atualizacoes UP 
        WHERE (((v_idusuario = UP.IdDonoAtualizacao OR v_idusuario = UP.IdAmizade) OR 
            UP.IdDonoAtualizacao
              IN (SELECT DISTINCT U.idusuario
                    FROM Usuario U JOIN Amizade AM ON (AM.destinatario = v_idusuario OR AM.remetente = v_idusuario) AND U.idusuario IN (AM.destinatario, AM.remetente) JOIN Conta Co ON Co.idusuario = U.idusuario 
                     WHERE U.idusuario <> v_idusuario) OR
            UP.IdAmizade
                  IN (SELECT DISTINCT U.idusuario
                    FROM Usuario U JOIN Amizade AM ON (AM.destinatario = v_idusuario OR AM.remetente = v_idusuario) AND U.idusuario IN (AM.destinatario, AM.remetente) JOIN Conta Co ON Co.idusuario = U.idusuario 
                     WHERE U.idusuario <> v_idusuario)) AND ((SYSDATE - UP.datahoraatualizacao) <= 7))
        ORDER BY UP.DATAHORAATUALIZACAO DESC; 
    END; 
  
  
end PackInicialPage;