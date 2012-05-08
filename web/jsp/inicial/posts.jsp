<%-- 
    Document   : posts
    Created on : 18/11/2010, 03:22:54
    Author     : patricio
--%>

<%@page import="Model.Comment_t"%>
<%@page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
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
<title>Posts - Redes Sociais</title>
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

            <br/><br/><br/><br/>
            POSTS
            <br/><br/><br/><br/>

            <%
                Object[] posts = null;
                Object[] comments = null;

                try {
                    Inicial in = new Inicial();

                    posts = in.callGetPosts(v_idusuario.intValue());




                    for (int i = 0; i < posts.length; i++) {
                        Post_t temp = (Post_t)posts[i];
                        out.println("<br/><br/> " + temp.getConteudo());

                     %>

                        <a href="removerPost.jsp?IdPost=<%=temp.getIdObjeto()%>">Remover Post</a>
                        <a href="addcomentariopost.jsp?IdObjeto=<%=temp.getIdObjeto()%>">Comentar Post</a>

                     <%




                        comments =  in.callgetCommentPost(temp.getIdObjeto());
                        for (int j = 0; j < comments.length; j++) {
                            Comment_t temp2 = (Comment_t)comments[j];
                            out.println("<br/><br/>         " + temp2.getNick()+ ": "+ temp2.getComm());
                        }
             
                        out.println("<br/><br/>");
                    }
                }
                catch (SQLException se) {
                    se.printStackTrace();
                }
                catch (Exception e) {
                    e.printStackTrace();
                }


            %>

            <br/><br/><br/>
            <a href="addPost.jsp?IdUsuario=<%=v_idusuario.intValue()%>">Adicionar Post</a>

        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>