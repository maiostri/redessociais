<%-- 
    Document   : removePhotoAlbum
    Created on : 27/11/2010, 20:54:33
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
            String IdFoto = request.getParameter("IdFoto");
            String IdAlbum = request.getParameter("IdAlbum");

            try {
                Inicial.callRemovePhotoALbum((new Integer(IdFoto)).intValue(), (new Integer(IdAlbum)).intValue());
            }
            catch (Exception e) {
                e.printStackTrace();
       %>
           <script type="tetext/javascript">
                alert('Erro na remoção da foto'); 
           </script>
       <%

            }

            response.sendRedirect("albuns.jsp"); 

        %>

    </body>
</html>
