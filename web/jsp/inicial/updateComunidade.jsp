<%-- 
    Document   : updateComunidade
    Created on : 30/11/2010, 00:01:03
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
            String IdDonoCom = request.getParameter("IdDono");
            String NomeComunidade = request.getParameter("NomeComunidade");
            String Descricao = request.getParameter("Descricao");
            String Categoria = request.getParameter("Categoria");            

            try {
                Inicial.callUpdateCommunity((new Integer(IdDonoCom)).intValue(), NomeComunidade, Descricao, Categoria); 
            }
            catch (SQLException e) {
                e.printStackTrace();
         %>
         <script type="text/javascript">
             alert('Erro na atualização do álbum')
         </script>
         <%
            }

            response.sendRedirect("comunidades.jsp");
        %>
    </body>
</html>
