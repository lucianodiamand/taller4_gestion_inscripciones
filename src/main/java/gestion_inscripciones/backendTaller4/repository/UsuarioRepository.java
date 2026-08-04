package gestion_inscripciones.backendTaller4.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gestion_inscripciones.backendTaller4.entity.Usuario;



@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

	Optional<Usuario> findByUsername(String username);

	// JpaRepository ya incluye por defecto los métodos: findAll(), findById(), save(), deleteById()
}
