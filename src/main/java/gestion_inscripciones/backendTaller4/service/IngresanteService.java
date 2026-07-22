package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.entity.Ingresante;
import gestion_inscripciones.backendTaller4.repository.IngresanteRepository;


@Service // para la logica de negocio
public class IngresanteService { 
	@Autowired
    private IngresanteRepository ingresanteRepository;

    // Obtener todas las inscripciones (READ)
    public List<Ingresante> obtenerTodas() {
        return ingresanteRepository.findAll();
    }

    // Obtener por ID (READ)
    public Optional<Ingresante> obtenerPorId(Long id) {
        return ingresanteRepository.findById(id);
    }
    
 // Guardar / Crear inscripción (CREATE)
    public Ingresante guardar(Ingresante ingresante) {
        return ingresanteRepository.save(ingresante);
    }
    
 // Eliminar inscripción (DELETE)
    public void eliminar(Long id) {
    	ingresanteRepository.deleteById(id);
    }
    
}
