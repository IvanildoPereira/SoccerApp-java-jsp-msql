package Controller;

import Bean.ClubeCampeonato;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

public class TesteControllerClubeCampeonato {
    
    public TesteControllerClubeCampeonato() {
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
          ClubeCampeonato clubeCampeonato = new ClubeCampeonato(0,1,2,"TESTE RELACAO");
          ControllerClubeCampeonato controllerClubeCampeonato = new ControllerClubeCampeonato();
          clubeCampeonato = controllerClubeCampeonato.inserirClubeCampeonato(clubeCampeonato);
          assertEquals(1, clubeCampeonato.getId());
    }

    @Test
    public void busca() throws SQLException, ClassNotFoundException {
          ClubeCampeonato clubeCampeonato = new ClubeCampeonato(4,0,0,"");
          ControllerClubeCampeonato controllerClubeCampeonato = new ControllerClubeCampeonato();
          clubeCampeonato = controllerClubeCampeonato.buscarClubeCampeonatoPorId(clubeCampeonato);
          
          System.out.println("IMPRESSAO TESTE DE BUSCA " + clubeCampeonato.toString());
          
          assertEquals(4, clubeCampeonato.getId());
    }

    
    @Test
    public void lista() throws SQLException, ClassNotFoundException {
          ClubeCampeonato clubeCampeonato = new ClubeCampeonato(0,0,0,"RELACAO");
          ControllerClubeCampeonato controllerClubeCampeonato = new ControllerClubeCampeonato();
          List<ClubeCampeonato> listaFP = new ArrayList();
          listaFP = controllerClubeCampeonato.listarClubeCampeonato(clubeCampeonato);

          System.out.println("IMPRESSAO TESTE DE LISTA " + listaFP.get(0).toString());
          System.out.println("IMPRESSAO TESTE DE LISTA " + listaFP.get(1).toString());
          System.out.println("IMPRESSAO TESTE DE LISTA " + listaFP.get(2).toString());
          System.out.println("IMPRESSAO TESTE DE LISTA " + listaFP.get(3).toString());

          assertEquals(4, listaFP.get(0).getId());
    }
}
