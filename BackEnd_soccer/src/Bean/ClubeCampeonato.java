package Bean;

public class ClubeCampeonato {
    private int id;
    private int idClube;
    private int idCampeonato;
    private String descricao;
    private Clube clube;
    private Campeonato campeonato;

    public ClubeCampeonato(int id, int idClube, int idCampeonato, String descricao) {
        this.id = id;
        this.idClube = idClube;
        this.idCampeonato = idCampeonato;
        this.descricao = descricao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdClube() {
        return idClube;
    }

    public void setIdClube(int idClube) {
        this.idClube = idClube;
    }

    public int getIdCampeonato() {
        return idCampeonato;
    }

    public void setIdCampeonato(int idCampeonato) {
        this.idCampeonato = idCampeonato;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Clube getClube() {
        return clube;
    }

    public void setClube(Clube clube) {
        this.clube = clube;
    }

    public Campeonato getCampeonato() {
        return campeonato;
    }

    public void setCampeonato(Campeonato campeonato) {
        this.campeonato = campeonato;
    }

    @Override
    public String toString() {
        return "ClubeCampeonato{" + "id=" + id + ", idClube=" + idClube + ", idCampeonato=" + idCampeonato + ", descricao=" + descricao + " Nome Clube = " + clube.getNomeClube() + " Campeonato = "+ campeonato.getNomeCampeonato()+'}';
    }

    
        
    
    
}
