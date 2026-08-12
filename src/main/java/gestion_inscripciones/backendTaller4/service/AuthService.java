package gestion_inscripciones.backendTaller4.service;

import gestion_inscripciones.backendTaller4.dto.UsuarioRegisterRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioRequestDTO;
import gestion_inscripciones.backendTaller4.dto.UsuarioResponseDTO;
import gestion_inscripciones.backendTaller4.entity.Ingresante;
import gestion_inscripciones.backendTaller4.entity.Rol;
import gestion_inscripciones.backendTaller4.entity.Usuario;
import gestion_inscripciones.backendTaller4.repository.IngresanteRepository;
import gestion_inscripciones.backendTaller4.repository.UsuarioRepository;
import gestion_inscripciones.backendTaller4.security.JwtUtil;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthService {
	
	private final UsuarioRepository usuarioRepository;  //para login
    private final IngresanteRepository ingresanteRepository; //en caso de que haya que registrarlo
    private final JwtUtil jwtUtil; //asistencia en seguridad
    private final PasswordEncoder passwordEncoder; //para encriptar contraseña
    
    public AuthService(UsuarioRepository usuarioRepository, 
            IngresanteRepository ingresanteRepository, 
            JwtUtil jwtUtil,PasswordEncoder passwordEncoder) {
    	this.usuarioRepository = usuarioRepository;
    	this.ingresanteRepository = ingresanteRepository;
    	this.jwtUtil = jwtUtil;
    	this.passwordEncoder =passwordEncoder;
    	}
    
    
    //se creo la cuenta, asiq vamos a registrarlo como ingresante
    @Transactional
    public UsuarioResponseDTO registrar(UsuarioRegisterRequestDTO dto) {
        if (usuarioRepository.findByUsername(dto.getUsername()).isPresent()) {
            throw new RuntimeException("El nombre de usuario ya se encuentra registrado");
        }

        // Crear y guardar los datos del Ingresante
        Ingresante ingresante = new Ingresante();
        ingresante.setNombre(dto.getNombre());
        ingresante.setApellido(dto.getApellido());
        ingresante.setEmail(dto.getEmail());
        ingresante.setEdad(dto.getEdad());
        ingresante.setTipoDocumento(dto.getTipoDocumento());
        ingresante.setNumeroDocumento(dto.getNumeroDocumento());
        
        Ingresante ingresanteGuardado = ingresanteRepository.save(ingresante);

        //Crear y guardar el Usuario asociado al Ingresante
        Usuario usuario = new Usuario();
        usuario.setUsername(dto.getUsername());
        usuario.setPassword(passwordEncoder.encode(dto.getPassword())); //encriptamos la contraseña
        usuario.setRol(Rol.GUEST); // Se asigna rol por defecto
        usuario.setIngresante(ingresanteGuardado);

        Usuario usuarioGuardado = usuarioRepository.save(usuario);

        //instanciamos el token que sera guardado localmente
        String token = jwtUtil.generarToken(usuarioGuardado.getUsername(), usuarioGuardado.getRol().name());

        UsuarioResponseDTO response = new UsuarioResponseDTO();
        response.setId(usuarioGuardado.getId());
        response.setUsername(usuarioGuardado.getUsername());
        response.setRol(usuarioGuardado.getRol());
        response.setToken(token);
        response.setIngresanteId(ingresanteGuardado.getId());

        return response;
    }
    
    //ya tiene cuenta asiq solo lo logueamos 
    public UsuarioResponseDTO login(UsuarioRequestDTO dto) {
    	//buscamos match de usuarios
        Usuario usuario = usuarioRepository.findByUsername(dto.getUsername())	
                .orElseThrow(() -> new RuntimeException("Credenciales inválidas"));
        
        //buscamos match de contraseñas encriptadas
        if ((!passwordEncoder.matches(dto.getPassword(), usuario.getPassword()))) { 
            throw new RuntimeException("Credenciales inválidas");
        }
        
        //instanciamos el token que sera guardado localmente
        String token = jwtUtil.generarToken(usuario.getUsername(), usuario.getRol().name());

        UsuarioResponseDTO response = new UsuarioResponseDTO();
        response.setId(usuario.getId());
        response.setUsername(usuario.getUsername());
        response.setRol(usuario.getRol());
        response.setToken(token);
        response.setIngresanteId(usuario.getIngresante().getId());

        return response;
    }

}
