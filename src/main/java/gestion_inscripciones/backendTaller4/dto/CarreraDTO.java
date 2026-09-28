package gestion_inscripciones.backendTaller4.dto;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class CarreraDTO {
	private Long id;
    private String nombre;
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
	
}
