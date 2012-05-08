<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login - Orkut do Jeremias</title>
<style type="text/css">
#apDiv1 {
	position:absolute;
	left:15px;
	top:12px;
	width:983px;
	height:51px;
	z-index:1;
	font-family: "Comic Sans MS", cursive;
	font-size: xx-large;
	font-weight: 900;
	font-variant: small-caps;
	text-transform: capitalize;
	font-style: normal;
	background-color: #CCC;
	vertical-align: super;
	text-align: justify;
}
#apDiv1 h3 strong em {
	text-align: center;
	font-weight: bold;
}
#apDiv1 h3 strong em {
	text-align: right;
}
#apDiv1 {
	text-align: center;
}
#apDiv2 {
	position:absolute;
	left:730px;
	top:161px;
	width:236px;
	height:245px;
	z-index:2;
	background-color: #CCC;
	text-align: center;
}
#apDiv2 p a {
	color: #000;
	text-align: center;
}
#apDiv2 p {
	text-align: right;
}
#apDiv2 p {
	text-align: center;
}
#apDiv2 p {
	text-align: left;
}
#apDiv2 p {
	text-align: center;
}
#apDiv3 {
	position:absolute;
	left:85px;
	top:153px;
	width:460px;
	height:262px;
	z-index:3;
	background-image: url(jeremias.jpg);
}
#apDiv4 {
	position:absolute;
	left:181px;
	top:124px;
	width:262px;
	height:30px;
	z-index:4;
	font-family: "Comic Sans MS", cursive;
	text-align: center;
}
body,td,th {
	color: #000;
	background-color: #999;
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

<div id="apDiv1"><em><strong>ORKUT DO JEREMIAS</strong></em></div>
<div id="apDiv2">
  <form id="form1" name="form1" method="post" action="jsp/inicial/checkLogin.jsp" onSubmit="return validateData()">
    <p>
      <label for="username">Nick</label>
      <input name="username" type="text" id="username" size="25" />
      <label for="password">Senha</label>
      <input name="password" type="password" id="password" size="25" /> <br/><br/>
      <input name="Entrar" type="submit" id="Entrar" value="Entrar" />
    </p>
  </form>
  <p><br/><br/><a href="jsp/inicial/createUser.jsp">Criar Conta</a></p>
</div>
<div align="justify" id="apDiv3"></div>
<div id="apDiv4">ADMINISTRADOR</div>
</body>
</html>
