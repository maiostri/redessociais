<%-- 
    Document   : removerPost
    Created on : 27/11/2010, 22:16:50
    Author     : patricio
--%>

<%@page import="Controller.Inicial"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remover Post - Redes Sociais</title>
    </head>
    <body>

        <%
            String IdPost = request.getParameter("IdPost");

            try {
                Inicial.callRemovePost((new Integer(IdPost)).intValue()); 
            }
            catch (Exception e) {
                e.printStackTrace();
        %>
            <script type="tetext/javascript">
                alert('Erro na remoção do post')
            </script>
        <%
            }

            response.sendRedirect("posts.jsp");
        %>

    </body>
</html>
