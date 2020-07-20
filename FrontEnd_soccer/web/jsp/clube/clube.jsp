<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Usuario"%>
<%@page import="Bean.Clube"%>
<%@page import="Controller.ControllerClube"%>

<%
    String nome = request.getParameter("NOME") != null ? request.getParameter("NOME") : "";
    Clube clube = new Clube(0, "", nome, "");
    ControllerClube controllerClube = new ControllerClube();
    List<Clube> lista = controllerClube.listarClube(clube);
    Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");
    String url = "PBUSCA=" + clube.getNomeClube() + "&ID=";
    System.out.println(lista);
%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <%@include file="../../inc/menu.inc" %>
    <head>
        <title>Clubes</title>
    </head>
    <body>
        <div class="bottom_more">
            <a class="add_more" href="./inserirClube.jsp"><i class="material-icons">add</i></a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m6 l3">
                    <form class = "form_search" name="consultarUsuario" action="clube.jsp" method="post">
                        <div class="search_container">
                            <input type="text" name ="NOME" placeholder="search" />
                            <button type="submit">  <i class="material-icons">search</i></button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <% if (!(lista.isEmpty())) { %> 
                <% for (Clube listaClubes : lista) {%>
                <div class="col s12 m6 l3">
                    <div class="card">
                        <div class="card-image">
                            <img src="<%= listaClubes.getImgClube()%>" class = "cover">
                            <% if (usuLogado.getTipo().equals("ADM")) {%>
                            <div class = "button-floating">
                                <a href = "atualizarClube.jsp?<%=url + listaClubes.getId()%>" class="btn-floating halfway-fab waves-effect waves-light blue"><i class="material-icons">mode_edit</i></a>
                                <a href = "excluirClube.jsp?<%=url + listaClubes.getId()%>" class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">delete_forever</i></a>
                            </div>
                            <% }%>
                        </div>
                        <div class="card-content">
                            <span class="card-title"><%= listaClubes.getNomeClube()%></span>

                            <p><Strong>Ano Fundação: </strong><%= listaClubes.getAnoFundacao()%></p>
                        </div>
                    </div>
                </div>
                <% }%>
                <% }%>
            </div>
        </div>
        <script>
            $(".button-collapse").sideNav();
        </script>
    </body>
</html>
