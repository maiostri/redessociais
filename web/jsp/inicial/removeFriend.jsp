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
        <title>Posts - Rede Social</title>
    </head>
    <body>

    <%
            int amigo = (new Integer(request.getParameter("amigo"))).intValue();
            Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");
            User_t current_user = (User_t)request.getSession().getAttribute("User");
    %>

    <div id="logo">
        <a href="logout.jsp">Sair</a>
    </div>
    <div id="buttons">
        <a href="profile.jsp" id="bperfil">Perfil</a>
        <a href="home.jsp" id="batualizacoes">Atualizações</a>
        <a href="posts.jsp" id="bposts">Posts</a>
        <a href="" id="balbuns">Álbuns</a>
        <a href="" id="bconfiguracoes">Configurações</a>
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

            try {
            Inicial in = new Inicial();
            in.callRemoveFriend(v_idusuario, amigo);

            }
            catch (SQLException se) {
                 se.printStackTrace();
            }
            catch (Exception e) {
                    e.printStackTrace();
            }
            response.sendRedirect("groups.jsp");

            %>

        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html