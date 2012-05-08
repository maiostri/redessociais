<%-- 
    Document   : updateSenha
    Created on : 19/11/2010, 16:40:27
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
            String new_senha = (String)request.getParameter("Senha");

            try {
                Inicial in = new Inicial();

                in.callAlterSenha(v_idusuario, new_senha); 
            }
            catch (Exception e) {
                e.printStackTrace();

         %>

            <script type="text/javascript">
                alert('Erro na atualização da senha')
            </script>

         <%
            }

            response.sendRedirect("home.jsp"); 
        %> 
    </body>
</html>
