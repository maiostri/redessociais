<%@page import="Model.User_t"%>
<%@page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Comentar Post - Redes Sociais</title>
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
                    Bem-vindo <%= current_user.getNome() + " " + current_user.getSobrenome() %>
                </p>
        </div>
        <div id="posts">

                    <%
                        String IdObjeto = request.getParameter("IdObjeto");
                        Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");
                    %>

                    <form action="insertCommentPost.jsp">
                        <input type="hidden" value="<%=(new Integer(IdObjeto)).intValue()%>" name="IdObjeto" id="IdObjeto"/>
                        <input type="hidden" value="<%=v_idusuario.intValue()%>" name="IdUsuario" id="IdUsuario"/>
                        Conteúdo do Comentário <textarea cols="40" rows="10" name="Conteudo" id="Conteudo"></textarea> <br/><br/>
                        Link <input type="text" name="LinkPost" id="LinkPost"/><br/><br/>
                        <input type="submit" value="Comentar"/>
                    </form>

        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>