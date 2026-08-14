package gestion_inscripciones.backendTaller4.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gestion_inscripciones.backendTaller4.entity.InscripcionCarrera;
import gestion_inscripciones.backendTaller4.entity.Materia;



@Repository
public interface InscripcionCarreraRepository extends JpaRepository<InscripcionCarrera, Long> {
	// JpaRepository ya incluye por defecto los métodos: findAll(), findById(), save(), deleteById()
	List<InscripcionCarrera> findByIngresanteId(Long ingresanteId);
	boolean existsByIngresanteIdAndCarreraId(Long ingresanteId, Long carreraId);
}
