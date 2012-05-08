<%-- 
    Document   : index
    Created on : 14/10/2010, 20:07:31
    Author     : patricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela de Login</title>
    </head>

    <body>
        <form action="jsp/inicial/checkLogin.jsp">
            <br/>
            <br/>
            Nick <input type="text" name="username" id="username" value="" size="20" /><br/><br/>
            Senha <input type="password" name="password" id="password" value="" size="20" /><br/><br/>
            <input type="submit" value="Entrar"/>
        </form>
        <br/><a href="jsp/inicial/createUser.jsp">Criar nova conta</a>
    </body>
</html>