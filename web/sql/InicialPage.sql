create or replace package inicialpage is

 procedure insertphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type);
 
 procedure getphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type); 
 
end inicialpage;

/

create or replace package body inicialpage as

  procedure insertphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type) is
    begin
      select u.foto into photo from usuario u where u.idusuario = iduser for update;
    end insertphoto;
    
  procedure getphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type) is
    begin
      select u.foto into photo from usuario u where u.idusuario = iduser; 
    end; 

end inicialpage;