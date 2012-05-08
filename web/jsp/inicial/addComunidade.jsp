<%@page import="Inicial.User"%>
<%@page import="Model.Community_t"%>
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
<title>Criar Comunidade - Redes Sociais</title>
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

            <form action="insertComunidade.jsp">
                <br/><br/>
                <input type="hidden" name="IdDono" id="IdDono" value="<%=v_idusuario.intValue()%>"/>
                Nome da Comunidade <input type="text" name="NomeComunidade" id="NomeComunidade"/><br/><br/>
                Categoria <input type="text" name="Categoria" id="Categoria"/><br/><br/>
                Descrição  <textarea rows="10" cols="40" name="Descricao" id="Descricao"></textarea><br/><br/>
                <input type="submit" value="Criar"/> 
            </form>

        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>
