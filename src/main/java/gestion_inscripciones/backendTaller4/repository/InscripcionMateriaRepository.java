package gestion_inscripciones.backendTaller4.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gestion_inscripciones.backendTaller4.entity.InscripcionMateria;


@Repository
public interface InscripcionMateriaRepository extends JpaRepository<InscripcionMateria, Long> {

	// JpaRepository ya incluye por defecto los métodos: findAll(), findById(), save(), deleteById()
}
