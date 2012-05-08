<%-- 
    Document   : imageProfile
    Created on : 19/11/2010, 16:15:50
    Author     : patricio
--%>

<%@page import="java.io.OutputStream"%>
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
             byte[] imgData = null;
             OutputStream o = null;

             try {
                Inicial i = new Inicial();

                imgData = i.callGetPhotoProfile(v_idusuario.intValue());

                if (imgData == null) imgData = null; 

                response.setContentType("image/jpeg");
                o = response.getOutputStream();                
                o.write(imgData);
                o.flush();
                o.close();
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
