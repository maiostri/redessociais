<%@page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@page import="Controller.Inicial"%>
<%@page import="java.sql.*"%>
<%@page import="Model.User_t"%>
<%@page import="oracle.sql.ARRAY"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Atualização das Informações do Usuário - Redes Sociais</title>
<style type="text/css">
<!--
@import url("css/home.css");
-->
</style>
</head>

<body>

    <%
            User_t current_user = (User_t)request.getSession().getAttribute("User");

            String[] tels = (String[])current_user.getTelefones().getArray();
            String[] ems = (String[])current_user.getEmails().getArray();

            int i = 0;
    %>

    <script type="text/javascript">
        function validateData(){
            //verifica se algum campo obrigatório é não nulo. Caso seja,
            //a submissão não ocorre e uma mensagem de erro é enviada
            var Nome = document.getElementById('Nome').value
            var Sobrenome = document.getElementById('Sobrenome').value
            var DataNasc = document.getElementById('DataNasc').value
            var Sexo =  document.getElementById('Sexo').value
            var URL = document.getElementById('URL').value

            if ((Nome == '') || (Sobrenome == '') || (DataNasc == '') || (URL == '') || (Sexo == 0)) {
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

            return true
        }
    </script>


    <div id="logo">
    </div>
    <div id="buttons">
        <a href="profile.jsp" id="bperfil">Perfil</a>
        <a href="home.jsp" id="batualizacoes">Atualizações</a>
        <a href="posts.jsp" id="bposts">Posts</a>
        <a href="albuns.jsp" id="balbuns">Álbuns</a>
        <a href="Configuracoes.jsp" id="bconfiguracoes">Configurações</a>
        <a href="comunidades.jsp" id="bcomunidades">Comunidades</a>
    </div>
    <div id="main">
    	<div id="left">
                <p align="center">
                    <img alt="" src="../jsp_image/imageProfile.jsp" width="190" border="0"/>
                    Bem-vindo <%= current_user.getNome() + " " + current_user.getSobrenome()  %>
                </p>
        </div>
        <div id="posts">

            <form action="updateUser.jsp" onSubmit="return validateData()">

                    <br/>*: Campos obrigatórios
                    <br/><br/>
                    Nome* <input type="text" name="Nome" id="Nome" value="<%=current_user.getNome()%>" size="50" /><br/><br/>
                    Sobrenome* <input type="text" name="Sobrenome" id="Sobrenome" value="<%=current_user.getSobrenome()%>" size="45" /><br/><br/>
                    Data de Nascimento* <input type="text" name="DataNasc" id="DataNasc" value="<%=current_user.getDataNasc()%>" size="20" />
                    Sexo* <select name="Sexo" id="Sexo">
                        <option value="0"></option>
                        <option value="1" <% if (current_user.getSexo().equals("M")) out.println("SELECTED"); %> >Masculino</option>
                        <option value="2" <% if (current_user.getSexo().equals("F")) out.println("SELECTED"); %> >Feminino</option>
                    </select><br/><br/>
                    Telefone 1 <input type="text" name="Telefone1" id="Telefone1" value="<% try { out.println(tels[i++]); } catch (Exception e) { } %>" size="30" /><br/><br/>
                    Telefone 2 <input type="text" name="Telefone2" id="Telefone2" value="<% try { out.println(tels[i++]); } catch (Exception e) { } %>" size="30" /><br/><br/>
                    Telefone 3 <input type="text" name="TelefoneCom" id="TelefoneCom" value="<% try { out.println(tels[i++]); } catch (Exception e) { } %>" size="30" /><br/><br/>
                    Telefone 4 <input type="text" name="Celular1" id="Celular1" value="<% try { out.println(tels[i++]); } catch (Exception e) { } %>" size="30" /><br/><br/>
                    Telefone 5 <input type="text" name="Celular2" id="Celular2" value="<% try { out.println(tels[i++]); } catch (Exception e) { } %>" size="30" /><br/><br/>
                    Email 1 <input type="text" name="Email1" id="Email1" value="<% i = 0; try { out.println(ems[i++]); } catch (Exception e) { } %>" size="30" /><br/><br/>
                    Email 2 <input type="text" name="Email2" id="Email2" value="<% try { out.println(ems[i++]); } catch (Exception e) { } %>" size="30" /><br/><br/>
                    Email 3 <input type="text" name="EmailCom" id="EmailCom" value="<% try { out.println(ems[i++]); } catch (Exception e) { } %>" size="30" /><br/><br/>
                    Cidade Origem <input type="text" name="CidadeOrigem" id="CidadeOrigem" value="<%=current_user.getCidadeOrigem()%>" size="30" /><br/><br/>
                    Pais Origem <input type="text" name="PaisOrigem" id="PaisOrigem" value="<%=current_user.getPaisOrigem()%>" size="30" /><br/><br/>
                    Cidade Atual <input type="text" name="CidadeAtual" id="CidadeAtual" value="<%=current_user.getCidadeAtual()%>" size="30" /><br/><br/>
                    Pais Atual <input type="text" name="PaisAtual" id="PaisAtual" value="<%=current_user.getPaisAtual()%>" size="30" /><br/><br/>
                    URL* <input type="text" name="URL" id="URL" value="<%=current_user.getURL()%>" size="30" /><br/><br/>
                    <br/><br/><input type="submit" value="Atualizar"/>
                </form>
            
        </div>
    </div>
    <h1 id="bottom">Desenvolvido por Ricardo Maiostri e Patrício Frota - USP São Carlos - 2010</h1>
</body>
</html>
