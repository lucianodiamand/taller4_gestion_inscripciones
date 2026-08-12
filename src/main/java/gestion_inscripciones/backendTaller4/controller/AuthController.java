package gestion_inscripciones.backendTaller4.controller;

import gestion_inscripciones.backendTaller4.dto.UsuarioRegisterRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioResponseDTO;
import gestion_inscripciones.backendTaller4.service.AuthService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@CrossOrigin(origins = "http://localhost:4200")
public class AuthController {
	
	//instanciamos un servicio de autenticacion 
	private final AuthService authService;
    public AuthController(AuthService authService) {
        this.authService = authService;
    } 
    
    //se tiene que crear una cuenta
    @PostMapping("/register")
    public ResponseEntity<UsuarioResponseDTO> registrar(@RequestBody UsuarioRegisterRequestDTO dto) {
        return ResponseEntity.ok(authService.registrar(dto));
    }
    
    //ya tiene una cuenta
    @PostMapping("/login")
    public ResponseEntity<UsuarioResponseDTO> login(@RequestBody UsuarioRequestDTO dto) {
    	System.out.println("ENTRÓ AL LOGIN DEL CONTROLLER");
        return ResponseEntity.ok(authService.login(dto));
    }
    
    
}
