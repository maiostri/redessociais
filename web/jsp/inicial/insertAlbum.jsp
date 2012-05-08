<%-- 
    Document   : insertAlbum
    Created on : 26/11/2010, 16:24:11
    Author     : patricio
--%>

<%@page import="Controller.Inicial"%>
<%@page import="java.sql.SQLException"%>
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

            String Nome = request.getParameter("Nome");
            String Local = request.getParameter("Local");
            Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");

            try {
                Inicial.callInsertAlbum(v_idusuario.intValue(), Nome, Local); 
            }
            catch (SQLException se) {
                se.printStackTrace();

        %>

        <script type="text/javascript">
            alert('Erro na inserçaõ do álbum')
            document.location.href = 'albuns.jsp'
        </script>

        <%

            }

            response.sendRedirect("albuns.jsp"); 

        %> 

    </body>
</html>
