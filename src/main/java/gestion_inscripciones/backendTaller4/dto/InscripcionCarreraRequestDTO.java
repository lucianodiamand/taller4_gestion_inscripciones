package gestion_inscripciones.backendTaller4.dto;

import java.time.LocalDate;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class InscripcionCarreraRequestDTO {
    private LocalDate fechaInscripcion;
    private Long ingresanteId;
    private Long carreraId;
}