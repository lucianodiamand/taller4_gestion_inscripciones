package gestion_inscripciones.backendTaller4.security;

import org.springframework.boot.CommandLineRunner; // interfaz de spring que permite ejecutar determinado código automáticamente cuando arranca la aplicación
import org.springframework.security.crypto.password.PasswordEncoder; // Importamos la interfaz que utilizamos para generar/verificar hashes de contraseñas.

import gestion_inscripciones.backendTaller4.entity.Rol;
import gestion_inscripciones.backendTaller4.entity.Usuario;
import gestion_inscripciones.backendTaller4.repository.UsuarioRepository;

import org.springframework.stereotype.Component;

@Component // Esto hace que Spring cree un objeto de DataInitializer automáticamente.
public class DataInitializer implements CommandLineRunner {
	// CommandLineRunner es una interfaz que obliga a usar el metodo run 
	
	private final UsuarioRepository usuarioRepository;
    private final PasswordEncoder passwordEncoder;
    
    public DataInitializer(UsuarioRepository usuarioRepository, PasswordEncoder passwordEncoder) {
        this.usuarioRepository = usuarioRepository;
        this.passwordEncoder = passwordEncoder;
    }

	@Override
	public void run(String... args) throws Exception {
		// run se ejecuta cuando Spring Boot termina de iniciar la aplicación.
		// Verifica si el usuario 'admin' ya existe en la base de datos
        if (usuarioRepository.findByUsername("admin").isEmpty()) {
            
            Usuario admin = new Usuario();//creamos el usuario
            admin.setUsername("admin");		//nombre de usuario
            admin.setPassword(passwordEncoder.encode("321contradeladmin123")); //contraseña
            admin.setRol(Rol.ADMIN);   // Asignamos rol de admin
            admin.setIngresante(null); // NULL, no hay un ingresante vinculado

            usuarioRepository.save(admin);
            
            System.out.println("----------------------------------------");
            System.out.println("✅ USUARIO ADMIN CREADO EXITOSAMENTE");
            System.out.println("----------------------------------------");
		
        }
	}	
}
