<%--
    Document   : Configuracoes
    Created on : 19/11/2010, 13:40:08
    Author     : patricio
--%>

<%@page import="Controller.Inicial"%>
<%@page import="Model.Logs_t"%>
<%@page import="Model.User_t"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Logs de Entrada/Saída - Redes Sociais</title>
<style type="text/css">
<!--
@import url("css/home.css");
-->
</style>
</head>

<body>

    <%
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
                    Bem-vindo <%= current_user.getNome() + " " + current_user.getSobrenome()  %>
                </p>
        </div>
        <div id="posts">

            <%
                Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");

                Object[] LogEntrada = null;
                Object[] LogSaida = null;
                Logs_t l = null;

                try {
                    l = Inicial.callGetLogs(v_idusuario.intValue());
                }
                catch (Exception e) {
                    e.printStackTrace();
                }

                out.println("<br/><br/><br/>LOGS DE ENTRADA E SAÍDA<br/><br/>");

                LogEntrada = (Object[])l.getLogEntrada().getArray();
                LogSaida = (Object[])l.getLogSaida().getArray();

                for (int i = 0; i < LogEntrada.length; i++) {
                    String t1 = (String)LogEntrada[i];
                    String t2 = (String)LogSaida[i]; 
                    out.println("Entrada: " + t1 + "   Saída: " + t2 + "<br/><br/>");
                }
            %> 

            <br/><br/><a href="Configuracoes.jsp">Voltar</a>

        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>