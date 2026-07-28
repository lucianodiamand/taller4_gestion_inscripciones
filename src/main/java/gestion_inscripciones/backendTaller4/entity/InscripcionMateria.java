package gestion_inscripciones.backendTaller4.entity;

import java.time.LocalDate;

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
public class InscripcionMateria {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private LocalDate fechaInscripcion;
    
    
    @ManyToOne(optional = false)//una inscripcion a carrera puede tener 0 o muchas inscripciones a meaterias 
    @JoinColumn(name = "inscripcion_carrera_id", nullable = false) //para determinar a que carrera pertenece la inscripcion
    private InscripcionCarrera inscripcionCarrera;

    @ManyToOne(optional = false)// una materia puede tener 0 o muchos ingresantes inscriptos
    @JoinColumn(name = "materia_id", nullable = false)
    private Materia materia;
    
    public LocalDate getFechaInscripcion() {
        return fechaInscripcion;
    }

    public void setFechaInscripcion(LocalDate fechaInscripcion) {
        this.fechaInscripcion = fechaInscripcion;
    }


    public InscripcionCarrera getInscripcionCarrera() {
        return inscripcionCarrera;
    }

    public void setInscripcionCarrera(InscripcionCarrera inscripcionCarrera) {
        this.inscripcionCarrera = inscripcionCarrera;
    }


    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

	public Long getId() {
		return id;
	}
    
}
