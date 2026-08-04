package gestion_inscripciones.backendTaller4.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UsuarioRegisterRequestDTO { // para crear una nueva cuenta (registro)

    private String username;
    private String password;

    private String nombre;
    private String apellido;
    private String email;
    private Integer edad;
    private String tipoDocumento;
    private String numeroDocumento;
    
    
	public String getUsername() {
		return username;
	}


	public String getNombre() {
		return nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public int getEdad() {
		return edad;
	}
	
	public String getEmail() {
		return email;
	}


	public String getTipoDocumento() {
		return tipoDocumento;
	}
	
	public String getNumeroDocumento() {
		return numeroDocumento;
	}


	public String getPassword() {
		return password;
	}
}