<%-- 
    Document   : removeAlbum
    Created on : 26/11/2010, 17:26:15
    Author     : patricio
--%>

<%@page import="java.sql.SQLException"%>
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

            String IdAlbum = request.getParameter("IdAlbum");

            try {
                Inicial.callRemoveAlbum((new Integer(IdAlbum).intValue())); 
            }
            catch (SQLException se) {
                se.printStackTrace();

        %>

            <script type="text/javascript">
                alert('Erro na inserção do álbum')
            </script>

        <%
            }

            response.sendRedirect("albuns.jsp");

        %>
    </body>
</html>
