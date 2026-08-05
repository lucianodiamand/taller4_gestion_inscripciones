package gestion_inscripciones.backendTaller4.security;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Value;

import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Date;


@Component
public class JwtUtil {

		@Value("${jwt.secret}")
		private String secretKeyString;

		@Value("${jwt.expiration}")
		private long expirationTime;
	
	    public String generarToken(String username, String rol) {
	        return Jwts.builder()
	                .setSubject(username)
	                .claim("rol", rol)
	                .setIssuedAt(new Date())
	                .setExpiration(new Date(System.currentTimeMillis() + expirationTime))
	                .signWith(getSigningKey(), SignatureAlgorithm.HS256)
	                .compact();
	   }
	    
	    // Genera la clave a partir de application.properties (linea 16 y 17)
	    private Key getSigningKey() {
	        byte[] keyBytes = secretKeyString.getBytes(StandardCharsets.UTF_8);
	        return Keys.hmacShaKeyFor(keyBytes);
	    }
	    
	   // Obtener el usuario (subject) guardado en el JWT
	   public String obtenerUsername(String token) {
	        return Jwts.parserBuilder()
	                .setSigningKey(getSigningKey())
	                .build()
	                .parseClaimsJws(token)
	                .getBody()
	                .getSubject();
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

