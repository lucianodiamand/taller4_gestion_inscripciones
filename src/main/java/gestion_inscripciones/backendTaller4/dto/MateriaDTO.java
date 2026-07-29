package gestion_inscripciones.backendTaller4.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MateriaDTO {
    private Long id;
    private String nombre;
    private int anio;
    private int cuatrimestre;
    private Long carreraId;
    private String nombreCarrera;
    
    
	public Long getCarreraId() {
		return carreraId;
	}


	public String getNombre() {
		return nombre;
	}


	public int getAnio() {
		return anio;
	}
	
	public Long getId() {
		return id;
	}


	public int getCuatrimestre() {
		return cuatrimestre;
	}


	public void setId(Long id) {
		this.id = id;
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


	public void setCarreraId(Long carreraId) {
		this.carreraId = carreraId;
	}
	
	public String getNombreCarrera() {
	    return nombreCarrera;
	}

	public void setNombreCarrera(String nombreCarrera) {
	    this.nombreCarrera = nombreCarrera;
	}
	
}