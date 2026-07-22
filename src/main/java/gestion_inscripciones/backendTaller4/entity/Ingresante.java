package gestion_inscripciones.backendTaller4.entity;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Ingresante {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nombre;

    @Column(nullable = false)
    private String apellido;

    @Column(nullable = false)
    private String tipoDocumento;
    
    @Column(nullable = false)
    private int numeroDocumento;
    
    @Column(nullable = false)
    private int edad;
    
    @Column(nullable = false)
    private String email;
    
   // @OneToMany(mappedBy = "ingresante") //nombre de la propiedad del otro lado que enlazo con esta entidad
   // private List<InscripcionCarrera> inscripciones;
    
}
