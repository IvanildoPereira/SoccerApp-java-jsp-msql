package Bean;

import java.util.Date;

public class Clube {
    private int id;
    private String imgClube;
    private String nomeClube;
    private String anoFundacao;

    public Clube(int id, String imgClube,String nomeClube, String anoFundacao) {
        this.id = id;
        this.imgClube = imgClube;
        this.nomeClube = nomeClube;
        this.anoFundacao = anoFundacao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getImgClube() {
        return imgClube;
    }

    public void setImgClube(String imgClube) {
        this.imgClube = imgClube;
    }
    
    public String getNomeClube() {
        return nomeClube;
    }

    public void setNomeClube(String nomeClube) {
        this.nomeClube = nomeClube;
    }

    public String getAnoFundacao() {
        return anoFundacao;
    }

    public void setAnoFundacao(String anoFundacao) {
        this.anoFundacao = anoFundacao;
    }
    
    
}
