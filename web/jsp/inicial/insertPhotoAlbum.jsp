<%-- 
    Document   : insertPhotoAlbum
    Created on : 27/11/2010, 20:27:37
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

            String IdUsuario = request.getParameter("IdUsuario");
            String IdAlbum = request.getParameter("IdAlbum");
            String Arquivo = request.getParameter("foto");
            String Descricao = request.getParameter("descricao");

            try {
                Inicial.callInsertPhotoAlbum((new Integer(IdUsuario)).intValue(), (new Integer(IdAlbum)).intValue(), Arquivo, Descricao);
            }
            catch (SQLException se) {
                se.printStackTrace();

                if (se.getErrorCode() == 20001) {
        %>
                    <script type="text/javascript">
                        alert('Capacidade máxima atingida')
                    </script>
        <%
                }
                else {
        %>
                    <script type="text/javascript">
                        alert('Erro na inserção da Foto')
                    </script>
        <%
                }

            }
            catch (Exception e) {
                e.printStackTrace();

        %>
            <script type="text/javascript">
                alert('Erro na inserção da Foto')
            </script>
        <%

            }


            response.sendRedirect("albuns.jsp"); 

        %>
    </body>
</html>
