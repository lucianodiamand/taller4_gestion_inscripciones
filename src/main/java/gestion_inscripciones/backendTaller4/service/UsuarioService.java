package gestion_inscripciones.backendTaller4.service;

import org.springframework.security.crypto.password.PasswordEncoder; // interfaz de Spring Security.
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
public class UsuarioService { // contiene implementacion más basica para registro/login que AuthService. No genera JWT

    private final UsuarioRepository usuarioRepository; // para inyectar el repo
    private final PasswordEncoder passwordEncoder; //para encriptar contraseña
    private final IngresanteRepository ingresanteRepository;
    
    public UsuarioService(UsuarioRepository usuarioRepository, IngresanteRepository ingresanteRepository, PasswordEncoder passwordEncoder) {
        this.usuarioRepository = usuarioRepository;
        this.ingresanteRepository = ingresanteRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public UsuarioResponseDTO registrar(UsuarioRegisterRequestDTO dto) { // recibe la info que el front envia al back

    	//como el resultado de findByUsername es Optional<Usuario>, isPresent devuelve true si existe y false si no
        if (usuarioRepository.findByUsername(dto.getUsername()).isPresent()) { // para que no se repitan nombres de usuario
            throw new RuntimeException("El usuario ya existe.");
        }

        Ingresante ingresante = new Ingresante(); // se crea el ingresante

        ingresante.setNombre(dto.getNombre());
        ingresante.setApellido(dto.getApellido());
        ingresante.setEmail(dto.getEmail());
        ingresante.setEdad(dto.getEdad());
        ingresante.setTipoDocumento(dto.getTipoDocumento());
        ingresante.setNumeroDocumento(dto.getNumeroDocumento());

        ingresante = ingresanteRepository.save(ingresante); // guarda el ingresante

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

    public UsuarioResponseDTO login(UsuarioRequestDTO dto) { // recibe lo emitido desde el frontend

        Usuario usuario = usuarioRepository.findByUsername(dto.getUsername()) // busca el usuario
        		.orElseThrow(() -> new RuntimeException("Usuario inexistente."));
       
        
        if (!passwordEncoder.matches( // comprobamos que la contraseña recibida coincida con la de la bd. 
                dto.getPassword(),usuario.getPassword())) {

            throw new RuntimeException(
                    "Contraseña incorrecta.");
        }

        UsuarioResponseDTO response = new UsuarioResponseDTO(); // crea la respuesta que se enviara del back al front

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