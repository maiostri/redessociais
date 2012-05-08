<%-- 
    Document   : createUser
    Created on : 15/10/2010, 17:50:03
    Author     : patricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Criação de Conta - Redes Sociais</title>
    </head>
    <body>

        <script type="text/javascript">
            function validateData(){
                //verifica se algum campo obrigatório é não nulo. Caso seja,
                //a submissão não ocorre e uma mensagem de erro é enviada
                var Nome = document.getElementById('Nome').value
                var Sobrenome = document.getElementById('Sobrenome').value
                var DataNasc = document.getElementById('DataNasc').value
                var Sexo =  document.getElementById('Sexo').value
                var URL = document.getElementById('URL').value
                var Nick = document.getElementById('Nick').value
                var Senha = document.getElementById('Senha').value
                var Senha2 = document.getElementById('Senha2').value

                if ((Nome == '') || (Sobrenome == '') || (DataNasc == '') || (URL == '') || (Nick == '') || (Sexo == 0) 
                        || (Senha == '') || (Senha2 == '')) {
                    alert('Campo obrigatório não preenchido')
                    return false
                }

                //verificação da data
                var a = new Array()
                a = DataNasc.split('/')
                if (a[0].length != 2 || a[1].length != 2 || a[2].length != 4) {
                    alert('O formato correto da data de nascimento é dd/mm/aaaa')
                    return false
                }

                //verifica se a senha possui no mínimo 6 caracteres
                if (Senha.length < 6) {
                    alert('Senha deve ter no mínimo 6 caracteres')
                    return false
                }

                //verifica se as senha são iguais
                if (Senha != Senha2) {
                    alert('As senhas devem ser iguais')
                    return false 
                }

                return true
            }
        </script>

        <form action="insertUser.jsp" onSubmit="return validateData()">
            <br/>*: Campos obrigatórios
            <br/><br/>
            Nome* <input type="text" name="Nome" id="Nome" value="" size="50" /><br/><br/>
            Sobrenome* <input type="text" name="Sobrenome" id="Sobrenome" value="" size="45" /><br/><br/>
            Data de Nascimento* <input type="text" name="DataNasc" id="DataNasc" value="" size="20" />
            Sexo* <select name="Sexo" id="Sexo"> 
                <option value="0"></option>
                <option value="1">Masculino</option>
                <option value="2">Feminino</option>
            </select><br/><br/>
            Telefone 1 <input type="text" name="Telefone1" id="Telefone1" value="" size="30" /><br/><br/>
            Telefone 2 <input type="text" name="Telefone2" id="Telefone2" value="" size="30" /><br/><br/>
            Telefone Comercial <input type="text" name="TelefoneCom" id="TelefoneCom" value="" size="30" /><br/><br/>
            Celular 1 <input type="text" name="Celular1" id="Celular1" value="" size="30" /><br/><br/>
            Celular 2 <input type="text" name="Celular2" id="Celular2" value="" size="30" /><br/><br/>
            Email 1 <input type="text" name="Email1" id="Email1" value="" size="30" /><br/><br/>
            Email 2 <input type="text" name="Email2" id="Email2" value="" size="30" /><br/><br/>
            Email Comercial <input type="text" name="EmailCom" id="EmailCom" value="" size="30" /><br/><br/>
            Cidade Origem <input type="text" name="CidadeOrigem" id="CidadeOrigem" value="" size="30" /><br/><br/>
            Pais Origem <input type="text" name="PaisOrigem" id="PaisOrigem" value="" size="30" /><br/><br/>
            Cidade Atual <input type="text" name="CidadeAtual" id="CidadeAtual" value="" size="30" /><br/><br/>
            Pais Atual <input type="text" name="PaisAtual" id="PaisAtual" value="" size="30" /><br/><br/>
            URL* <input type="text" name="URL" id="URL" value="" size="30" /><br/><br/>
            Nick* <input type="text" name="Nick" id="Nick" value="" size="30" /><br/><br/>
            Senha* <input type="password" name="Senha" id="Senha" value="" size="30" /><br/><br/>
            Digite novamente a senha* <input type="password" name="Senha2" id="Senha2" value="" size="30" /><br/><br/>
            <input type="submit" value="Criar Conta" name="CriarConta" />
            <!-- tentar fazer verificação de submissão nesta página (usando parâmetro onLoad ou OnClick
            e se existir campos obrigatórios nulos, a submissão é interrompida-->
        </form>
        <br><br><a href="../../index.jsp">Página de Login</a>
    </body>
</html>
