package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.entity.InscripcionCarrera;
import gestion_inscripciones.backendTaller4.repository.InscripcionCarreraRepository;




@Service // para la logica de negocio
public class InscripcionCarreraService { 
	@Autowired
    private InscripcionCarreraRepository inscripcionCarrera;

    // Obtener todas las inscripciones (READ)
    public List<InscripcionCarrera> obtenerTodas() {
        return inscripcionCarrera.findAll();
    }

    // Obtener por ID (READ)
    public Optional<InscripcionCarrera> obtenerPorId(Long id) {
        return inscripcionCarrera.findById(id);
    }

    // Guardar / Crear inscripción (CREATE)
    public InscripcionCarrera guardar(InscripcionCarrera inscripcion) {
        return inscripcionCarrera.save(inscripcion);
    }

    
    
    // Actualizar inscripción (UPDATE)
    public InscripcionCarrera actualizar(Long id, InscripcionCarrera inscripcionActualizada) {
        return inscripcionCarrera.findById(id).map(inscripcion -> {
            inscripcion.setFechaInscripcion(inscripcionActualizada.getFechaInscripcion());
            inscripcion.setIngresante(inscripcionActualizada.getIngresante());
            inscripcion.setCarrera(inscripcionActualizada.getCarrera());
            return inscripcionCarrera.save(inscripcion);
        }).orElseThrow(() -> new RuntimeException("Inscripción no encontrada con el id: " + id));
    }
    
    
    // Eliminar inscripción (DELETE)
    public void eliminar(Long id) {
        inscripcionCarrera.deleteById(id);
    }
}
