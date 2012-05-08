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

            <br/><br/><br/>
            COMUNIDADES QUE SOU DONO
            <br/><br/><br/>

            <%
                Object[] comunidades = null;
                Community_t temp = null; 

                try {
                    comunidades = Inicial.callGetCommunities(v_idusuario.intValue());

                    for (int i = 0; i < comunidades.length; i++) {
                        temp = (Community_t)comunidades[i];  
           %>

                        <a href="corpoComunidade.jsp?IdDono=<%=temp.getIdDono()%>&NomeComunidade=<%=temp.getNome()%>&Descricao=<%=temp.getDescricao()%>&NMembros=<%=temp.getNMembros()%>&DataCriacao=<%=temp.getDataCriacao()%>&Categoria=<%=temp.getCategoria()%>"><%=temp.getNome()%></a>
                        <a href="alterarDadosComunidade.jsp?IdDono=<%=temp.getIdDono()%>&NomeComunidade=<%=temp.getNome()%>&Descricao=<%=temp.getDescricao()%>&Categoria=<%=temp.getCategoria()%>">Alterar Dados</a>
                        <a href="removeComunidade.jsp?IdDono=<%=temp.getIdDono()%>&NomeComunidade=<%=temp.getNome()%>">Excluir</a>

           <%
                        out.println("<br/><br/>");
                    }
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            %>

            <br/><br/>
            <a href="addComunidade.jsp">Criar Comunidade</a>


            <br/><br/><br/>
            COMUNIDADES QUE PARTICIPO
            <br/><br/><br/>


            <%
                Object[] comunidadesP = null;
                Community_t tempP = null;

                try {
                    comunidadesP = Inicial.callGetCommunitiesP(v_idusuario.intValue());

                    for (int i = 0; i < comunidadesP.length; i++) {
                        tempP = (Community_t)comunidadesP[i];
           %>

                        <a href="corpoComunidade.jsp?IdDono=<%=tempP.getIdDono()%>&NomeComunidade=<%=tempP.getNome()%>&Descricao=<%=tempP.getDescricao()%>&NMembros=<%=tempP.getNMembros()%>&DataCriacao=<%=tempP.getDataCriacao()%>&Categoria=<%=tempP.getCategoria()%>"><%=tempP.getNome()%></a>                        
                        <a href="sairComunidade.jsp?IdDono=<%=tempP.getIdDono()%>&NomeComunidade=<%=tempP.getNome()%>&IdUsuario=<%=v_idusuario.intValue()%>">Deixar de participar</a>

           <%
                        out.println("<br/><br/>");
                    }
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            %>

        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>
