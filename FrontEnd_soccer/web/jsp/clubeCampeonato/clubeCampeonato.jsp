<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Usuario"%>
<%@page import="Bean.ClubeCampeonato"%>
<%@page import="Controller.ControllerClubeCampeonato"%>

<%
    String obs = request.getParameter("OBS") != null ? request.getParameter("OBS") : "";;
    ClubeCampeonato clubeCampeonato = new ClubeCampeonato(0, 0, 0, obs);
    ControllerClubeCampeonato controllerClubeCampeonato = new ControllerClubeCampeonato();
    List<ClubeCampeonato> lista = controllerClubeCampeonato.listarClubeCampeonato(clubeCampeonato);
    Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");
    String url = "PBUSCA=" + clubeCampeonato.getDescricao() + "&ID=";
%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <%@include file="../../inc/menu.inc" %>
    <head>
        <title>Relação Clube e Campeonato</title>
    </head>
    <body>
        <div class="bottom_more">
            <a class="add_more" href="./inserirRelacaoClubeCampeonato.jsp"><i class="material-icons">add</i></a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12 m6 l3">
                    <form class = "form_search" name="consultarClubeCampeonato" action="clubeCampeonato.jsp" method="post">
                        <div class="search_container">
                            <input type="text" name ="OBS" placeholder="search" />
                            <button type="submit">  <i class="material-icons">search</i></button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <table class="striped responsive-table centered">
                    <thead>
                        <tr>
                            <th data-field="Id">Id</th>
                            <th data-field="NomeFun">Nome Campeonato</th>
                            <th data-field="NomeDep">Nome Clube</th>
                            <th data-field="Observacao">Descrição</th>
                            <th data-field="Excluir">Excluir</th>
                            <th data-field="Alterar">Alterar</th>
                        </tr>
                    </thead>
                    <% if (!(lista.isEmpty())) { %> 
                    <tbody>
                        <% for (ClubeCampeonato listaClubeCampeonato : lista) {%>
                        <tr>
                            <td><%=listaClubeCampeonato.getId()%></td>
                            <td>
                                <img class = "img_table" src = "<%= listaClubeCampeonato.getCampeonato().getImgCampeonato()%>"/>
                                <p><%=listaClubeCampeonato.getCampeonato().getNomeCampeonato()%></p>
                            </td>
                            <td>
                                <img class = "img_table" src = "<%= listaClubeCampeonato.getClube().getImgClube()%>"/>
                                <p><%=listaClubeCampeonato.getClube().getNomeClube()%></p>
                            </td>
                            <td><%=listaClubeCampeonato.getDescricao()%></td>
                            <% if (usuLogado.getTipo().equals("ADM")) {%>
                            <td><a href="excluirRelacaoClubeCampeonato.jsp?<%=url + listaClubeCampeonato.getId()%>">Excluir</a></td>
                            <td><a href="atualizarRelacaoClubeCampeonato.jsp?<%=url + listaClubeCampeonato.getId()%>">Alterar</a></td>
                            <% } %>
                        </tr>
                        <% }%>
                    </tbody>
                    <% }%>
                </table>
            </div>
        </div>
        <script>
            $(".button-collapse").sideNav();
        </script>
    </body>
</html>

