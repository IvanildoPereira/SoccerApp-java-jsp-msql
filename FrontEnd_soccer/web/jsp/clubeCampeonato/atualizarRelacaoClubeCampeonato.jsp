<%@page import="Controller.ControllerClubeCampeonato"%>
<%@page import="Bean.ClubeCampeonato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Clube"%>
<%@page import="Controller.ControllerClube"%>
<%@page import="Bean.Campeonato"%>
<%@page import="Controller.ControllerCampeonato"%>

<%
    ControllerClube controllerClube = new ControllerClube();
    List<Clube> clubes = controllerClube.listarTodos();

    ControllerCampeonato controllerCampeonato = new ControllerCampeonato();
    List<Campeonato> campeonatos = controllerCampeonato.listarTodos();

    int cod = Integer.parseInt(request.getParameter("ID"));

    ClubeCampeonato clubeCampeonato = new ClubeCampeonato(cod, 0, 0, "");
    ControllerClubeCampeonato controllerClubeFuncionario = new ControllerClubeCampeonato();
    clubeCampeonato = controllerClubeFuncionario.buscarClubeCampeonatoPorId(clubeCampeonato);
    String pbusca = request.getParameter("PBUSCA");
%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <%@include file="../../inc/menu.inc" %>
    <head>
        <title>Atualizar Relação entre clube e campeonato</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h3 style = "margin-left: 10px;">Atualizar Relação entre clube e campeonato</h3>
                <form class="col s12" name="validaAtualizarRealcaoClubeCampeonato" action="validaAtualizarRelacaoClubeCampeonato.jsp" method="post">
                    <div class="card card_form">
                        <div class="row">
                            <label style = "margin-left: 12px">Clube:</label>
                            <div class="input-field col s12">
                                <select NAME="ID_CLUBE" class="browser-default">
                                    <% for (Clube clube : clubes) {%>
                                    <% if (clube.getId() == clubeCampeonato.getIdClube()) {%>
                                    <option selected value="<%=clube.getId()%>"><%=clube.getNomeClube()%></option>
                                    <% } else {%>
                                    <option value="<%=clube.getId()%>"><%=clube.getNomeClube()%></option>
                                    <% } %>
                                    <% } %>
                                </select> 
                            </div>
                        </div>

                        <div class="row">
                            <label for="Url" style = "margin-left: 12px">Campeonato:</label>
                            <div class="input-field col s12">
                                <select NAME="ID_CAMPEONATO" class="browser-default">
                                    <% for (Campeonato campeonato : campeonatos) {%>
                                        <% if (campeonato.getId() == clubeCampeonato.getIdCampeonato()) {%>
                                            <option selected value="<%=campeonato.getId()%>"><%=campeonato.getNomeCampeonato()%></option>
                                        <% } else {%>
                                            <option value="<%=campeonato.getId()%>"><%=campeonato.getNomeCampeonato()%></option>
                                        <% } %>
                                    <% }%>
                                </select> 
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s12">
                                <input id="DESCRICAO" name ="DESCRICAO" type="text" placeholder="" class="validate" value = "<%=clubeCampeonato.getDescricao()%>">
                                <label for="Descricao">Descrição:</label>
                            </div>
                        </div>
                        <input type="HIDDEN" name="ID" value="<%=clubeCampeonato.getId()%>"> <br>

                        <button class="btn waves-effect waves-light" type="submit">Salvar
                            <i class="material-icons right">send</i>
                        </button>
                        <a href = "./clubeCampeonato.jsp" class="btn waves-effect red">Cancelar
                            <i class="material-icons right">cancel</i>
                        </a>
                </form>
            </div>
        </div>
    </div>
    <script>
        $(".button-collapse").sideNav();
    </script>
</body>
</html>
