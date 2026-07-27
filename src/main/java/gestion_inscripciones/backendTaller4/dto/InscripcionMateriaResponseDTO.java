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
}