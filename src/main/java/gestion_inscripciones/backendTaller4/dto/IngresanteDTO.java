package gestion_inscripciones.backendTaller4.dto;

//imports para las validaciones
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class IngresanteDTO {
	
    private Long id;
    
    //  Nombre y Apellido: Solo letras y espacios
    @NotBlank(message = "El nombre es obligatorio")
    @Pattern(regexp = "^[a-zA-Z\\s]+$", message = "El nombre solo puede contener letras")
    private String nombre;
    @NotBlank(message = "El apellido es obligatorio")
    @Pattern(regexp = "^[a-zA-Z\\s]+$", message = "El apellido solo puede contener letras")
    private String apellido;
    
    @NotBlank(message = "El tipo de documento es obligatorio")
    private String tipoDocumento;
    
    @NotBlank(message = "El número de documento es obligatorio")
    private String numeroDocumento;
    
    // Edad entre 1 y 100
    @NotNull(message = "La edad es obligatoria")
    @Min(value = 1, message = "La edad debe ser mayor o igual a 1")
    @Max(value = 100, message = "La edad no puede ser mayor a 100")
    private int edad;
    
    // Email: Debe contener al menos un "@"
    @NotBlank(message = "El email es obligatorio")
    @Pattern(regexp = ".*@.*", message = "El email debe contener un '@'")
    private String email;
    
    
    //gettesr y setters
    public Long getId() { return id; }
    public void setId(Long id) {this.id = id;}
    
    public String getNombre() {return nombre;}
    public void setNombre(String nombre) { this.nombre = nombre; }
    
    public String getApellido() {return apellido;}
    public void setApellido(String apellido) { this.apellido = apellido; }
    
    public String getTipoDocumento() { return tipoDocumento; }
    public void setTipoDocumento(String tipoDocumento) { this.tipoDocumento = tipoDocumento;}
    
    public String getNumeroDocumento() {return numeroDocumento;}
    public void setNumeroDocumento(String numeroDocumento) {this.numeroDocumento = numeroDocumento;}
    
    public int getEdad() {return edad;}
    public void setEdad(int edad) {this.edad = edad;}
    
    public String getEmail() {return email;}
    public void setEmail(String email) {this.email = email;}

}