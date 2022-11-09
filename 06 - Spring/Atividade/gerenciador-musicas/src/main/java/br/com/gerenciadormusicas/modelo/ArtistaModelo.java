package br.com.gerenciadormusicas.modelo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "artista")
@Getter
@Setter
public class ArtistaModelo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long cdArtista;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "Informe um nome para o artista.")
    @Size(min = 3, max = 50, message = "O nome precisa possuir mais que 3 caracteres e menos que 50")
    private String nmArtista;

    @OneToMany
    @JoinColumn(name = "cd_artista")
    private List<MusicaModelo> musicas;


}
