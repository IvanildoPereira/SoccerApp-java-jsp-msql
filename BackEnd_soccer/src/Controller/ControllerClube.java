package Controller;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import db.DaoClube;
import Bean.Clube;

public class ControllerClube {

    public static DaoClube daoClube;

    public Clube buscarClubePorId(Clube clube) throws SQLException, ClassNotFoundException {
        daoClube = new DaoClube();
        return daoClube.buscar(clube);
    }

    public Clube inserirClube(Clube clube) throws SQLException, ClassNotFoundException {
        daoClube = new DaoClube();
        return daoClube.inserir(clube);
    }

    public Clube alterarClube(Clube clube) throws SQLException, ClassNotFoundException {
        daoClube = new DaoClube();
        return daoClube.alterar(clube);
    }

    public Clube excluirClube(Clube clube) throws SQLException, ClassNotFoundException {
        daoClube = new DaoClube();
        return daoClube.excluir(clube);
    }

    public List<Clube> listarClube(Clube clube) throws SQLException, ClassNotFoundException {
        List<Clube> listClubes = new ArrayList();
        daoClube = new DaoClube();
        listClubes = daoClube.listar(clube);
        return listClubes;
    }
    
    public List<Clube> listarTodos() throws SQLException, ClassNotFoundException {
        List<Clube> listClubes = new ArrayList();
        daoClube = new DaoClube();
        listClubes = daoClube.listarTodos();
        return listClubes;
    }
}
