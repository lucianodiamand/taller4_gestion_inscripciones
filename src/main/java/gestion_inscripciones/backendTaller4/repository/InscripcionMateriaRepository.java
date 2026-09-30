package gestion_inscripciones.backendTaller4.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gestion_inscripciones.backendTaller4.entity.InscripcionMateria;


@Repository
public interface InscripcionMateriaRepository extends JpaRepository<InscripcionMateria, Long> {
	// Spring Data JPA crea la consulta SQL automáticamente basándose en la relación con la entidad Ingresante/Estudiante
	List<InscripcionMateria> findByInscripcionCarreraIngresanteId(Long ingresanteId);
	// JpaRepository ya incluye por defecto los métodos: findAll(), findById(), save(), deleteById()
	boolean existsByInscripcionCarreraIdAndMateriaId(Long inscripcionCarreraId, Long materiaId);
	//es una consulta que se hace sobre la bd. JPA genera la implementación automaticamente basándose en el nombre del método
	
	Optional<InscripcionMateria> findByInscripcionCarreraIngresanteIdAndMateriaId(Long ingresanteId, Long materiaId);
	// busca una inscripcion a materia cuya incripcion a carrera sea del id del ingresante y cuya materia tenga ese id
}
