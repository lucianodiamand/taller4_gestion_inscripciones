package gestion_inscripciones.backendTaller4.dto;

import java.time.LocalDate;
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
}