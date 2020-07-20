<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Clube"%>
<%@page import="Controller.ControllerClube"%>

<%
    int cod = Integer.parseInt(request.getParameter("ID"));
    Clube clube = new Clube(cod, "", "", "");
    ControllerClube controllerClube = new ControllerClube();
    clube = controllerClube.buscarClubePorId(clube);
    String pbusca = request.getParameter("PBUSCA");
%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <%@include file="../../inc/menu.inc" %>
    <head>
        <title>Atualizar Clube</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h3 style = "margin-left: 10px;">Atualizar Clube</h3>
                <form class="col s12" name="validaInserirClube" action="validaAtualizarClube.jsp" method="post">
                    <div class="card card_form">
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="Url" name ="URL" type="text" placeholder="Digite o link da imagem" class="validate" value="<%= clube.getImgClube()%>">
                                <label for="Url">Url Imagem:</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="Nome" name = "NOME" type="text"  placeholder=""class="validate" value="<%= clube.getNomeClube()%>">
                                <label for="Nome">Nome do Clube</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="ANOFUNDACAO" name = "ANOFUNDACAO" type="text" class="validate" placeholder="" value="<%= clube.getAnoFundacao()%>">
                                <label for="ANOFUNDACAO">Ano de Fundação</label>
                            </div>
                        </div>
                        <input type="HIDDEN" name="ID" value="<%= clube.getId()%>"> <br>
                        <button class="btn waves-effect waves-light" type="submit">Salvar
                            <i class="material-icons right">send</i>
                        </button>
                        <a href = "./clube.jsp" class="btn waves-effect red">Cancelar
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
