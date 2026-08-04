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
	 private Rol role;
	 private String token;
}
