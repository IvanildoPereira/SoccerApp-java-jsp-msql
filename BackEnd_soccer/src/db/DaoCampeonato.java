package db;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;
import util.ConexaoDB;
import Bean.Campeonato;

public class DaoCampeonato {

    private final Connection c;

    public DaoCampeonato() throws SQLException, ClassNotFoundException {
        this.c = new ConexaoDB().getConnection();
    }

    // Buscar Campeonato
    public Campeonato buscar(Campeonato campeonato) throws SQLException {
        String sql = "select * from campeonatos WHERE id = ?";

        PreparedStatement stmt = this.c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1, campeonato.getId());
        // executa
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            // criando o objeto Usuario
            campeonato.setId(rs.getInt(1));
            campeonato.setImgCampeonato(rs.getString(2));
            campeonato.setNomeCampeonato(rs.getString(3));
            campeonato.setPremiacao(rs.getDouble(4));
            campeonato.setLocal(rs.getString(5));

            // adiciona o usu à lista de usus
        }

        stmt.close();
        c.close();

        return campeonato;

    }

    public Campeonato alterar(Campeonato campeonato) throws SQLException {
        String sql = "UPDATE campeonatos SET imgCampeonato = ?, nomeCampeonato = ?, premiacao = ?, local = ? WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setString(1, campeonato.getImgCampeonato());
        stmt.setString(2, campeonato.getNomeCampeonato());
        stmt.setDouble(3, campeonato.getPremiacao());
        stmt.setString(4, campeonato.getLocal());
        stmt.setInt(5,campeonato.getId());
        
        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return campeonato;
    }
    
    public Campeonato excluir(Campeonato campeonato) throws SQLException{
        String sql = "delete from campeonatos WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1,campeonato.getId());
        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return campeonato;
    }
    
        public Campeonato inserir(Campeonato campeonato) throws SQLException{
        String sql = "insert into campeonatos" + " (imgCampeonato, nomeCampeonato, premiacao, local)" + " values (?,?,?,?)";
    
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);

        // seta os valores
        stmt.setString(1,campeonato.getImgCampeonato());
        stmt.setString(2,campeonato.getNomeCampeonato());
        stmt.setDouble(3,campeonato.getPremiacao());
        stmt.setString(4, campeonato.getLocal());

        // executa
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            campeonato.setId(id);
        }
        stmt.close();
        c.close();
        return campeonato;
    }
        
    public List<Campeonato> listar(Campeonato campeonatoEnt) throws SQLException{
         // usus: array armazena a lista de registros

        List<Campeonato> campeonatos = new ArrayList<>();
        
        String sql = "select * from campeonatos where nomeCampeonato like ?";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        // seta os valores
        stmt.setString(1,"%" + campeonatoEnt.getNomeCampeonato() + "%");
        
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            // criando o objeto Campeonato
            Campeonato campeonato = new Campeonato(rs.getInt(1),rs.getString(2),rs.getString(3), rs.getDouble(4), rs.getString(5));
            // adiciona à lista de campeonatos
            campeonatos.add(campeonato);
        }
        
        rs.close();
        stmt.close();
        return campeonatos;
        
    }
    
        public List<Campeonato> listarTodos() throws SQLException{
         // usus: array armazena a lista de registros

        List<Campeonato> campeonatos = new ArrayList<>();
        
        String sql = "select * from campeonatos";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        // seta os valores
        
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            // criando o objeto Campeonato
            Campeonato campeonato = new Campeonato(rs.getInt(1),rs.getString(2),rs.getString(3), rs.getDouble(4), rs.getString(5));
            // adiciona à lista de campeonatos
            campeonatos.add(campeonato);
        }
        
        rs.close();
        stmt.close();
        return campeonatos;
        
    }
}
