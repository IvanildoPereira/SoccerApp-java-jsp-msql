package Controller;

import Bean.Campeonato;
import Bean.Clube;
import Bean.ClubeCampeonato;
import db.DaoClubeCampeonato;
import java.sql.SQLException;
import java.util.List;

public class ControllerClubeCampeonato {
    public static ControllerClube controllerClube;
    public static ControllerCampeonato  controllerCampeonato;
    public static DaoClubeCampeonato daoClubeCampeonato;
    
    public ClubeCampeonato inserirClubeCampeonato(ClubeCampeonato clubeCampeonato) throws SQLException, ClassNotFoundException {
        daoClubeCampeonato = new DaoClubeCampeonato();
        clubeCampeonato = daoClubeCampeonato.inserir(clubeCampeonato);
        return clubeCampeonato;
    }
    
 
    public ClubeCampeonato excluirClubeCampeonato(ClubeCampeonato clubeCampeonato) throws SQLException, ClassNotFoundException {
        daoClubeCampeonato = new DaoClubeCampeonato();
        clubeCampeonato = daoClubeCampeonato.excluir(clubeCampeonato);
        return clubeCampeonato;
    }

    public ClubeCampeonato alterarClubeCampeonato(ClubeCampeonato clubeCampeonato) throws SQLException, ClassNotFoundException {
        daoClubeCampeonato = new DaoClubeCampeonato();
        clubeCampeonato = daoClubeCampeonato.alterar(clubeCampeonato);
        return clubeCampeonato;
    }

    public ClubeCampeonato buscarClubeCampeonatoPorId(ClubeCampeonato clubeCampeonato) throws SQLException, ClassNotFoundException {

        daoClubeCampeonato = new DaoClubeCampeonato();
        clubeCampeonato = daoClubeCampeonato.buscar(clubeCampeonato);
        
        controllerClube = new ControllerClube();
        controllerCampeonato = new ControllerCampeonato();

        Clube clube = new Clube(clubeCampeonato.getIdClube(),"","","");
        Campeonato campeonato = new Campeonato(clubeCampeonato.getIdCampeonato(),"","",null,"");
        
        clubeCampeonato.setClube(controllerClube.buscarClubePorId(clube));
        clubeCampeonato.setCampeonato(controllerCampeonato.buscarCampeonatoPorId(campeonato));

        return clubeCampeonato;
    }


    public List<ClubeCampeonato> listarClubeCampeonato(ClubeCampeonato clubeCampeonato) throws SQLException, ClassNotFoundException {

        controllerClube = new ControllerClube();
        controllerCampeonato = new ControllerCampeonato();
        
        daoClubeCampeonato = new DaoClubeCampeonato();

        List<ClubeCampeonato> clubeCampeonatos = daoClubeCampeonato.listar(clubeCampeonato);

        for (ClubeCampeonato listaFD : clubeCampeonatos) {
            Clube clube = new Clube(listaFD.getIdClube(),"","","");
            Campeonato campeonato = new Campeonato(listaFD.getIdCampeonato(),"","",null,"");
            listaFD.setClube(controllerClube.buscarClubePorId(clube));
            listaFD.setCampeonato(controllerCampeonato.buscarCampeonatoPorId(campeonato));
        }

        return clubeCampeonatos;
    }  
}
