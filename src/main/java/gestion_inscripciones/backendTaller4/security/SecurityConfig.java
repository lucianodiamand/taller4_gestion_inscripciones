package gestion_inscripciones.backendTaller4.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

@Configuration // Esta clase contiene configuración de Spring
@EnableWebSecurity // Activa y configura la infraestructura de Spring Security para la aplicación web
public class SecurityConfig { // configura las reglas de seguridad de Spring Security
	
	@Autowired
    private JwtAuthenticationFilter jwtAuthenticationFilter;
	
	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http // Es un objeto que nos permite configurar cómo Spring Security va a proteger las peticiones
            .cors(Customizer.withDefaults()) //Usa Customizer.withDefaults() para vincular al Bean corsConfigurationSource
            .csrf(csrf -> csrf.disable()) // Deshabilitamos CSRF (Cross-Site Request Forgery).  
            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
            // STATELESS significa que el servidor no va a mantener una sesión HTTP tradicional para recordar al usuario. Cada petición trae su JWT
            .authorizeHttpRequests(auth -> auth // definimos que endpoints necesitan autenticación
                .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll() // permite todas las peticions OPTIONS
                .requestMatchers("/auth/**").permitAll() // Todas las URLs que comiencen con /auth/ pueden accederse sin estar autenticado
                .anyRequest().authenticated() // Cualquier otra petición a otra url requiere autenticación
            )
            .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
        //esto permite ejecutar nuestro jwtAuthenticationFilter antes del filtro estándar UsernamePasswordAuthenticationFilter

        return http.build(); // retornamos la SecurityFilterChain
    }

    @Bean
    public PasswordEncoder passwordEncoder() {  //crea un objeto BCryptPasswordEncoder
        return new BCryptPasswordEncoder(); // Encriptador estándar de contraseñas
        // esto permite obtener el hash de la contraseña y cuando hacemos matches verificamos si la contraseña corresponde al hash
    }
    
 // Configuración de CORS integrada directamente en Spring Security
    @Bean
    public CorsConfigurationSource corsConfigurationSource() { //representa una fuente de configuración CORS
        CorsConfiguration configuration = new CorsConfiguration(); // creamos objeto de configuración 
        configuration.setAllowedOrigins(List.of("http://localhost:4200"));// permitimos peticiones de esta url origen
        configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS")); // metodos permitidos 
        configuration.setAllowedHeaders(List.of("Authorization", "Content-Type", "Accept")); // headers permitidos (el mas importante es Authorization)
        configuration.setAllowCredentials(true); // permite credenciales en las peticiones CORS

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration); // esto permite que todas las rutas usen esta configuración
        return source;
    }
   
}
