package Controller;

import Bean.Clube;
import java.sql.SQLException;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

public class TesteControllerClube {

    public TesteControllerClube() {
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
        Clube clube = new Clube(4,"" ,"Palmeiras", "1914");
        ControllerClube controllerClube = new ControllerClube();
        clube = controllerClube.inserirClube(clube);
        assertEquals("Palmeiras", clube.getNomeClube());
    }
    
    @Test
    public void alterar() throws SQLException, ClassNotFoundException {
        Clube clube = new Clube(1,"", "Juventus de Turin", "1898");
        ControllerClube controllerClube = new ControllerClube();
        clube = controllerClube.alterarClube(clube);
        assertEquals("Juventus de Turin", clube.getNomeClube());
    }
    
     @Test
    public void buscar() throws SQLException, ClassNotFoundException {
        Clube clube = new Clube(2,"", "", "");
        ControllerClube controllerClube = new ControllerClube();
        clube = controllerClube.buscarClubePorId(clube);
        assertEquals("Barcelona", clube.getNomeClube());
    }

    @Test
    public void excluir() throws SQLException, ClassNotFoundException {
        Clube clube = new Clube(3, "","", "");
        ControllerClube controllerClube = new ControllerClube();
        clube = controllerClube.excluirClube(clube);
        assertEquals(3, clube.getId());
    }
 
}
