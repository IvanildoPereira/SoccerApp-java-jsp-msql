<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>LOGIN - SISTEMA</title>
    <body>
        <%@include file = "../../inc/menu_login.inc" %>
        <div class="container">

            <div class="row">
                <h3 style = "margin-left: 10px;">Login</h3>
                <form name="FORMLOGIN" action="menu.jsp" method="post">
                    <div class="card card_form">
                        LOGIN: <input type="text" name ="LOGIN"> <br>
                        SENHA: <input type="password" name ="SENHA"> <br>
                        <button class="btn waves-effect waves-light" type="submit">Entrar
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>