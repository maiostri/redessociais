<%-- 
    Document   : removeComunidade
    Created on : 30/11/2010, 01:47:02
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

            String IdDonoCom = request.getParameter("IdDono");
            String NomeComunidade = request.getParameter("NomeComunidade");

            try {
                Inicial.callRemoveCommunity((new Integer(IdDonoCom)).intValue(), NomeComunidade); 
            }
            catch (Exception e) {
                e.printStackTrace(); 
            }

            response.sendRedirect("comunidades.jsp"); 
        %>
    </body>
</html>
