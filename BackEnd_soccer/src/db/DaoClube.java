package db;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;
import util.ConexaoDB;
import Bean.Clube;

public class DaoClube {
    private final Connection c;

    public DaoClube() throws SQLException, ClassNotFoundException {
        this.c = new ConexaoDB().getConnection();
    }
    
     public Clube buscar(Clube clube) throws SQLException{
        String sql = "SELECT * FROM clubes where id = ?;";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
            // seta os valores
            stmt.setInt(1, clube.getId());
            // executa
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                // criando o objeto Usuario
                clube.setId(rs.getInt(1));
                clube.setImgClube(rs.getString(2));
                clube.setNomeClube(rs.getString(3));
                clube.setAnoFundacao(rs.getString(4));
                // adiciona o usu à lista de usus
            }
            stmt.close();
            c.close();
            
        return clube;
    }
     
       public Clube alterar(Clube clube) throws SQLException{
        String sql = "UPDATE clubes SET imgClube = ?, nomeClube = ?, anoFundacao = ? WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setString(1,clube.getImgClube());
        stmt.setString(2,clube.getNomeClube());
        stmt.setString(3,clube.getAnoFundacao());
        stmt.setInt(4,clube.getId());

        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return clube;
    }
       
       public Clube excluir(Clube clube) throws SQLException{
        String sql = "delete from clubes WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1,clube.getId());
        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return clube;
    }
       
       public Clube inserir(Clube clube) throws SQLException{
        String sql = "insert into clubes" + " (imgClube, nomeClube, anoFundacao)" + " values (?,?,?)";
    
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);

        // seta os valores
        stmt.setString(1,clube.getImgClube());
        stmt.setString(2,clube.getNomeClube());
        stmt.setString(3,clube.getAnoFundacao());

        // executa
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            clube.setId(id);
        }
        stmt.close();
        c.close();
        return clube;
    }
       
    public List<Clube> listar(Clube clubeEnt) throws SQLException{
         // usus: array armazena a lista de registros

        List<Clube> clubes = new ArrayList<>();
        
        String sql = "select * from clubes where nomeClube like ?";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        // seta os valores
        stmt.setString(1,"%" + clubeEnt.getNomeClube() + "%");
        
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            // criando o objeto Clube
            Clube clube = new Clube(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
            // adiciona alista de clubes
            clubes.add(clube);
        }
        
        rs.close();
        stmt.close();
        return clubes;
        
    }
    
    public List<Clube> listarTodos() throws SQLException{
         // usus: array armazena a lista de registros

        List<Clube> clubes = new ArrayList<>();
        
        String sql = "select * from clubes";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        // seta os valores
           
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            // criando o objeto Clube
            Clube clube = new Clube(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
            // adiciona alista de clubes
            clubes.add(clube);
        }
        
        rs.close();
        stmt.close();
        return clubes;
        
    }
}
