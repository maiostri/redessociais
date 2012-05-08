<%-- 
    Document   : sairComunidade
    Created on : 02/12/2010, 11:31:13
    Author     : patricio
--%>

<%@page import="Controller.Inicial"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <%

            String IdDonoCom = request.getParameter("IdDono");
            String NomeComunidade = request.getParameter("NomeComunidade");
            String IdUsuario = request.getParameter("IdUsuario");

            try {
                Inicial.callExitCommunity((new Integer(IdUsuario)).intValue(), (new Integer(IdDonoCom)).intValue(), NomeComunidade);
            }
            catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect("comunidades.jsp");
        %>
    </body>
</html>
