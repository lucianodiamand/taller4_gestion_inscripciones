package gestion_inscripciones.backendTaller4.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Entity
@Table(name = "materias_aprobadas")
public class MateriasAprobadas {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	private Integer nota;
	
	//FetchType.LAZY solo traera los id de ingresante y materia con la nota
	@ManyToOne(fetch = FetchType.LAZY) 
    @JoinColumn(name = "id_ingresante", nullable = false)
    private Ingresante ingresante;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_materia", nullable = false)
    private Materia materia;
    
    // --- GETTERS & SETTERS ---
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public Ingresante getIngresante() {
        return ingresante;
    }

    public void setIngresante(Ingresante ingresante) {
        this.ingresante = ingresante;
    }

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

}
