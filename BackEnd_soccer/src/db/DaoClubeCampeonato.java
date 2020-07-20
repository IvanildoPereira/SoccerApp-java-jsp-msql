package db;
import Bean.ClubeCampeonato;
import util.ConexaoDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoClubeCampeonato {
    private final Connection c;
    
    public DaoClubeCampeonato() throws SQLException, ClassNotFoundException{
        this.c = new ConexaoDB().getConnection();
    }
    
    public ClubeCampeonato alterar(ClubeCampeonato clubeCampeonato) throws SQLException{
        String sql = "UPDATE clube_campeonato SET idClube = ?, idCampeonato = ?, descricao = ? WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1,clubeCampeonato.getIdClube());
        stmt.setInt(2,clubeCampeonato.getIdCampeonato());
        stmt.setString(3,clubeCampeonato.getDescricao());
        stmt.setInt(4,clubeCampeonato.getId());

        // executa
        stmt.execute();
        stmt.close();
        return clubeCampeonato;
    }

    public ClubeCampeonato excluir(ClubeCampeonato clubeCampeonato) throws SQLException{
        String sql = "delete from clube_campeonato WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1,clubeCampeonato.getId());
        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return clubeCampeonato;
    }


    public ClubeCampeonato inserir(ClubeCampeonato clubeCampeonato) throws SQLException{

        String sql = "insert into clube_campeonato" + " (idClube, idCampeonato, descricao)" + " values (?,?,?)";

        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);

        // seta os valores
        stmt.setInt(1,clubeCampeonato.getIdClube());
        stmt.setInt(2,clubeCampeonato.getIdCampeonato());
        stmt.setString(3,clubeCampeonato.getDescricao());

        // executa
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            clubeCampeonato.setId(id);
        }
        stmt.close();
        c.close();
        return clubeCampeonato;

    }
    
    public ClubeCampeonato buscar(ClubeCampeonato clubeCampeonato) throws SQLException{
        String sql = "select * from clube_campeonato WHERE id = ?";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
            // seta os valores
            stmt.setInt(1,clubeCampeonato.getId());
            // executa
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                // criando o objeto Usuario
                clubeCampeonato.setId(rs.getInt(1));
                clubeCampeonato.setIdClube(rs.getInt(2));
                clubeCampeonato.setIdCampeonato(rs.getInt(3));
                clubeCampeonato.setDescricao(rs.getString(4));
                // adiciona o usu à lista de usus
            }
        return clubeCampeonato;
    }
    
    public List<ClubeCampeonato> listar(ClubeCampeonato clubeCampeonato) throws SQLException{

        List<ClubeCampeonato> clubeCampeonatos = new ArrayList<>();
        
        String sql = "select * from clube_campeonato where descricao like ?";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        // seta os valores
        stmt.setString(1,"%" + clubeCampeonato.getDescricao()+ "%");
        
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            // criando o objeto Usuario
            ClubeCampeonato clubeCamp = new ClubeCampeonato(
                rs.getInt(1),
                rs.getInt(2),
                rs.getInt(3),
                rs.getString(4)
            );
            // adiciona o usu à lista de usus
            clubeCampeonatos.add(clubeCamp);
        }
        
        rs.close();
        stmt.close();
        return clubeCampeonatos;
    }
    
}
