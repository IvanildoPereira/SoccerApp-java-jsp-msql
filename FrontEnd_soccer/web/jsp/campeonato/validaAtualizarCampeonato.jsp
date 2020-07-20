<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Campeonato"%>
<%@page import="Controller.ControllerCampeonato"%>

<%
    int id = Integer.parseInt(request.getParameter("ID"));
    String urlImg = request.getParameter("URL");
    String nome = request.getParameter("NOME");
    Double premiacao = Double.parseDouble(request.getParameter("PREMIACAO"));
    String local = request.getParameter("LOCAL");
    Campeonato campeonato = new Campeonato(id,urlImg,nome,premiacao,local);
    ControllerCampeonato controleCampeonato = new ControllerCampeonato();
    controleCampeonato.alterarCampeonato(campeonato);
    String url = "campeonato.jsp?teste";
    response.sendRedirect(url);
%>