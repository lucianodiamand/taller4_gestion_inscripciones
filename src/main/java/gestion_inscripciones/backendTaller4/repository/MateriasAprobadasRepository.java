package gestion_inscripciones.backendTaller4.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import gestion_inscripciones.backendTaller4.entity.MateriasAprobadas;

@Repository
public interface MateriasAprobadasRepository extends JpaRepository<MateriasAprobadas, Long>{

	List<MateriasAprobadas> findByIngresanteId(Long idIngresante);
    List<MateriasAprobadas> findByMateriaId(Long idMateria);
}
