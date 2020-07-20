<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Clube"%>
<%@page import="Controller.ControllerClube"%>

<%
    String urlImg = request.getParameter("URL");
    String nome = request.getParameter("NOME");
    String anoFundacao = request.getParameter("ANOFUNDACAO");
    Clube clube = new Clube(0,urlImg,nome,anoFundacao);
    ControllerClube controleClube = new ControllerClube();
    controleClube.inserirClube(clube);
    String url = "clube.jsp";
    response.sendRedirect(url);
%>
