package gestion_inscripciones.backendTaller4.entity;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Ingresante {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nombre;

    @Column(nullable = false)
    private String apellido;

    @Column(nullable = false)
    private String tipoDocumento;
    
    @Column(nullable = false)
    private int numeroDocumento;
    
    @Column(nullable = false)
    private int edad;
    
    @Column(nullable = false)
    private String email;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public String getNombre() {
    	return nombre;
    }
    
    public void setNombre(String nombre) {
    	this.nombre = nombre;
    }
    
    public String getApellido() {
    	return apellido;
    }
    
    public void setApellido(String apellido) {
    	this.apellido = apellido;
    }
    
    public String getTipoDocumento() {
    	return tipoDocumento;
    }
    
    public void setTipoDocumento(String tipoDocumento) {
    	this.tipoDocumento = tipoDocumento;
    }
    
    public int getNumeroDocumento() {
    	return numeroDocumento;
    }
    
    public void setNumeroDocumento(int numeroDocumento) {
    	this.numeroDocumento = numeroDocumento;
    }
    
    public int getEdad() {
    	return edad;
    }
    
    public void setEdad(int edad) {
    	this.edad = edad;
    }
    
    public String getEmail() {
    	return email;
    }
    
    public void setEmail(String email) {
    	this.email = email;
    }
    
   // @OneToMany(mappedBy = "ingresante") //nombre de la propiedad del otro lado que enlazo con esta entidad
   // private List<InscripcionCarrera> inscripciones;
    
}
