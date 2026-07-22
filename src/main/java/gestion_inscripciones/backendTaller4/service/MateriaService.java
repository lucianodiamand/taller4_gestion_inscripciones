package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.entity.Materia;
import gestion_inscripciones.backendTaller4.repository.MateriaRepository;

@Service // para la logica de negocio
public class MateriaService { 
	@Autowired
    private MateriaRepository materiaRepository;

    // Obtener todas las materias (READ)
    public List<Materia> obtenerTodas() {
        return materiaRepository.findAll();
    }

    // Obtener por ID (READ)
    public Optional<Materia> obtenerPorId(Long id) {
        return materiaRepository.findById(id);
    }
    
}
