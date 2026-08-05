package gestion_inscripciones.backendTaller4.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.dto.UsuarioRegisterRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioResponseDTO;
import gestion_inscripciones.backendTaller4.entity.Rol;
import gestion_inscripciones.backendTaller4.entity.Usuario;
import gestion_inscripciones.backendTaller4.repository.UsuarioRepository;

@Service
public class UsuarioService {

    private final UsuarioRepository usuarioRepository;
    private final PasswordEncoder passwordEncoder; //para encriptar contraseña
    public UsuarioService(UsuarioRepository usuarioRepository, PasswordEncoder passwordEncoder) {
        this.usuarioRepository = usuarioRepository;
        this.passwordEncoder = passwordEncoder; 
    }

    public UsuarioResponseDTO registrar(
            UsuarioRegisterRequestDTO dto) {

        if (usuarioRepository
                .findByUsername(dto.getUsername())
                .isPresent()) {

            throw new RuntimeException(
                    "El usuario ya existe.");
        }

        Usuario usuario = new Usuario();

        usuario.setUsername(dto.getUsername());

        usuario.setPassword(passwordEncoder.encode(dto.getPassword()));

        usuario.setRol(Rol.GUEST);

        usuario = usuarioRepository.save(usuario);

        UsuarioResponseDTO response =
                new UsuarioResponseDTO();

        response.setId(usuario.getId());
        response.setUsername(usuario.getUsername());
        response.setRol(usuario.getRol());

        return response;
    }

    public UsuarioResponseDTO login(
            UsuarioRequestDTO dto) {

        Usuario usuario =
                usuarioRepository.findByUsername(
                        dto.getUsername())
                        .orElseThrow(
                                () -> new RuntimeException(
                                        "Usuario inexistente."));

        if (!passwordEncoder.matches(
                dto.getPassword(),usuario.getPassword())) {
            throw new RuntimeException(
                    "Contraseña incorrecta.");
        }

        UsuarioResponseDTO response =
                new UsuarioResponseDTO();

        response.setId(usuario.getId());
        response.setUsername(usuario.getUsername());
        response.setRol(usuario.getRol());

        return response;
    }
}