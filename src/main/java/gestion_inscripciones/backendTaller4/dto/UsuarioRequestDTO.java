package gestion_inscripciones.backendTaller4.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
public class UsuarioRequestDTO { // sirve para que un usuario existente inicie sesion (login)
	private String username;
    private String password;
    
    
	public String getUsername() {
		return username;
	}


	public String getPassword() {
		return password;
	}
}
