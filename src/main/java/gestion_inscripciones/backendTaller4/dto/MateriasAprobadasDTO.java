package gestion_inscripciones.backendTaller4.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.AllArgsConstructor;

//Este DTO es la respuesta, avisa al front que materias aprobo

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MateriasAprobadasDTO {

    private Long id;
    private Integer nota;
    private Long idIngresante;
    private String nombreIngresante;
    private Long idMateria;
    private String nombreMateria;
}
	

