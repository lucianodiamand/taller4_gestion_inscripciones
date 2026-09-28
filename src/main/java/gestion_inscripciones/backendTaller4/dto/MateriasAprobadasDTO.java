package gestion_inscripciones.backendTaller4.dto;

import lombok.NoArgsConstructor;

//Este DTO es la respuesta, avisa al front que materias aprobo

@NoArgsConstructor
//@AllArgsConstructor
public class MateriasAprobadasDTO {

    private Long id;
    private Integer nota;
    private Long idIngresante;
    private String nombreIngresante;
    private Long idMateria;
    private String nombreMateria;
    
    public MateriasAprobadasDTO(
            Long id,
            Integer nota,
            Long ingresanteId,
            String nombreIngresante,
            Long materiaId,
            String nombreMateria) {

        this.id = id;
        this.nota = nota;
        this.idIngresante = ingresanteId;
        this.nombreIngresante = nombreIngresante;
        this.idMateria = materiaId;
        this.nombreMateria = nombreMateria;
    }
    
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getNota() {
        return nota;
    }

    public void setNota(Integer nota) {
        this.nota = nota;
    }

    public Long getIdIngresante() {
        return idIngresante;
    }

    public void setIdIngresante(Long idIngresante) {
        this.idIngresante = idIngresante;
    }

    public String getNombreIngresante() {
        return nombreIngresante;
    }

    public void setNombreIngresante(String nombreIngresante) {
        this.nombreIngresante = nombreIngresante;
    }

    public Long getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(Long idMateria) {
        this.idMateria = idMateria;
    }

    public String getNombreMateria() {
        return nombreMateria;
    }

    public void setNombreMateria(String nombreMateria) {
        this.nombreMateria = nombreMateria;
    }
    
}
	

