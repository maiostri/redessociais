<%-- 
    Document   : checkLogin
    Created on : 14/10/2010, 22:11:11
    Author     : patricio
--%>

<%--@page contentType="text/html" pageEncoding="UTF-8"--%>
<%@page import="Controller.Inicial" %>
<%@page import="java.sql.*" %> 

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    int v_idusuario = 0;

    try {
        Inicial in = new Inicial();
        v_idusuario = in.callCheckLogin(username, password);
    }
    catch (SQLException se) {
        if (se.getErrorCode() == 20000) {
            //nick não encontrado
%>
            <script type="text/javascript">
                alert('Usuário não encontrado')
                document.location.href = '../../index.jsp'
            </script>
<%
        }
        else if (se.getErrorCode() == 20001) {
            //senha incorreta
%>
            <script type="text/javascript">
                alert('Senha incorreta')
                document.location.href = '../../index.jsp'
            </script>
<%
        }
        else if (se.getErrorCode() == 20002) {
            //erro genérico
%>
            <script type="text/javascript">
                alert('Erro')
                document.location.href = '../../index.jsp'
            </script>
<%
        }
    }
    catch (Exception e) {
        out.println("Error");
        e.printStackTrace();

%>
        <script type="text/javascript">
            alert('Erro 2')
            document.location.href = '../../index.jsp'
        </script>
<% 
    }

    //login feito com sucesso

    //enviar o conteúdo da variável v_idusuario para a página inicial por meio da requisição
    request.getSession().setAttribute("idusuario", v_idusuario);

%>

    <script type="text/javascript">
        //document.location.href = 'inicialPage.jsp'
        document.location.href = 'home.jsp'
    </script>
