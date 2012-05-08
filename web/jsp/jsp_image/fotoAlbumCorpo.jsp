<%--
    Document   : fotoAlbum
    Created on : 22/11/2010, 19:11:27
    Author     : patricio
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.io.InputStream"%>
<%@page import="Model.Photo_t"%>
<%@page import="Controller.Inicial"%>
<%@page import="java.io.OutputStream"%>
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
             Integer id_foto = (Integer)request.getSession().getAttribute("IdFotoAlbumCorpo");

             if (id_foto != null) {
                 byte[] imgData = null;
                 OutputStream o = null;

                 try {
                    Inicial in = new Inicial();

                    imgData = in.callGetPhoto(id_foto.intValue());
                    response.setContentType("image/jpeg");
                    o = response.getOutputStream();
                    o.write(imgData);
                    o.flush();
                    o.close();
                    imgData = null;
                    id_foto = null;
                    request.getSession().setAttribute("IdFotoAlbumCorpo", null);
                }
                catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Erro de sei la o q <br><br>" + e.getMessage() + " " + e.getErrorCode());
                }
            }
            else {
                out.println("Erro");

            }

        %>
    </body>
</html>
