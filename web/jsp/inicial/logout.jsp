<%-- 
    Document   : logout
    Created on : 30/11/2010, 14:06:21
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
            String DataIn = (String)request.getSession().getAttribute("DataIn");
            Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");

            try {
                Inicial.callLog(v_idusuario.intValue(), DataIn);
            }
            catch (Exception e) {
                e.printStackTrace();
            }

            request.getSession().invalidate(); 
            response.sendRedirect("../../index.jsp"); 
        %>

    </body>
</html>
