<%@page import="Model.Comment_t"%>
<%@page import="Model.Photo_t"%>
<%@page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@page import="Model.Initial_Community_t"%>
<%@page import="Model.Friend_t"%>
<%@page import="Controller.Inicial"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="Model.User_t"%>
<%@page import="Model.Post_t"%>
<%@page import="oracle.sql.ARRAY"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Álbuns - Redes Sociais</title>
<style type="text/css">
<!--
@import url("css/home.css");
-->
</style>
</head>

<body>

    <%
            Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");
            User_t current_user = (User_t)request.getSession().getAttribute("User");
    %>

    <div id="logo">
        
    </div>
    <div id="buttons">
        <a href="profile.jsp" id="bperfil">Perfil</a>
        <a href="home.jsp" id="batualizacoes">Atualizações</a>
        <a href="posts.jsp" id="bposts">Posts</a>
        <a href="albuns.jsp" id="balbuns">Álbuns</a>
        <a href="Configuracoes.jsp" id="bconfiguracoes">Configurações</a>
        <a href="comunidades.jsp" id="bcomunidades">Comunidades</a>
        <a href="groups.jsp" id="bgrupos">Grupos</a>
        <a href="logout.jsp " id="bsair">Sair</a>
    </div>
    <div id="main">
    	<div id="left">
                <p align="center">
                    <img alt="" src="../jsp_image/imageProfile.jsp" width="190" border="0"/>
                    Bem-vindo <%= current_user.getNome() + " " + current_user.getSobrenome() %>
                </p>
        </div>
                <div id="posts">

            <%

                String NomeAlbum = (String)request.getSession().getAttribute("NomeAlbum");
                Integer IdAlbum = (Integer)request.getSession().getAttribute("IdAlbum");                

                Object[] photos = null;
                Object[] comments = null; 
                Photo_t p = null;
                String Ind = null;
                String Flag = null; 

                int ind = 0; 

                try {
                    Inicial in = new Inicial();

                    photos = in.callGetPhotosAlbum(IdAlbum.intValue());

                    Flag = request.getParameter("Flag");

                    if (((Flag != null))) {
                      Ind = request.getParameter("Ind"); 

                      ind = (new Integer(Ind)).intValue(); 
                      if ((Flag.equals("1")) && (ind < (photos.length - 1)))
                          ind++;
                      else if ((Flag.equals("0")) && (ind > 0)) 
                          ind--;
                    }

                    Flag = null;
                    Ind = null; 

                    p = (Photo_t)photos[ind];
                    request.getSession().setAttribute("IdFotoAlbumCorpo", new Integer(p.getIdObjeto()));

                    comments = in.callGetCommentAlbum(p.getIdObjeto()); 

                }
                catch (Exception e) {
                    
                }

                out.println("<br><br><br>Nome Álbum: " + NomeAlbum + "<br><br>");
                out.println("<br><br><br>Foto " + (ind + 1) + " de " + photos.length + "<br><br><br>");

            %>

            <img alt="" src="../jsp_image/fotoAlbumCorpo.jsp" width="200" border="0"/>

            <%

                out.println("<br><br>Nome da foto: " + p.getArquivo());
                out.println("<br><br>Descrição: " + p.getDescricao());
                out.println("<br><br>Comentários: (" + comments.length + " comentários)");
                for (int i = 0; i < comments.length; i++) {
                    Comment_t c = (Comment_t)comments[i];
                    out.println("<br><br>" + c.getNick() + ": " + c.getComm()); 
                }

            %>

            
            <br/><br/><br/><br/>
            <a href="corpoAlbum.jsp?Flag=0&Ind=<%=ind%>">Anterior</a><br/>
            <a href="corpoAlbum.jsp?Flag=1&Ind=<%=ind%>">Próximo</a>
            
            <br/><br/><br/><br/> 
            <a href="removePhotoAlbum.jsp?IdFoto=<%=p.getIdObjeto()%>&IdAlbum=<%=IdAlbum.intValue()%>">Remover esta Foto</a>

            <br/><br/><br/><br/>
            <a href="addcomentarioalbum.jsp?IdObjeto=<%=p.getIdObjeto()%>">Comentar esta Foto</a><br/>

            <br/><br/><br/><br/>
            <a href="albuns.jsp">Voltar para Álbuns</a>

        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>
