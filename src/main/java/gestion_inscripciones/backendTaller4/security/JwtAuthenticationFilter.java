package gestion_inscripciones.backendTaller4.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Collections;

@Component
// OncePerRequestFilter es un tipo especializado de filtro HTTP de Spring y que se ejecuta una vez por petición
public class JwtAuthenticationFilter extends OncePerRequestFilter { // conecta el JWT generado anteriormente con cada petición posterior

    @Autowired
    private JwtUtil jwtUtil;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
    //HttpServletRequest representa la peticion que esta llegando
    // HttpServletResponse representa la respuesta que eventualmente devolverá el servidor
    // FilterChain representa la cadena de filtros 
            throws ServletException, IOException {

        String authHeader = request.getHeader("Authorization"); // Busca el header HTTP Authorization: ...

        if (authHeader != null && authHeader.startsWith("Bearer ")) { // si el header no es nulo y empieza con Bearer 
            String token = authHeader.substring(7); // para extraer el token jwt

            if (jwtUtil.validarToken(token)) {// si el token es valido obtiene username y rol 
                String username = jwtUtil.obtenerUsername(token);
                String rol = jwtUtil.obtenerRol(token);

                // Asignamos el rol obtenido del JWT y la autorización de cada uno para decidir que puede hacer
                SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + rol);

                UsernamePasswordAuthenticationToken authentication = // crea un objeto que representa a un usuario que esta autenticado
                        new UsernamePasswordAuthenticationToken(username, null, Collections.singletonList(authority));
                        // recibe username, credenciales (null porque se esta autenticando jwt en evz de la contraseña), la autoridad segun el rol

                // Registramos al usuario en el contexto de seguridad de Spring que de acuerdo a la peticion va a tener distintas autoridades
                SecurityContextHolder.getContext().setAuthentication(authentication);
            }
        }

        filterChain.doFilter(request, response); // continua con la siguiente capa..
    }
}