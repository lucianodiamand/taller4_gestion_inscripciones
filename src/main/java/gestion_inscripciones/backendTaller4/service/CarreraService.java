package gestion_inscripciones.backendTaller4.service;

import java.util.List; // para devolver multiples elementos 
import java.util.Optional; // cuando un elemento puede existir o no 
import java.util.stream.Collectors; // para terminar operaciones de stream

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.dto.CarreraDTO; // datos que van backend <--> frontend
import gestion_inscripciones.backendTaller4.entity.Carrera; // entidad bd 
import gestion_inscripciones.backendTaller4.repository.CarreraRepository; // acceso a bd 



@Service // para la logica de negocio
public class CarreraService { 
	@Autowired // para inyectar automaticamente el repositorio 
    private CarreraRepository carreraRepository;

    // Obtener todas las carreras (READ)
	public List<CarreraDTO> obtenerTodas() {
        return carreraRepository.findAll()
                .stream() // convierte la lista en un stream que permite procesar cada elemento 
                .map(this::convertirADTO) // por cada carrera ejecuta convertirADTO
                .collect(Collectors.toList()); // junta todos los DTO nuevamente en una lista 
    }

    // Obtener por ID (READ)
	public Optional<CarreraDTO> obtenerPorId(Long id) { // devuelve optional porque la carrera puede existir o no 
        return carreraRepository.findById(id)
                .map(this::convertirADTO);
    }
	
	public CarreraDTO guardar(CarreraDTO dto) { // aca entra un response DTO frontend --> backend deesde el controller
        Carrera carrera = new Carrera(); // creamos la entidad para guardarla en la bd 
        carrera.setNombre(dto.getNombre());
        carrera.setDuracion(dto.getDuracion());

        Carrera guardada = carreraRepository.save(carrera); // guardamos la carrera en la bd 
        return convertirADTO(guardada);
    }
	
	public CarreraDTO actualizar(Long id, CarreraDTO dto) { // recibe el id de la carrera a modificar y los nuevos datos 
        Carrera carrera = carreraRepository.findById(id) // para buscar la carrera en la bd 
                .orElseThrow(() -> new RuntimeException("Carrera no encontrada"));

        carrera.setNombre(dto.getNombre()); // si existe se modifica
        carrera.setDuracion(dto.getDuracion());

        Carrera actualizada = carreraRepository.save(carrera); // se guardan los cambios 
        return convertirADTO(actualizada);
    }
	
	public void eliminar(Long id) { // recibe el id 
        carreraRepository.deleteById(id);
    }
	
	// Helper de mapeo para crear el dto 
    private CarreraDTO convertirADTO(Carrera entidad) {
        CarreraDTO dto = new CarreraDTO();
        dto.setId(entidad.getId());
        dto.setNombre(entidad.getNombre());
        dto.setDuracion(entidad.getDuracion());
        return dto;
    }
    
}