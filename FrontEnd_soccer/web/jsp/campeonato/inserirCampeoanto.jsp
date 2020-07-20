<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <%@include file="../../inc/menu.inc" %>
    <head>
        <title>Criar Campeonato</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h3 style = "margin-left: 10px;">Criar Campeonato</h3>
                <form class="col s12" name="validaInserirCampeonato" action="validaInserirCampeonato.jsp" method="post">
                    <div class="card card_form">
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="Url" name ="URL" type="text" placeholder="Digite o link da imagem" class="validate">
                                <label for="Url">Url Imagem:</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="Nome" name = "NOME" type="text"  placeholder=""class="validate">
                                <label for="Nome">Nome Campeonato</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="Premiacao" name = "PREMIACAO" type="Number" placeholder="0" class="validate">
                                <label for="Premiacao">Premiação</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="Local" name = "LOCAL" type="text" class="validate" placeholder="">
                                <label for="Local">Local</label>
                            </div>
                        </div>
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
