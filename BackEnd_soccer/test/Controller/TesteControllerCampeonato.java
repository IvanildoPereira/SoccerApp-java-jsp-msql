package Controller;

import Bean.Campeonato;
import java.sql.SQLException;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

public class TesteControllerCampeonato {

    public TesteControllerCampeonato() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }
    
    @Test
    public void inserir() throws SQLException, ClassNotFoundException {
        Campeonato campeonato = new Campeonato(4,"", "Liga Espanhola", 1200000.00, "Espanha");
        ControllerCampeonato controllerCampeonato = new ControllerCampeonato();
        campeonato = controllerCampeonato.inserirCampeonato(campeonato);
        assertEquals("Liga Espanhola", campeonato.getNomeCampeonato());
    }

    @Test
    public void alterar() throws SQLException, ClassNotFoundException {
        Campeonato campeonato = new Campeonato(1, "","Liga Inglesa A", 1300000.00, "Inglaterra");
        ControllerCampeonato controllerCampeonato = new ControllerCampeonato();
        campeonato = controllerCampeonato.alterarCampeonato(campeonato);
        assertEquals("Liga Inglesa A", campeonato.getNomeCampeonato());
    }

    @Test
    public void buscar() throws SQLException, ClassNotFoundException {
        Campeonato campeonato = new Campeonato(2, "","", null, "");
        ControllerCampeonato controllerCampeonato = new ControllerCampeonato();
        campeonato = controllerCampeonato.buscarCampeonatoPorId(campeonato);
        assertEquals("Brasileirao A", campeonato.getNomeCampeonato());
    }

    @Test
    public void excluir() throws SQLException, ClassNotFoundException {
        Campeonato campeonato = new Campeonato(3,"", "", null, "");
        ControllerCampeonato controllerCampeonato = new ControllerCampeonato();
        campeonato = controllerCampeonato.excluirCampeonato(campeonato);
        assertEquals(3, campeonato.getId());
    }
}
