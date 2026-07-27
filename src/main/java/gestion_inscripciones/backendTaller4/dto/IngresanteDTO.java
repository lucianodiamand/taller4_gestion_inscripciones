package gestion_inscripciones.backendTaller4.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class IngresanteDTO {
    private Long id;
    private String nombre;
    private String apellido;
    private String tipoDocumento;
    private int numeroDocumento;
    private int edad;
    private String email;
}