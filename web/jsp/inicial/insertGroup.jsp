<%--
    Document   : insertUser
    Created on : 18/10/2010, 19:37:57
    Author     : patricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");
    String Grupo = request.getParameter("Nome");
    String Visualizacao = request.getParameter("Visualizacao");

    try {

        //criação de um usuário com suas informações
        Inicial in = new Inicial();

        in.callInsertGroup(v_idusuario,Grupo);
    }
    catch (SQLException se) {
        out.println("Erro: " + se.getErrorCode() + " Mesangem: " + se.getMessage());
        se.printStackTrace();
%>
            <script type="text/javascript">
                alert('Erro ao criar grupo')
                document.location.href = 'groups.jsp'
            </script>
<%
    }
    catch (Exception ex) {
        out.println("Mesangem: " + ex.getMessage());
%>
        <script type="text/javascript">
            alert('Erro ao criar grupo')
            document.location.href = 'groups.jsp'
        </script>

<%
    }
%>

    <!-- INSERÇÃO FEITA COM SUCESSO -->

    <script type="text/javascript">
       alert('Grupo criado com sucesso')
       document.location.href = 'groups.jsp'
    </script>
