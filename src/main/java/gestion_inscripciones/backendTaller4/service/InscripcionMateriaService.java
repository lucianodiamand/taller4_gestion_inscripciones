package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import gestion_inscripciones.backendTaller4.entity.InscripcionCarrera;
import gestion_inscripciones.backendTaller4.entity.InscripcionMateria;
import gestion_inscripciones.backendTaller4.repository.InscripcionMateriaRepository;

@Service // para la logica de negocio
public class InscripcionMateriaService { 
	@Autowired
    private InscripcionMateriaRepository inscripcionMateriaRepository;

    // Obtener todas las inscripciones (READ)
    public List<InscripcionMateria> obtenerTodas() {
        return inscripcionMateriaRepository.findAll();
    }

    // Obtener por ID (READ)
    public Optional<InscripcionMateria> obtenerPorId(Long id) {
        return inscripcionMateriaRepository.findById(id);
    }
    
 // Guardar / Crear inscripción (CREATE)
    public InscripcionMateria guardar(InscripcionMateria inscripcionMateria) {
        return inscripcionMateriaRepository.save(inscripcionMateria);
    }
    
 // Actualizar inscripción (UPDATE)
    public InscripcionMateria actualizar(Long id, InscripcionMateria inscripcionActualizada) {
        return inscripcionMateriaRepository.findById(id).map(inscripcion -> {
            inscripcion.setFechaInscripcion(inscripcionActualizada.getFechaInscripcion());
            inscripcion.setMateria(inscripcionActualizada.getMateria());
            inscripcion.setInscripcionCarrera(inscripcionActualizada.getInscripcionCarrera());
            return inscripcionMateriaRepository.save(inscripcion);
        }).orElseThrow(() -> new RuntimeException("Inscripción no encontrada con el id: " + id));
    }
    
 // Eliminar inscripción (DELETE)
    public void eliminar(Long id) {
    	inscripcionMateriaRepository.deleteById(id);
    }
    
}

