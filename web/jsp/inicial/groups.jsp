<%-- 
    Document   : groups
    Created on : Nov 20, 2010, 12:48:22 AM
    Author     : ricardo
--%>
<%@page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@page import="Controller.Inicial"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="Model.User_t"%>
<%@page import="Model.Group_t"%>
<%@page import="oracle.sql.ARRAY"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
 <style type="text/css">
<!--
@import url("css/home.css");
-->
</style>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupos dos Amigos - Redes Sociais</title>
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
        <a href="" id="balbuns">Álbuns</a>
        <a href="" id="bconfiguracoes">Configurações</a>
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

            <br/>

            <%

                int[] amigos;


                Object[] groups = null;

                try {
                    Inicial in = new Inicial();

                    groups = in.callGetGroups(v_idusuario.intValue());
                    
                    amigos = new int[groups.length];

                    for (int i = 0; i < groups.length; i++) {
                        Group_t temp = (Group_t)groups[i];

                        out.println("<br>" + temp.getNome() + " "+ temp.getSobrenome() + "         Grupo: " + temp.getGrupo());

                        Integer aux = new Integer(temp.getId_usuario());

                        amigos[i] = aux;

               %>
               <a href="changegroup.jsp?amigo=<%=amigos[i]%>" id="" onclick=""> Mudar Grupo</a>
               <a href="removeFriend.jsp?amigo=<%=amigos[i]%>" id="" onclick="" >Remover Amizade</a>
                    
               <%

                    }
                }
                catch (SQLException se) {
                    se.printStackTrace();
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
                


            %>
            <br>
            <a href="createGroup.jsp" id="" onclick="">Criar Grupo</a>

        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>