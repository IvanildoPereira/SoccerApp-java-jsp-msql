<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Clube"%>
<%@page import="Controller.ControllerClube"%>

<%  
    int id = Integer.parseInt(request.getParameter("ID"));
    Clube clube = new Clube(id,"","","");
    ControllerClube controleClube = new ControllerClube();
    controleClube.excluirClube(clube);
    String url = "clube.jsp";
    response.sendRedirect(url);
%>