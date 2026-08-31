package gestion_inscripciones.backendTaller4.dto;

import java.time.LocalDate;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class InscripcionMateriaRequestDTO {
    private LocalDate fechaInscripcion;
    private Long inscripcionCarreraId;
    private Long materiaId;
    private Integer nota; 
    
	public Long getInscripcionCarreraId() {
		return inscripcionCarreraId;
	}


	public Long getMateriaId() {
		return materiaId;
	}


	public LocalDate getFechaInscripcion() {
		return fechaInscripcion;
	}
	
	public Integer getNota() {
		return nota; 
	}
	
	public void setNota(Integer nota) {
		this.nota = nota; 
	}
	
}