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
        <title>Criar grupo - Rede Social</title>
    </head>
    <body>

    <%
            Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");
            User_t current_user = (User_t)request.getSession().getAttribute("User");
    %>

      <script type="text/javascript">
            function validateData(){
                //verifica se algum campo obrigatório é não nulo. Caso seja,
                //a submissão não ocorre e uma mensagem de erro é enviada
                var Grupo = document.getElementById('Nome').value

                if (Grupo == '') {
                    alert('Campo obrigatório não preenchido')
                    return false
                }

                return true
            }
        </script>


    <div id="logo">
        
    </div>
    <div id="buttons">
        <a href="profile.jsp" id="bperfil">Perfil</a>
        <a href="home.jsp" id="batualizacoes">Atualizações</a>
        <a href="posts.jsp" id="bposts">Posts</a>
        <a href="" id="balbuns">Álbuns</a>
        <a href="" id="bconfiguracoes">Configurações</a>
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
            <form action="insertGroup.jsp" onSubmit="return validateData()">
                Nome <input type="text" name="Nome" id="Nome" value="" size="50" /> <br/>
                Visualização <select name="Visualizacao" id="Visualizacao">
                <option value="V">Visualização</option>
                <option value="C">Comentar</option>
                </select> 
                <input type="submit" value="Criar grupo" name="CriarConta" />
            </form>

        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>