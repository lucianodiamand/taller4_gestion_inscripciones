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
    private String numeroDocumento;
    private int edad;
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
    
    public String getNumeroDocumento() {
    	return numeroDocumento;
    }
    
    public void setNumeroDocumento(String numeroDocumento) {
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

}