<%-- 
    Document   : insertComunidade
    Created on : 30/11/2010, 01:00:42
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
             String IdDono = request.getParameter("IdDono");
             String NomeComunidade = request.getParameter("NomeComunidade");
             String Descricao = request.getParameter("Descricao");
             String Categoria = request.getParameter("Categoria");

             try {
                Inicial.callInsertCommunity((new Integer(IdDono)).intValue(), NomeComunidade, Descricao, Categoria);
             }
             catch (Exception e) {
                e.printStackTrace();
             }

             response.sendRedirect("comunidades.jsp");  
             
        %> 
    </body>
</html>
