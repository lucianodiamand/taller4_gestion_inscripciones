package gestion_inscripciones.backendTaller4.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import gestion_inscripciones.backendTaller4.dto.UsuarioRegisterRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioResponseDTO;
import gestion_inscripciones.backendTaller4.service.UsuarioService;

@RestController
@RequestMapping("/usuario")
@CrossOrigin(origins = "http://localhost:4200")
public class UsuarioController {

    private final UsuarioService usuarioService;

    public UsuarioController(
            UsuarioService usuarioService) {

        this.usuarioService = usuarioService;
    }

    @PostMapping("/register")
    public ResponseEntity<UsuarioResponseDTO> registrar(
            @RequestBody UsuarioRegisterRequestDTO dto) {

        return ResponseEntity.ok(
                usuarioService.registrar(dto));
    }

    @PostMapping("/login")
    public ResponseEntity<UsuarioResponseDTO> login(
            @RequestBody UsuarioRequestDTO dto) {

        return ResponseEntity.ok(
                usuarioService.login(dto));
    }
}