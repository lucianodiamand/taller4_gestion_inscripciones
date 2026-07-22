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
public class InscripcionCarrera {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private LocalDate fechaInscripcion;

    @ManyToOne (optional = false) //Especifico como es la relacion entre entidades. Muchas inscripciones o ninguna pertenecen a un ingresante
    @JoinColumn(name = "estudiante_id", nullable = false)// Define la columna que une dos tablas (fk) para relaciones entre entidades
    // establezco el nombre de la columna y si puede ser null
    private Ingresante ingresante;
    
    @ManyToOne (optional = false) //Una carrera puede tener 0 o muchos inscriptos
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

}
