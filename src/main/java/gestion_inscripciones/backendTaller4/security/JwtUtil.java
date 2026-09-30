package gestion_inscripciones.backendTaller4.security;

import io.jsonwebtoken.Jwts; //biblioteca jwt que permite construir JWT; parsearlos; leer claims; validar firmas.
import io.jsonwebtoken.SignatureAlgorithm; // Nos permite indicar qué algoritmo criptográfico utilizaremos para firmar el JWT
import io.jsonwebtoken.security.Keys; //Sirve para construir una clave criptográfica adecuada para HMAC.
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Value;

import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Date;


@Component
public class JwtUtil {

		@Value("${jwt.secret}") 
		// se utilizan para inyectar valores de configuración externos desde tu archivo application.properties
		private String secretKeyString; // coloca su valor aca

		@Value("${jwt.expiration}") // cuanto tiempo puede vivir el  token
		private long expirationTime; // colcoa su valor aca. Esto evita dejar claves secretas o tiempos de expiración fijos en el código
	
	    public String generarToken(String username, String rol) { // recibe username y rol y devuelve un string que sera jwt
	        return Jwts.builder() // construccion del jwt
	                .setSubject(username) // representa el sujeto/identidad del token (username)
	                .claim("rol", rol) // para agregar info (rol)
	                .setIssuedAt(new Date()) // guardamos cuando fue emitido el token
	                .setExpiration(new Date(System.currentTimeMillis() + expirationTime)) // seteamos fecha de expiracion
	                .signWith(getSigningKey(), SignatureAlgorithm.HS256) // se firma el jwt
	                .compact(); // Termina de construir el token y lo convierte en el String que enviamos al frontend
	   }
	    
	    // Genera la clave a partir de application.properties (linea 16 y 17)
	    private Key getSigningKey() { // construye la clave utilizada para firmar/verificar
	        byte[] keyBytes = secretKeyString.getBytes(StandardCharsets.UTF_8); // convierte el string a bytes
	        return Keys.hmacShaKeyFor(keyBytes); // Construimos una clave adecuada para HMAC-SHA y signWith la utiliza
	    }
	    
	   // Obtener el usuario (subject) guardado en el JWT
	   public String obtenerUsername(String token) { // recibe un jwt 
	        return Jwts.parserBuilder() // creamos un parser para analizar el jwt
	                .setSigningKey(getSigningKey()) // seteamos la clave secreta. Sirve para leer el token y comprobar si este JWT fue firmado con nuestra clave
	                .build() // construye el parser
	                .parseClaimsJws(token) // parsea el jwt y verifica la firma 
	                .getBody()
	                .getSubject(); // obtiene el subject
	   }

	   // Obtener el rol guardado en el JWT
	   public String obtenerRol(String token) {
	        return Jwts.parserBuilder()
	                .setSigningKey(getSigningKey())
	                .build()
	                .parseClaimsJws(token)
	                .getBody()
	                .get("rol", String.class);
	   }

	   // Validar si la firma es correcta y el token no ha expirado
	   public boolean validarToken(String token) {
	        try {
	            Jwts.parserBuilder()
	            		.setSigningKey(getSigningKey())
	            		.build()
	            		.parseClaimsJws(token);
	            return true;
	        } catch (Exception e) {
	            return false; // El token falló (expiro, fue alterado, etc.)
	        }
	   }
	   
}

