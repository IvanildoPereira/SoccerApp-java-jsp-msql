<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Usuario"%>
<%@page import="Controller.UsuarioControler"%>

<%
    String login = request.getParameter("LOGIN");
    String senha = request.getParameter("SENHA");
    Usuario usu = new Usuario(0, "", login, senha, "", "");
    UsuarioControler usucont = new UsuarioControler();
    usu = usucont.validaUsuario(usu);
    session.setAttribute("UsuarioLogado", usu);
%>

<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>SISTEMA </title>
    <body>
        <% if (!usu.getStatus().equals("")) { %>         
        <%
            // REDIRECIONA PARA A PAG LOGIN.JSP
            String url = "../campeonato/campeonato.jsp";
            response.sendRedirect(url);
        %>

        <% } else { %>
        <h1>USUÁRIO INVÁLIDO</h1>
        <a href = "../acesso/login.jsp" class="btn waves-effect red">Tentar Novamente Login
            <i class="material-icons right"></i>
        </a>
        <% }%>
    </body>
</html>
