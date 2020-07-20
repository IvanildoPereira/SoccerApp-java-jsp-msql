<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.ClubeCampeonato"%>
<%@page import="Controller.ControllerClubeCampeonato"%>

<%
    int id = Integer.parseInt(request.getParameter("ID"));
    int idClube = Integer.parseInt(request.getParameter("ID_CLUBE"));
    int idCampeonato = Integer.parseInt(request.getParameter("ID_CAMPEONATO"));
    String descricao = request.getParameter("DESCRICAO");
    
    ClubeCampeonato clubeCampeonato = new ClubeCampeonato(id,idClube,idCampeonato,descricao);
    ControllerClubeCampeonato controllerClubeCampeonato = new ControllerClubeCampeonato();
    clubeCampeonato = controllerClubeCampeonato.alterarClubeCampeonato(clubeCampeonato);
    
// REDIRECIONA PARA A PAG LOGIN.JSP
    String url = "clubeCampeonato.jsp";
    response.sendRedirect(url);

%>