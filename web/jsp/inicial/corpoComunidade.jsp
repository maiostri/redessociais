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
<title>Comunidades - Redes Sociais</title>
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
                String IdDonoCom = request.getParameter("IdDono");
                String NomeComunidade = request.getParameter("NomeComunidade");
                String Descricao = request.getParameter("Descricao");
                String Categoria = request.getParameter("Categoria");
                String NMembros = request.getParameter("NMembros");
                String DataCriacao = request.getParameter("DataCriacao");


                out.println("<br/><br/>");
                out.println("Nome da Comunidade: " + NomeComunidade + "<br/><br/>");
                out.println("Dono da Comunidade: " + User.getNick((new Integer(IdDonoCom)).intValue()) + "<br/><br/>");
                out.println("Descrição: " + Descricao + "<br/><br/>");
                out.println("Categoria: " + Categoria + "<br/><br/>");
                out.println("Data de Criação: " + DataCriacao + "<br/><br/><br/>");
                out.println("Membros (" + NMembros + ") <br/><br/>");


                Object[] users = null;
                User_t temp = null;

                try {
                    users = Inicial.callGetUsersCommunities((new Integer(IdDonoCom)).intValue(), NomeComunidade);
                }
                catch (Exception e) {
                    e.printStackTrace();
                }

                for (int i = 0; i < users.length; i++) {
                    temp = (User_t)users[i];
                    out.println(User.getNick(temp.getIdUsuario()) + "  (" + temp.getNome() + " " + temp.getSobrenome() + ")<br/><br/>");
                }

                //mostrar os objetos da comunidade (fotos, comentários (posts))

            %>


            <br/><br/><br/>
            <a href="comunidades.jsp">Voltar</a>

        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>
