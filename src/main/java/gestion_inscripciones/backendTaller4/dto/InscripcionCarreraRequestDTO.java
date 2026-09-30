package gestion_inscripciones.backendTaller4.dto;

import java.time.LocalDate;
import lombok.NoArgsConstructor;

@NoArgsConstructor
public class InscripcionCarreraRequestDTO { // información que va del front -> al back
    private LocalDate fechaInscripcion;
    private Long ingresanteId;
    private Long carreraId;
    
	public Long getIngresanteId() {
		return ingresanteId;
	}

	public Long getCarreraId() {
		return carreraId;
	}

	public LocalDate getFechaInscripcion() {
		return fechaInscripcion;
	}
}