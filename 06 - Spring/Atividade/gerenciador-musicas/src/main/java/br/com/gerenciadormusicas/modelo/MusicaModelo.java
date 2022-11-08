package br.com.gerenciadormusicas.modelo;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "musica")
@Getter
@Setter
public class MusicaModelo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long cdMusica;

    @NotBlank(message = "O nome da música não pode estar vazio.")
    @Column(nullable = false)
    private String nmMusica;

    @URL(message = "Esse registro precisa ser um link")
    private String dsLink;
}
