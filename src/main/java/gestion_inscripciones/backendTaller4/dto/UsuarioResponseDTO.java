package gestion_inscripciones.backendTaller4.dto;

import gestion_inscripciones.backendTaller4.entity.Rol;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UsuarioResponseDTO {

	 private Long id;
	 private String username;
	 private Rol rol;
	 private String token;
	
	 public void setId(Long id) {
		    this.id = id;
		}

	 public void setUsername(String username) {
		    this.username = username;
		}

	 public void setRol(Rol rol) {
		    this.rol = rol;
		}

	 public void setToken(String token) {
		    this.token = token;
		}
		
	 public Long getId() {
		    return id;
		}

	 public String getUsername() {
		    return username;
		}

	 public Rol getRol() {
		    return rol;
		}

	 public String getToken() {
		    return token;
		}
}
