create or replace
package inicialpage is

 procedure insertphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type);
 
 procedure getphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type); 
 
 procedure getpost(v_idusuario IN usuario.idusuario%type, postes OUT posts);
 
end inicialpage;

/

create or replace
package body inicialpage as

  procedure insertphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type) is
    begin
      select u.foto into photo from usuario u where u.idusuario = iduser for update;
    end insertphoto;
    
  procedure getphoto(iduser IN usuario.idusuario%type, photo OUT usuario.foto%type) is
    begin
      select u.foto into photo from usuario u where u.idusuario = iduser; 
    end; 
    
  procedure getpost(v_idusuario IN usuario.idusuario%type, postes OUT posts) is
    begin
    
    select posts.nickcriador, posts.conteudo, con.nick as nickcomentario ,co.remetente, co.post,o.idobjeto, p.conteudo as coment, o.datacriacao
    into post_t.nickcriador,
  .conteudo,    
  postes.nickcomentario, 
  postes.remetente, 
  postes.post,   
  postes.idobjeto,  
  postes.coment,    
  postes.datacriacao  
       
    
    from
    (select distinct o.idobjeto as objeto, po.conteudo as conteudo, con.nick as nickcriador, o.idusuario
        from objeto o join post po on (o.idobjeto = po.idobjeto) join conta con on (o.idusuario = con.idusuario)
        where o.idusuario = v_idusuario  and o.idobjeto not in (select co.post from comentario co where co.remetente = v_idusuario)) posts
      join objeto o on (posts.objeto = o.idobjeto) left join comentario co on (co.idobjeto = posts.objeto) left join post p on (co.post = p.idobjeto)
    left join conta con on (co.remetente = con.idusuario) where (sysdate - o.datacriacao) <= 7 
    order by o.datacriacao DESC;    

    EXCEPTION 
      WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000, 'Usuário não existe ou nunca fez um post'); 
      WHEN SUBSCRIPT_BEYOND_COUNT THEN RAISE_APPLICATION_ERROR(-20001, 'Elemento não existe'); 
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro: c¿digo: ' || SQLCODE || ' mensagem: ' || SQLERRM); 

    end;   
end inicialpage;
