package gestion_inscripciones.backendTaller4.security;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;

import gestion_inscripciones.backendTaller4.entity.Rol;
import gestion_inscripciones.backendTaller4.entity.Usuario;
import gestion_inscripciones.backendTaller4.repository.UsuarioRepository;

import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {
	
	private final UsuarioRepository usuarioRepository;
    private final PasswordEncoder passwordEncoder;
    
    public DataInitializer(UsuarioRepository usuarioRepository, PasswordEncoder passwordEncoder) {
        this.usuarioRepository = usuarioRepository;
        this.passwordEncoder = passwordEncoder;
    }

	@Override
	public void run(String... args) throws Exception {
		// Verifica si el usuario 'admin' ya existe en la base de datos
        if (usuarioRepository.findByUsername("admin").isEmpty()) {
            
            Usuario admin = new Usuario();//creamos el usuario
            admin.setUsername("admin");		//nombre de usuario
            admin.setPassword(passwordEncoder.encode("321constradeladmin123")); //contraseña
            admin.setRol(Rol.ADMIN);   // Asignamos rol de admin
            admin.setIngresante(null); // NULL, no hay un ingresante vinculado

            usuarioRepository.save(admin);
            
            System.out.println("----------------------------------------");
            System.out.println("✅ USUARIO ADMIN CREADO EXITOSAMENTE");
            System.out.println("----------------------------------------");
		
        }
	}	
}
