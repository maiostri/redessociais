<%-- 
    Document   : insertPost
    Created on : 27/11/2010, 21:56:23
    Author     : patricio
--%>

<%@page import="Controller.Inicial"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>

        <%
            String IdUsuario = request.getParameter("IdUsuario");
            String Conteudo = request.getParameter("Conteudo");
            String LinkPost = request.getParameter("LinkPost");

            try {
                Inicial.callInsertPost((new Integer(IdUsuario)).intValue(), LinkPost, Conteudo); 
            }
            catch (Exception e) {
                e.printStackTrace();

        %>
            <script type="tetext/javascript">
                alert('Erro na inserção do Post')
            </script>
        <%

            }

            response.sendRedirect("posts.jsp"); 
        %> 

    </body>
</html>
