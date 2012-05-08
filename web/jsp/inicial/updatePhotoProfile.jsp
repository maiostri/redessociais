<%-- 
    Document   : updatePhotoProfile
    Created on : 19/11/2010, 16:20:08
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

        Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");

        String pathPhoto = request.getParameter("foto");

        try {
            Inicial i = new Inicial();

            i.callInsertPhotoProfile(v_idusuario, "/home/ricardo/" + pathPhoto);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("home.jsp");
        %> 
    </body>
</html>
