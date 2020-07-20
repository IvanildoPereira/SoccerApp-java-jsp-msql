<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Campeonato"%>
<%@page import="Controller.ControllerCampeonato"%>

<%
    int cod = Integer.parseInt(request.getParameter("ID"));
    Campeonato campeonato = new Campeonato(cod, "", "", null, "");
    ControllerCampeonato controllerCampeonato = new ControllerCampeonato();
    campeonato = controllerCampeonato.buscarCampeonatoPorId(campeonato);
    String pbusca = request.getParameter("PBUSCA");
%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <%@include file="../../inc/menu.inc" %>
    <head>
        <title>Atualizar Campeonato</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h3 style = "margin-left: 10px;">Atualizar Campeonato</h3>
                <form class="col s12" name="validaInserirCampeonato" action="validaAtualizarCampeonato.jsp" method="post">
                    <div class="card card_form">
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="Url" name ="URL" type="text" placeholder="Digite o link da imagem" class="validate" value="<%= campeonato.getImgCampeonato()%>">
                                <label for="Url">Url Imagem:</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="Nome" name = "NOME" type="text"  placeholder=""class="validate" value="<%= campeonato.getNomeCampeonato()%>">
                                <label for="Nome">Nome Campeonato</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="Premiacao" name = "PREMIACAO" type="Number" placeholder="0" class="validate" value="<%= campeonato.getPremiacao()%>">
                                <label for="Premiacao">Premiação</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="Local" name = "LOCAL" type="text" class="validate" placeholder="" value="<%= campeonato.getLocal()%>">
                                <label for="Local">Local</label>
                            </div>
                        </div>
                        <input type="HIDDEN" name="ID" value="<%=campeonato.getId()%>"> <br>
                        <button class="btn waves-effect waves-light" type="submit">Salvar
                            <i class="material-icons right">send</i>
                        </button>
                        <a href = "./campeonato.jsp" class="btn waves-effect red">Cancelar
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
