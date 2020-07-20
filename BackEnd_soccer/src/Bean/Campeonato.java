package Bean;

public class Campeonato {
    private int id;
    private String imgCampeonato;
    private String nomeCampeonato;
    private Double premiacao;
    private String local;

    public Campeonato(int id, String imgCampeonato, String nomeCampeonato, Double premiacao, String local) {
        this.id = id;
        this.imgCampeonato = imgCampeonato; 
        this.nomeCampeonato = nomeCampeonato;
        this.premiacao = premiacao;
        this.local = local;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
     public String getImgCampeonato() {
        return imgCampeonato;
    }

    public void setImgCampeonato(String imgCampeonato) {
        this.imgCampeonato = imgCampeonato;
    }

    public String getNomeCampeonato() {
        return nomeCampeonato;
    }

    public void setNomeCampeonato(String nomeCampeonato) {
        this.nomeCampeonato = nomeCampeonato;
    }

    public Double getPremiacao() {
        return premiacao;
    }

    public void setPremiacao(Double premiacao) {
        this.premiacao = premiacao;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }
    
    
}
