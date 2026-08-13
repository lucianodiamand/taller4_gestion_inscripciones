package gestion_inscripciones.backendTaller4.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.dto.UsuarioRegisterRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioResponseDTO;
import gestion_inscripciones.backendTaller4.entity.Ingresante;
import gestion_inscripciones.backendTaller4.entity.Rol;
import gestion_inscripciones.backendTaller4.entity.Usuario;
import gestion_inscripciones.backendTaller4.repository.IngresanteRepository;
import gestion_inscripciones.backendTaller4.repository.UsuarioRepository;

@Service
public class UsuarioService {

    private final UsuarioRepository usuarioRepository;
    private final PasswordEncoder passwordEncoder; //para encriptar contraseña
    private final IngresanteRepository ingresanteRepository;
    public UsuarioService(UsuarioRepository usuarioRepository, IngresanteRepository ingresanteRepository, PasswordEncoder passwordEncoder) {
        this.usuarioRepository = usuarioRepository;
        this.ingresanteRepository = ingresanteRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public UsuarioResponseDTO registrar(UsuarioRegisterRequestDTO dto) {

        if (usuarioRepository.findByUsername(dto.getUsername()).isPresent()) {
            throw new RuntimeException("El usuario ya existe.");
        }

        Ingresante ingresante = new Ingresante(); // se crea el ingresante

        ingresante.setNombre(dto.getNombre());
        ingresante.setApellido(dto.getApellido());
        ingresante.setEmail(dto.getEmail());
        ingresante.setEdad(dto.getEdad());
        ingresante.setTipoDocumento(dto.getTipoDocumento());
        ingresante.setNumeroDocumento(dto.getNumeroDocumento());

        ingresante = ingresanteRepository.save(ingresante);

        Usuario usuario = new Usuario(); // se crea el usuario
        usuario.setUsername(dto.getUsername());
        usuario.setPassword(passwordEncoder.encode(dto.getPassword()));
        usuario.setRol(Rol.GUEST);

        usuario.setIngresante(ingresante); // asociamos usuario con su ingresante

        usuario = usuarioRepository.save(usuario);

        UsuarioResponseDTO response = new UsuarioResponseDTO(); // creamos response

        response.setId(usuario.getId());
        response.setUsername(usuario.getUsername());
        response.setRol(usuario.getRol());
        response.setIngresanteId(ingresante.getId());

        return response;
    }

    public UsuarioResponseDTO login(UsuarioRequestDTO dto) {

        Usuario usuario = usuarioRepository.findByUsername(dto.getUsername())
        		.orElseThrow(() -> new RuntimeException("Usuario inexistente."));
        
        if (!passwordEncoder.matches(
                dto.getPassword(),usuario.getPassword())) {

            throw new RuntimeException(
                    "Contraseña incorrecta.");
        }

        UsuarioResponseDTO response = new UsuarioResponseDTO();

        response.setId(usuario.getId());
        response.setUsername(usuario.getUsername());
        response.setRol(usuario.getRol());
        
        if (usuario.getIngresante() != null) {
        	System.out.println("Ingresante ID: " + usuario.getIngresante().getId());
            response.setIngresanteId(usuario.getIngresante().getId());
        }

        return response;
    }
}