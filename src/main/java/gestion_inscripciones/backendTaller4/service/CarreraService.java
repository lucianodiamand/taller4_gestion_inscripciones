package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.dto.CarreraDTO;
import gestion_inscripciones.backendTaller4.entity.Carrera;
import gestion_inscripciones.backendTaller4.repository.CarreraRepository;



@Service // para la logica de negocio
public class CarreraService { 
	@Autowired
    private CarreraRepository carreraRepository;

    // Obtener todas las carreras (READ)
	public List<CarreraDTO> obtenerTodas() {
        return carreraRepository.findAll()
                .stream()
                .map(this::convertirADTO)
                .collect(Collectors.toList());
    }

    // Obtener por ID (READ)
	public Optional<CarreraDTO> obtenerPorId(Long id) {
        return carreraRepository.findById(id)
                .map(this::convertirADTO);
    }
	
	public CarreraDTO guardar(CarreraDTO dto) {
        Carrera carrera = new Carrera();
        carrera.setNombre(dto.getNombre());
        carrera.setDuracion(dto.getDuracion());

        Carrera guardada = carreraRepository.save(carrera);
        return convertirADTO(guardada);
    }
	
	public CarreraDTO actualizar(Long id, CarreraDTO dto) {
        Carrera carrera = carreraRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Carrera no encontrada"));

        carrera.setNombre(dto.getNombre());
        carrera.setDuracion(dto.getDuracion());

        Carrera actualizada = carreraRepository.save(carrera);
        return convertirADTO(actualizada);
    }
	
	public void eliminar(Long id) {
        carreraRepository.deleteById(id);
    }
	
	// Helper de mapeo
    private CarreraDTO convertirADTO(Carrera entidad) {
        CarreraDTO dto = new CarreraDTO();
        dto.setId(entidad.getId());
        dto.setNombre(entidad.getNombre());
        dto.setDuracion(entidad.getDuracion());
        return dto;
    }
    
}