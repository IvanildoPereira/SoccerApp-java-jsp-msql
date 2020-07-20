<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.ClubeCampeonato"%>
<%@page import="Controller.ControllerClubeCampeonato"%>

<%
    int id = Integer.parseInt(request.getParameter("ID"));
    
    ClubeCampeonato clubeCampeonato = new ClubeCampeonato(id,0,0,"");
    ControllerClubeCampeonato controllerClubeCampeonato = new ControllerClubeCampeonato();
    clubeCampeonato = controllerClubeCampeonato.excluirClubeCampeonato(clubeCampeonato); 
// REDIRECIONA PARA A PAG LOGIN.JSP
    String url = "clubeCampeonato.jsp";
    response.sendRedirect(url);

%>