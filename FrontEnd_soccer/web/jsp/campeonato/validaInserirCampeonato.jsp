<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Campeonato"%>
<%@page import="Controller.ControllerCampeonato"%>

<%
    String urlImg = request.getParameter("URL");
    String nome = request.getParameter("NOME");
    Double premiacao = Double.parseDouble(request.getParameter("PREMIACAO"));
    String local = request.getParameter("LOCAL");
    Campeonato campeonato = new Campeonato(0,urlImg,nome,premiacao,local);
    ControllerCampeonato controleCampeonato = new ControllerCampeonato();
    controleCampeonato.inserirCampeonato(campeonato);
    String url = "campeonato.jsp";
    response.sendRedirect(url);
%>
