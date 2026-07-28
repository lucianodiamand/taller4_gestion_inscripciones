package gestion_inscripciones.backendTaller4.entity;

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
public class Carrera {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nombre;
    
    @Column(nullable = false)
    private float duracion;
    
    public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public Float getDuracion() {
		return duracion;
	}
	
	public void setDuracion(float duracion) {
		this.duracion = duracion;
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
    
   // @OneToMany(mappedBy = "carrera") //nombre de la propiedad del otro lado que enlazo con esta entidad
   // private List<InscripcionCarrera> inscripciones;

}

