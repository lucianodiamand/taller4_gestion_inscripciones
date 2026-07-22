package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.entity.Carrera;
import gestion_inscripciones.backendTaller4.repository.CarreraRepository;



@Service // para la logica de negocio
public class CarreraService { 
	@Autowired
    private CarreraRepository carreraRepository;

    // Obtener todas las carreras (READ)
    public List<Carrera> obtenerTodas() {
        return carreraRepository.findAll();
    }

    // Obtener por ID (READ)
    public Optional<Carrera> obtenerPorId(Long id) {
        return carreraRepository.findById(id);
    }
    
}
