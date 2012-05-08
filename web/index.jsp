<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Redes Sociais - Login</title>
<style type="text/css">

body
	{
            height: 100%;
            background-color: #E8E8E8;
            font-family: Georgia, Arial;
    	}

#login 
	{
	    text-align: center;
            font-family: Verdana, Geneva, sans-serif;
            font-size: 9px;
	}
</style>
</head>

<body>

        <script type="text/javascript">
            function validateData() {
                var username = document.getElementById('username').value
                var password = document.getElementById('password').value
                if ((username == '') || (password == '')) {
                    alert('Campo obrigatório não preenchido')
                    return false
                }
                return true
            }
        </script>

	<div id="login">
	<form action="jsp/inicial/checkLogin.jsp" onSubmit="return validateData()"> 
  		<p><img src="jsp/inicial/img/chat_128.png" alt="Redes Sociais" width="128" height="128" /></p>
		<p>Usuário:  
	  		<input type="text" name="username" id="username"/></p>
		<p>Senha:    
    		<input type="password" name="password" id="password" /> <br/><br/>
    		<input type="submit" value="Entrar"/> <br/>
		<br/><br/> <a href="jsp/inicial/createUser.jsp">Criar nova conta</a></p>
	</form>
        </div>
</body>
</html>
