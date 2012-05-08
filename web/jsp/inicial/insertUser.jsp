<%-- 
    Document   : insertUser
    Created on : 18/10/2010, 19:37:57
    Author     : patricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oracle.sql.BLOB"%> 
<%@page import="oracle.sql.ARRAY"%>
<%@page import="Model.User_t"%>
<%@page import="Controller.Inicial"%>
<%@page import="AcessDataBase.ConnectionDataBase"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="AcessDataBase.CreateTypeDataBase"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    // valores dos campos
    String Nome = request.getParameter("Nome");
    String Sobrenome = request.getParameter("Sobrenome");

    String DataNasc = request.getParameter("DataNasc");
    try {
        String[] a = DataNasc.split("/");
        DataNasc = a[2] + "/" + a[1] + "/" + a[0];
    }
    catch (Exception ex) {
%>
        <script type="text/javascript">
            alert('Erro na inserção da data')
            document.location.href = 'createUser.jsp'
        </script>
<%
    }
    String Sexo = new String();
    if (request.getParameter("Sexo").equals("1"))
        Sexo = "M";
    else if (request.getParameter("Sexo").equals("2"))
        Sexo = "F";
    String Telefone1 = request.getParameter("Telefone1");
    String Telefone2 = request.getParameter("Telefone2");
    String TelefoneCom = request.getParameter("TelefoneCom");
    String Celular1 = request.getParameter("Celular1");
    String Celular2 = request.getParameter("Celular2");
    String Email1 = request.getParameter("Email1");
    String Email2 = request.getParameter("Email2");
    String EmailCom = request.getParameter("EmailCom");
    String CidadeOrigem = request.getParameter("CidadeOrigem");
    String PaisOrigem = request.getParameter("PaisOrigem");
    String CidadeAtual = request.getParameter("CidadeAtual");
    String PaisAtual = request.getParameter("PaisAtual");
    String URL = request.getParameter("URL");
    String Nick = request.getParameter("Nick");
    String Senha = request.getParameter("Senha");


    Vector<String> t_list = new Vector<String>();
    Vector<String> e_list = new Vector<String>();

    if (!Telefone1.equals(""))
        t_list.add(Telefone1);
    if (!Telefone2.equals(""))
        t_list.add(Telefone2);
    if (!TelefoneCom.equals(""))
        t_list.add(TelefoneCom);
    if (!Celular1.equals(""))
        t_list.add(Celular1);
    if (!Celular2.equals(""))
        t_list.add(Celular2);

    if (!Email1.equals(""))
        e_list.add(Email1);
    if (!Email1.equals(""))
        e_list.add(Email2);
    if (!EmailCom.equals(""))
        e_list.add(EmailCom);

    
    //conexão com o banco de dados para criar objetos do tipo array
    CreateTypeDataBase ctdb = null;
    //arrays de telefones e emails
    ARRAY t = null;
    ARRAY e = null;
    
    //inserção dos telefones em um Array e salvando as informações do usuário no banco de dados
    try {
        ctdb = new CreateTypeDataBase();

        t = ctdb.createArray("P6426614.TELEFONES", t_list.toArray());
        e = ctdb.createArray("P6426614.EMAILS", e_list.toArray());

        ctdb.close();
    }
    catch (SQLException se) {
        out.println("Erro: " + se.getErrorCode() + " Mesangem: " + se.getMessage()); 
        ctdb.close();
        se.printStackTrace(); 
    }
    catch (Exception ce) {
        ce.printStackTrace(); 
        ctdb.close();
    }

    //Usuário a ser inserido no banco de dados
    User_t new_user = null;

    try {
        Blob Foto = null; 

        //criação de um usuário com suas informações
        new_user = new User_t(0, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual,
            PaisAtual, Foto, t, e, URL, Nick, Senha);

        Inicial in = new Inicial();

        in.callInsertUser(new_user);
    }
    catch (SQLException se) {
        out.println("Erro: " + se.getErrorCode() + " Mesangem: " + se.getMessage());
        se.printStackTrace();

        if (se.getErrorCode() == 20000) {
%>
            <script type="text/javascript">
                alert('Usuário já está cadastrado')
                document.location.href = 'createUser.jsp'
            </script>
<%
        }
        else {
%>
            <script type="text/javascript">
                alert('Erro ao criar usuário')
                document.location.href = '../../index.jsp'
            </script>
<% 
        }
    }
    catch (Exception ex) {
        out.println("Mesangem: " + ex.getMessage());
%>
        <script type="text/javascript">
            alert('Erro ao criar usuário')
            document.location.href = '../../index.jsp'
        </script>

<%
    } 
%>

    <!-- INSERÇÃO FEITA COM SUCESSO -->

    <script type="text/javascript">
       alert('Usuário criado com sucesso')
       document.location.href = '../../index.jsp'
    </script>
 