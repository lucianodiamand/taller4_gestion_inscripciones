package gestion_inscripciones.backendTaller4.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//Este DTO es el request de la planilla

@Getter
@Setter
@NoArgsConstructor
public class AsignarNotaDTO {
	@NotNull(message = "El ID de la inscripción es obligatorio")
    private Long idInscripcion;

    @NotNull(message = "La nota es obligatoria")
    @Min(value = 0, message = "La nota mínima es 0")
    @Max(value = 10, message = "La nota máxima es 10")
    private Integer nota;

	public Long getIdInscripcion() {
		return idInscripcion;
	}

	public Integer getNota() {
		return nota;
	}
}
