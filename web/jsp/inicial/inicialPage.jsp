<%-- 
    Document   : pagina_inicial
    Created on : 15/10/2010, 17:35:45
    Author     : patricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Blob"%>
<%@page import="Controller.Inicial"%>
<%@page import="java.sql.*"%>
<%@page import="Model.User_t"%>
<%@page import="oracle.sql.ARRAY"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Inicial - Orkut do Jeremias</title>
    </head>
    <body>

        <%
            Integer v_idusuario = (Integer)request.getSession().getAttribute("idusuario");

            //ajusta os parâmetros da sessão
            request.getSession().setAttribute("idusuario", v_idusuario);

            if(request.getSession().getAttribute("idusuario") == null) {
                response.sendRedirect("../../index.jsp");
            }
            else {
                
                User_t current_user = new User_t();

                out.println("Id do usuario: " + v_idusuario + "<br>");

                try {
                    Inicial in = new Inicial();

                    current_user = in.callConsultDataInitial(v_idusuario);
                }
                catch (SQLException se) {
                    out.println("Code: " + se.getErrorCode() + " Mensagem: " + se.getMessage());
                    se.printStackTrace();
        %>
                        <script type="text/javascript">
                            alert('Erro SQL página inicial')
                            document.location.href = '../../index.jsp'
                        </script>
        <%
                }
                catch (Exception e) {
                    out.println("Mensagem: " + e.getMessage());
                    e.printStackTrace();
        %>
                        <script type="text/javascript">
                            alert('Erro página inicial')
                            document.location.href = '../../index.jsp'
                        </script>
        <%
                }


                out.println("Bem vindo " + current_user.getNome() + " " + current_user.getSobrenome() + "<br>");
                String[] tel = (String[])current_user.getTelefones().getArray();
                for (String t : tel) {
                    out.println("Telefone: " + t + "<br>");
                }

            }
        %>

            <!-- LINK PARA FAZER LOGOUT - VAI FUNCIONAR CORRETAMENTE COM A APLICAÇÃO DE FILTRO NA SESSÃO -->

            <br><br><a href="../../index.jsp" onclick="<%
                                                            request.getSession().removeAttribute("idusuario");
                                                            request.getSession().invalidate();
                                                        %>">Sair</a>

    </body>
</html>
