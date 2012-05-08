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
<title>Home (Atualizações) - Redes Sociais</title>
<style type="text/css">
<!--
@import url("css/home.css");
-->
</style>
</head>

<body>

    <%
            java.util.Date Data = new java.util.Date();
            String DataIn = Data.getDate() + "/" + (Data.getMonth() + 1) + "/" + (Data.getYear() + 1900) + " " + Data.getHours() + ":" + Data.getMinutes() + ":" + Data.getSeconds();

            request.getSession().setAttribute("DataIn", DataIn); 

            Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");
            User_t current_user = new User_t();

            //ajusta os parâmetros da sessão
            request.getSession().setAttribute("idusuario", v_idusuario); 

            if(request.getSession().getAttribute("idusuario") == null) {
                response.sendRedirect("../../index.jsp");
            }
            else {

                try {
                    Inicial in = new Inicial();

                    current_user = in.callConsultDataInitial(v_idusuario.intValue());
                }
                catch (SQLException se) {
                    out.println("Code: " + se.getErrorCode() + " Mensagem: " + se.getMessage());
                    se.printStackTrace();
        %>
                        <script type="text/javascript">
                            alert('Erro SQL página inicial')
                            document.location.href = '../../index.jsp'
                        </script>
        <%
                }
                catch (Exception e) {
                    out.println("Mensagem: " + e.getMessage());
                    e.printStackTrace();
        %>
                        <script type="text/javascript">
                            alert('Erro página inicial')
                            document.location.href = '../../index.jsp'
                        </script>
        <%
                }

                request.getSession().setAttribute("User", current_user);
            }
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
            <br/><br/><br/><br/>
            ATUALIZAÇÕES
            <br/><br/><br/><br/>

            <%
                Object[] updates;

                  try {
                    Inicial in = new Inicial();

                    updates = in.callGetUpdates(v_idusuario.intValue());

                    for (int i = 0; i < updates.length; i++) {
                        String temp = (String)updates[i];

                        out.println("<br/><br/>" + temp);
                    }
                }
                catch (SQLException se) {
                    se.printStackTrace();
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
