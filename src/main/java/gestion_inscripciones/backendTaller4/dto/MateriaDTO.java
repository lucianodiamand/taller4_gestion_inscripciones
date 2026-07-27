package gestion_inscripciones.backendTaller4.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MateriaDTO {
    private Long id;
    private String nombre;
    private int anio;
    private int cuatrimestre;
    private Long carreraId;
    private String nombreCarrera;
}