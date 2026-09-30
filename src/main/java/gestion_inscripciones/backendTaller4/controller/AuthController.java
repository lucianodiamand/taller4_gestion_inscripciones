package gestion_inscripciones.backendTaller4.controller;

import gestion_inscripciones.backendTaller4.dto.UsuarioRegisterRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioResponseDTO;
import gestion_inscripciones.backendTaller4.service.AuthService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/auth") // ruta base para todos los endpoints del controller 
@CrossOrigin(origins = "http://localhost:4200") // le indica al backend que acepta peticiones provenientes de ese origen.
public class AuthController {
	
	//instanciamos un servicio de autenticacion 
	private final AuthService authService;
    public AuthController(AuthService authService) {
        this.authService = authService;
    } 
    
    //se tiene que crear una cuenta
    @PostMapping("/register")
    // ResponseEntity es una clase de Spring que representa una respuesta HTTP completa
    // @RequestBodysirve para tomar el body de la petición http y convertir ese JSON en un objeto dto
    public ResponseEntity<UsuarioResponseDTO> registrar(@RequestBody UsuarioRegisterRequestDTO dto) {
        return ResponseEntity.ok(authService.registrar(dto)); // retorna el mensaje HTTP Status: 200 OK con el body
    }
    
    //ya tiene una cuenta
    @PostMapping("/login")
    public ResponseEntity<UsuarioResponseDTO> login(@RequestBody UsuarioRequestDTO dto) {
    	System.out.println("ENTRÓ AL LOGIN DEL CONTROLLER");
        return ResponseEntity.ok(authService.login(dto));
    }
    
    
}
