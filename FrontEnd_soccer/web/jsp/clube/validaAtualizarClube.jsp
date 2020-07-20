<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Clube"%>
<%@page import="Controller.ControllerClube"%>

<%  
    int id = Integer.parseInt(request.getParameter("ID"));
    String urlImg = request.getParameter("URL");
    String nome = request.getParameter("NOME");
    String anoFundacao = request.getParameter("ANOFUNDACAO");
    Clube clube = new Clube(id,urlImg,nome,anoFundacao);
    ControllerClube controleClube = new ControllerClube();
    controleClube.alterarClube(clube);
    String url = "clube.jsp";
    response.sendRedirect(url);
%>