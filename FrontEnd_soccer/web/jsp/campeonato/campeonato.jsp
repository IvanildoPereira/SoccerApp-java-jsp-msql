<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Usuario"%>
<%@page import="Bean.Campeonato"%>
<%@page import="Controller.ControllerCampeonato"%>

<%
    String nome = request.getParameter("NOME") != null ? request.getParameter("NOME") : "";
    Campeonato campeonato = new Campeonato(0, "", nome, 0.0, "");
    ControllerCampeonato controllerCampeonato = new ControllerCampeonato();
    List<Campeonato> lista = controllerCampeonato.listarCampeonato(campeonato);
    Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");
    String url = "PBUSCA=" + campeonato.getNomeCampeonato() + "&ID=";
    System.out.println(lista);
%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <%@include file="../../inc/menu.inc" %>
    <head>
        <title>Campeonatos</title>
    </head>
    <body>
        <div class="bottom_more">
            <a class="add_more" href="./inserirCampeoanto.jsp"><i class="material-icons">add</i></a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m6 l3">
                    <form class = "form_search" name="consultarUsuario" action="campeonato.jsp" method="post">
                        <div class="search_container">
                            <input type="text" name ="NOME" placeholder="search" />
                            <button type="submit">  <i class="material-icons">search</i></button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <% if (!(lista.isEmpty())) { %> 
                <% for (Campeonato listaCampeoantos : lista) {%>
                <div class="col s12 m6 l3">
                    <div class="card">
                        <div class="card-image">
                            <img src="<%= listaCampeoantos.getImgCampeonato()%>" class = "cover">
                            <% if (usuLogado.getTipo().equals("ADM")) {%>
                            <div class = "button-floating">
                                <a href = "atualizarCampeonato.jsp?<%=url + listaCampeoantos.getId()%>" class="btn-floating halfway-fab waves-effect waves-light blue"><i class="material-icons">mode_edit</i></a>
                                <a href = "excluirCampeonato.jsp?<%=url + listaCampeoantos.getId()%>" class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">delete_forever</i></a>
                            </div>
                            <% }%>
                        </div>
                        <div class="card-content">
                            <span class="card-title"><%= listaCampeoantos.getNomeCampeonato()%></span>

                            <p><Strong>Premiação: </strong><%= listaCampeoantos.getPremiacao()%></p>
                            <p><Strong>Local: </strong><%= listaCampeoantos.getLocal()%></p>
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
