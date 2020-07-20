<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Campeonato"%>
<%@page import="Controller.ControllerCampeonato"%>

<%
    int cod = Integer.parseInt(request.getParameter("ID"));
    Campeonato campeonato = new Campeonato(cod,"","",null,"");
    ControllerCampeonato controllerCampeonato = new ControllerCampeonato();
    campeonato = controllerCampeonato.excluirCampeonato(campeonato);
    String url = "campeonato.jsp";
    response.sendRedirect(url);
%>