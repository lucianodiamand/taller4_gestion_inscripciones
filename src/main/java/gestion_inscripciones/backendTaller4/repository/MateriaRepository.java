package gestion_inscripciones.backendTaller4.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gestion_inscripciones.backendTaller4.entity.Materia;

@Repository
public interface MateriaRepository extends JpaRepository<Materia, Long> {

	// JpaRepository ya incluye por defecto los métodos: findAll(), findById(), save(), deleteById()
	List<Materia> findByCarreraId(Long carreraId); // metodo para listar las materias de una carrera especifica
}
