package br.com.atividade.atividade.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "usuario")
public class UsuarioModelo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private Boolean isAdmin;
    private String nome;

    @ManyToMany
    @JoinTable(
        name = "playlist_usuario",
        joinColumns = {@JoinColumn(name = "usuario_codigo", referencedColumnName = "codigo")},
        inverseJoinColumns = {@JoinColumn(name = "playlist_codigo", referencedColumnName = "codigo")}
    )
    private List<PlaylistModelo> playlists = new ArrayList<>();


    public long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public Boolean isIsAdmin() {
        return this.isAdmin;
    }

    public Boolean getIsAdmin() {
        return this.isAdmin;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<PlaylistModelo> getPlaylists() {
        return this.playlists;
    }

    public void setPlaylists(List<PlaylistModelo> playlists) {
        this.playlists = playlists;
    }

}
