<%-- 
    Document   : teste
    Created on : 08/11/2010, 21:32:24
    Author     : patricio
--%>

<%@page import="Controller.Inicial"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="Inicial.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <body>

        <%

        Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");

        byte[] imgData = null;
        OutputStream o = null;


        String pathPhoto = request.getParameter("foto");

        try {
            Inicial i = new Inicial();

            i.callInsertPhotoProfile(v_idusuario, pathPhoto);
        }
        catch (Exception e) {
            out.println(pathPhoto);
            out.println(e.getMessage());
            e.printStackTrace();
        }

        try {
            Inicial i = new Inicial();

            imgData = i.callGetPhotoProfile(v_idusuario.intValue());
            response.setContentType("image/gif");
            o = response.getOutputStream();
            o.write(imgData);
            o.flush();
            o.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        %>

        <script type="text/javascript">
            //alert('Informações atualizadas com sucesso')
            document.location.href = 'home.jsp'
        </script>
        
    </body>



</html>
