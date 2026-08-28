package gestion_inscripciones.backendTaller4.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
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

    @ManyToMany
    @JoinTable( // relaciono la entidad materia consigo misma con una tabla intermedia
        name = "materia_correlativa",
        joinColumns = @JoinColumn(name = "materia_id", nullable = false), // representa la materia desde la que estoy partiendo
        inverseJoinColumns = @JoinColumn(name = "correlativa_id", nullable = false) // representa la materia relacionada a la anterior (la correlativa)
    )
    private List<Materia> correlativas;
    
    
	public Long getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setAnio(int anio) {
		this.anio = anio;
	}

	public void setCuatrimestre(int cuatrimestre) {
		this.cuatrimestre = cuatrimestre;
	}

	public void setCarrera(Carrera carrera) {
		this.carrera = carrera;
	}

	public int getAnio() {
		return anio;
	}

	public int getCuatrimestre() {
		return cuatrimestre;
	}

	public Carrera getCarrera() {
		return carrera;
	}

	public List<Materia> getCorrelativas() {
		return correlativas;
	}
}
