package com.taller4_gestion_inscripciones.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.taller4_gestion_inscripciones.backend.model.Inscripcion;


@Repository
public interface InscripcionRepository extends JpaRepository<Inscripcion, Long> {
	// JpaRepository ya incluye por defecto los métodos: findAll(), findById(), save(), deleteById()
}
