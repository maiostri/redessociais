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
            Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");
            int amigo = (new Integer(request.getParameter("amigo"))).intValue();
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

              <form action="cgroup.jsp" >

            <%                
                Object[] groups = null;
                try {
                    Inicial in = new Inicial();

                   groups = in.callGetGroupsUser(v_idusuario.intValue());


                   out.println("Grupos");
                   out.println("<select name=\"Grupos\" id=\"Grupos\">");
                   for (int i = 0; i < groups.length; i++) {
                        String temp = (String)groups[i];
                        out.println("<option value=\"" + temp+ "\" >" + temp + "</option>");
                    }
                   out.println("</select>");
              }
                catch (SQLException se) {
                    se.printStackTrace();
                }
                catch (Exception e) {
                    e.printStackTrace();
                }

              request.getSession().setAttribute("friend", amigo);

              %>
              <input type="submit" value="Confirmar" name="Confirmar" />
              </form>

<%--

              <--<%=in.callChangeGroup(v_idusuario, amigo, ) -->


--%>
        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>