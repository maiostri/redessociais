<%-- 
    Document   : insertCommentAlbum
    Created on : 26/11/2010, 19:38:06
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
            String IdUsuario = request.getParameter("IdUsuario");
            String IdObjeto = request.getParameter("IdObjeto");
            String Conteudo = request.getParameter("Conteudo");
            String LinkPost = request.getParameter("LinkPost");

            try {
                Inicial.callInsertCommentAlbum((new Integer(IdUsuario)).intValue(), (new Integer(IdObjeto)).intValue(), Conteudo, LinkPost);
            }
            catch (Exception e) {
                e.printStackTrace();

         %>

         <script type="text/javascript">
             alert('Erro ao inserir comentário')
         </script>

         <%
            }

            response.sendRedirect("albuns.jsp"); 
        %> 
    </body>
</html>
