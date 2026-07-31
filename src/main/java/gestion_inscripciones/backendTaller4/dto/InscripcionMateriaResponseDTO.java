package gestion_inscripciones.backendTaller4.dto;

import java.time.LocalDate;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class InscripcionMateriaResponseDTO {
    private Long id;
    private LocalDate fechaInscripcion;
    
    // Datos de la inscripción a carrera de origen
    private Long inscripcionCarreraId;
    
    // Datos de la Materia
    private Long materiaId;
    private String nombreMateria;
    
    
	public void setId(Long id) {
		this.id = id;
	}


	public void setFechaInscripcion(LocalDate fechaInscripcion) {
		this.fechaInscripcion = fechaInscripcion;
	}


	public void setInscripcionCarreraId(Long inscripcionCarreraId) {
		this.inscripcionCarreraId = inscripcionCarreraId;
	}

	public void setNombreMateria(String nombreMateria) {
		this.nombreMateria = nombreMateria;
	}


	public void setMateriaId(Long materiaId) {
		this.materiaId = materiaId;
	}
	
	public Long getId() { 
		return id; 
	}
	
	public LocalDate getFechaInscripcion() { 
		return fechaInscripcion; 
	}
	
	public Long getInscripcionCarreraId() { 
		return inscripcionCarreraId; 
	}
	
	public Long getMateriaId() { 
		return materiaId; 
	}
	
	public String getNombreMateria() { 
		return nombreMateria; 
	}
}