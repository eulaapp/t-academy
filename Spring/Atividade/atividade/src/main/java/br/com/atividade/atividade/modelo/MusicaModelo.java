package br.com.atividade.atividade.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "musica")
public class MusicaModelo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String nome;
    private String artista;
    private String link_video;

    @ManyToMany(mappedBy = "musicas")
    private List<ArtistaModelo> artistas = new ArrayList<>();


    public long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getArtista() {
        return this.artista;
    }

    public void setArtista(String artista) {
        this.artista = artista;
    }

    public String getLink_video() {
        return this.link_video;
    }

    public void setLink_video(String link_video) {
        this.link_video = link_video;
    }

    public List<ArtistaModelo> getArtistas() {
        return this.artistas;
    }

    public void setArtistas(List<ArtistaModelo> artistas) {
        this.artistas = artistas;
    }

}
