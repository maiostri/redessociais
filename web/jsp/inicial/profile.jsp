<%@page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@page import="Controller.Inicial"%>
<%@page import="java.sql.*"%>
<%@page import="Model.User_t"%>
<%@page import="oracle.sql.ARRAY"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Perfil - Redes Sociais</title>
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
            <br/><br/><br/><br/>
            PERFIL
            <br/><br/><br/><br/>


            <%
                out.println("Nome: " + current_user.getNome() + "<br/>");
                out.println("Sobrenome: " + current_user.getSobrenome() + "<br/>");
                out.println("Data de Nascimento: " + current_user.getDataNasc() + "       ");
                out.println("Idade: " + "" + "<br/>");
                out.println("Sexo: ");
                if (current_user.getSexo().equals("M"))
                    out.println("Masculino");
                else
                    out.println("Feminino");
                out.println("<br/>" + "Cidade Atual: " + current_user.getCidadeAtual() + "<br/>");
                out.println("Pais Atual: " + current_user.getPaisAtual() + "<br/>");
                out.println("Cidade Origem: " + current_user.getCidadeOrigem() + "<br/>");
                out.println("Pais Origem: " + current_user.getPaisOrigem() + "<br/>");
                out.println("URL: " + current_user.getURL() + "<br/>");
                out.println("Telefones: " + "<br/>");
                String[] tels = (String[])current_user.getTelefones().getArray(); 
                for (String t : tels) {
                    out.println(t + "<br/>"); 
                }
                out.println("Emails: " + "<br/>");
                String[] ems = (String[])current_user.getEmails().getArray();
                for (String e: ems) {
                    out.println(e + "<br/>"); 
                }
            %>

            <br/><br/><a href="updateDataUser.jsp">Atualizar Informações</a>
        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>