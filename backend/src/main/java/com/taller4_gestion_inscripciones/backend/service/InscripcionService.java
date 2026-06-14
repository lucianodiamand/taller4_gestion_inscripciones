package com.taller4_gestion_inscripciones.backend.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taller4_gestion_inscripciones.backend.model.Inscripcion;
import com.taller4_gestion_inscripciones.backend.repository.InscripcionRepository;



@Service
public class InscripcionService {
	@Autowired
    private InscripcionRepository inscripcionRepository;

    // Obtener todas las inscripciones (READ)
    public List<Inscripcion> obtenerTodas() {
        return inscripcionRepository.findAll();
    }

    // Obtener por ID (READ)
    public Optional<Inscripcion> obtenerPorId(Long id) {
        return inscripcionRepository.findById(id);
    }

    // Guardar / Crear inscripción (CREATE)
    public Inscripcion guardar(Inscripcion inscripcion) {
        return inscripcionRepository.save(inscripcion);
    }

    // Actualizar inscripción (UPDATE)
    
    /*  FALTA IMPLEMENTAR LOS SETTERS Y GETTERS 
     * 
    public Inscripcion actualizar(Long id, Inscripcion inscripcionActualizada) {
        return inscripcionRepository.findById(id).map(inscripcion -> {
            inscripcion.setNombreEstudiante(inscripcionActualizada.getNombreEstudiante());
            inscripcion.setEmailEstudiante(inscripcionActualizada.getEmailEstudiante());
            inscripcion.setCurso(inscripcionActualizada.getCurso());
            inscripcion.setFechaInscripcion(inscripcionActualizada.getFechaInscripcion());
            return inscripcionRepository.save(inscripcion);
        }).orElseThrow(() -> new RuntimeException("Inscripción no encontrada con el id: " + id));
    }
    
    */
    
    // Eliminar inscripción (DELETE)
    public void eliminar(Long id) {
        inscripcionRepository.deleteById(id);
    }
}

