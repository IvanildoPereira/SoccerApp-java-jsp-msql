package Controller;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import db.DaoCampeonato;
import Bean.Campeonato;

public class ControllerCampeonato {
    public static DaoCampeonato daoCampeonato;

    public Campeonato buscarCampeonatoPorId (Campeonato campeonato) throws SQLException, ClassNotFoundException {
        daoCampeonato = new DaoCampeonato();
        return daoCampeonato.buscar(campeonato);
    }

    public Campeonato inserirCampeonato (Campeonato campeonato) throws SQLException, ClassNotFoundException {
        daoCampeonato = new DaoCampeonato();
        return daoCampeonato.inserir(campeonato);
    }

    public Campeonato alterarCampeonato (Campeonato campeonato) throws SQLException, ClassNotFoundException {
        daoCampeonato = new DaoCampeonato();
        return daoCampeonato.alterar(campeonato);
    }

    public Campeonato excluirCampeonato (Campeonato campeonato) throws SQLException, ClassNotFoundException {
        daoCampeonato = new DaoCampeonato();
        return daoCampeonato.excluir(campeonato);
    }

    public List<Campeonato> listarCampeonato (Campeonato campeonato) throws SQLException, ClassNotFoundException {
        List<Campeonato> listCampeonatos = new ArrayList();
        daoCampeonato = new DaoCampeonato();
        listCampeonatos = daoCampeonato.listar(campeonato);
        return listCampeonatos;
    }
    
    public List<Campeonato> listarTodos () throws SQLException, ClassNotFoundException {
        List<Campeonato> listCampeonatos = new ArrayList();
        daoCampeonato = new DaoCampeonato();
        listCampeonatos = daoCampeonato.listarTodos();
        return listCampeonatos;
    }
}
