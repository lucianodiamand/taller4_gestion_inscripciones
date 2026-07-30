package gestion_inscripciones.backendTaller4.dto;

import java.time.LocalDate;

import gestion_inscripciones.backendTaller4.entity.Carrera;
import gestion_inscripciones.backendTaller4.entity.Ingresante;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class InscripcionCarreraResponseDTO {
    private Long id;
    private LocalDate fechaInscripcion;
    
    // Datos del Ingresante
    private Long ingresanteId;
    private String nombreIngresante;
    private String apellidoIngresante;
    
    // Datos de la Carrera
    private Long carreraId;
    private String nombreCarrera;
    
    
    public LocalDate getFechaInscripcion() {
        return fechaInscripcion;
    }

    public void setFechaInscripcion(LocalDate fechaInscripcion) {
        this.fechaInscripcion = fechaInscripcion;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public Long getIngresanteId() {
        return ingresanteId;
    }

    public void setIngresanteId(Long ingresanteId) {
        this.ingresanteId = ingresanteId;
    }
    
    public String getNombreIngresante() {return nombreIngresante;}
    public void setNombreIngresante(String nombreIngresante) {this.nombreIngresante = nombreIngresante;}
    
    public String getApellidoIngresante() {return apellidoIngresante;}
    public void setApellidoIngresante(String apellidoIngresante) {this.apellidoIngresante = apellidoIngresante;}

    public Long getCarreraId() {return carreraId;}
    public void setCarreraId(Long carreraId) {this.carreraId = carreraId;}
    
    public void setNombreCarrera(String nombreCarrera) {this.nombreCarrera = nombreCarrera;}
    public String getNombreCarrera() {return nombreCarrera;}
}