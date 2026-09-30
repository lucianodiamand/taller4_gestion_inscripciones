package gestion_inscripciones.backendTaller4.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
public class InscripcionCarrera { // inscripcion de un ingresante a una carrera
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private LocalDate fechaInscripcion;

    @ManyToOne (optional = false) //Muchas inscripciones o ninguna pertenecen a un ingresante
    @JoinColumn(name = "estudiante_id", nullable = false)// Define la columna que une dos tablas (fk) para relaciones entre entidades
    // establezco el nombre de la columna y si puede ser null
    private Ingresante ingresante;
    
    @ManyToOne (optional = false) //Muchas inscripciones a carrera pueden pertenecer a una carrera
    @JoinColumn(name = "carrera_id", nullable = false) // Define la columna que une dos tablas (fk) para relaciones entre entidades
    private Carrera carrera;
    
    public LocalDate getFechaInscripcion() {
        return fechaInscripcion;
    }

    public void setFechaInscripcion(LocalDate fechaInscripcion) {
        this.fechaInscripcion = fechaInscripcion;
    }


    public Ingresante getIngresante() {
        return ingresante;
    }

    public void setIngresante(Ingresante ingresante) {
        this.ingresante = ingresante;
    }


    public Carrera getCarrera() {
        return carrera;
    }

    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }

	public Long getId() {
		return id;
	}

	

}
