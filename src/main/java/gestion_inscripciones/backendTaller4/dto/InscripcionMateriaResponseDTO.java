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
          
    private String numeroDocumento; //para ademas de los datos de la inscripcion, poder ver este dato del ingresante
    private String nombreIngresante;
    private String apellidoIngresante;
    
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

	public void setNumeroDocumento(String numeroDocumento) {
		this.numeroDocumento = numeroDocumento;
		}
	
	public String getNumeroDocumento() {
	    return numeroDocumento;
	}
	
	public String getNombreIngresante() {
	    return nombreIngresante;
	}

	public void setNombreIngresante(String nombreIngresante) {
	    this.nombreIngresante = nombreIngresante;
	}

	public String getApellidoIngresante() {
	    return apellidoIngresante;
	}

	public void setApellidoIngresante(String apellidoIngresante) {
	    this.apellidoIngresante = apellidoIngresante;
	}

}