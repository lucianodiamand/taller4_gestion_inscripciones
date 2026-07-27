package gestion_inscripciones.backendTaller4.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CarreraDTO {
	private Long id;
    private String nombre;
    private float duracion;
}
