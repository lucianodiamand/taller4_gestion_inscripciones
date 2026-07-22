package gestion_inscripciones.backendTaller4.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Materia {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nombre;
    
    @Column(nullable = false)
    private int anio;
    
    @Column(nullable = false)
    private int cuatrimestre;
    
    @ManyToOne (optional = false) //Especifico como es la relacion entre entidades. Muchas materias pertenecen a una carrera
    @JoinColumn(name = "carrera_id", nullable = false) 
    private Carrera carrera; //esto hace que en la bd haya un campo carrera_id, por lo que no haga falta que carrera conozca sus materias
}
