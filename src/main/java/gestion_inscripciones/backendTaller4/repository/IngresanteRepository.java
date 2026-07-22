package gestion_inscripciones.backendTaller4.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gestion_inscripciones.backendTaller4.entity.Ingresante;




@Repository
public interface IngresanteRepository extends JpaRepository<Ingresante, Long> {

	// JpaRepository ya incluye por defecto los métodos: findAll(), findById(), save(), deleteById()
}