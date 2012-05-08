<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="Model.Photo_t"%>
<%@page import="java.util.Random"%>
<%@page import="Model.Comment_t"%>
<%@page import="Model.Album_t"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Controller.Inicial"%>
<%@page import="Model.User_t"%>
<%@page contentType="text/html; charset=utf-8" language="java" errorPage=""%> 
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

            <br/><br/>
            ÁLBUNS
            <br/><br/>

            <%
                Object[] albums = null;
                Object[] comments = null;
                Object[] photos = null;
                String Flag = null;
                String Ind = null;
                Album_t temp = null; 

                int nro_comments_fotos = 0;

                int ind = 0;

                

                try {
                    Inicial in = new Inicial();

                    albums = in.callGetAlbums(v_idusuario.intValue());

                    Flag = request.getParameter("Flag");

                    if (Flag != null) {
                        Ind = request.getParameter("Ind");
                        ind = (new Integer(Ind)).intValue(); 
                        if (Flag.equals("1") && (ind < (albums.length - 1)))
                            ind++;
                        else if (Flag.equals("0") && (ind > 0))
                            ind--;
                    }
                    Flag = null;
                    Ind = null; 

                    if (albums.length > 0) {
                        temp = (Album_t)albums[ind];

                        out.println("<br><br>" + (ind + 1) + " de " +  albums.length + " Álbuns<br><br>");

             %>

                <a href="corpoAlbum.jsp"><img alt="" src="../jsp_image/fotoAlbum.jsp" width="200" border="0"/></a>

             <%

                    
                        comments = in.callGetCommentAlbum(temp.getIdObjeto());
                        photos = in.callGetPhotosAlbum(temp.getIdObjeto());
                        nro_comments_fotos = in.callGetNCommentsAlbum(temp.getIdObjeto());

                        Integer id_foto = null;
                        Photo_t t = null;
                        if (photos.length > 0) {
                            //foto do álbum a ser impressa
                            Random r = new Random();
                            int indt = r.nextInt(photos.length);
                            t = (Photo_t)photos[indt];
                            id_foto = new Integer(t.getIdObjeto());
                        }

                        request.getSession().setAttribute("IdFotoAlbum", id_foto);


                        out.println("<br><br> Nome do Álbum: " + temp.getNome());
                        out.println("<br><br> Local: " + temp.getLocalAlbum());
                        out.println("<br><br>" + comments.length + " comentários sobre o álbum");
                        for (int i = 0; i < comments.length; i++) {
                            Comment_t temp2 = (Comment_t)comments[i];
                            out.println("<br>     " + temp2.getNick() + ": " + temp2.getComm());
                        }
                        out.println("<br><br>Há " + photos.length + " fotos neste álbum");
                        out.println("<br><br>" + nro_comments_fotos + " comentários sobre as fotos");
                        out.println("<br><br><br>");

                        request.getSession().setAttribute("NomeAlbum", temp.getNome());
                        request.getSession().setAttribute("IdAlbum", new Integer(temp.getIdObjeto()));
                    }
                    else {
                        out.println("<br/><br/><br/>");
                        out.println("NÃO HÁ ALBUNS");
                        out.println("<br/><br/><br/>");
                    }
                }
                                
                catch (Exception e) {                   
                    e.printStackTrace();
                }

                if (albums.length > 0) {

            %>
                    <br/><br/><br/><br/>
                    <a href="albuns.jsp?Flag=0&Ind=<%=ind%>">Anterior</a><br/>
                    <a href="albuns.jsp?Flag=1&Ind=<%=ind%>">Próximo</a>

                    <br/><br/><br/><br/>
                    <a href="addPhotoAlbum.jsp?IdAlbum=<%=temp.getIdObjeto()%>&IdUsuario=<%=v_idusuario.intValue()%>">Adicionar uma Foto a este álbum</a><br/>
                    <a href="addcomentarioalbum.jsp?IdObjeto=<%=temp.getIdObjeto()%>">Comentar este Álbum</a><br/>

                    <br/><br/><br/><br/>
                    <a href="removeAlbum.jsp?IdAlbum=<%=temp.getIdObjeto()%>">Remover este Álbum</a><br/>

            <%
                }
            %>


            <a href="createAlbum.jsp">Criar Novo Álbum</a><br/>

        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>
