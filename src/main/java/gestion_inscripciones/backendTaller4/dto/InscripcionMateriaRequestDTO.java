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
}