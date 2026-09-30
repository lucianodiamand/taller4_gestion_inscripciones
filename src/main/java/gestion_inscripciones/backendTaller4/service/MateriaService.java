package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.dto.MateriaDTO;
import gestion_inscripciones.backendTaller4.entity.Carrera;
import gestion_inscripciones.backendTaller4.entity.Materia;
import gestion_inscripciones.backendTaller4.repository.CarreraRepository;
import gestion_inscripciones.backendTaller4.repository.MateriaRepository;

@Service // para la logica de negocio
public class MateriaService { 
	@Autowired
    private MateriaRepository materiaRepository; // para acceder a materias
	
	@Autowired
    private CarreraRepository carreraRepository; // para acceder a carreras

    // Obtener todas las materias (READ)
	public List<MateriaDTO> obtenerTodas() {
        return materiaRepository.findAll()
                .stream()
                .map(this::convertirADTO)
                .collect(Collectors.toList());
    }
	
	// Obtener materias de una carrera
	public List<MateriaDTO> obtenerPorCarrera(Long carreraId) {

	    return materiaRepository.findByCarreraId(carreraId)
	            .stream()
	            .map(this::convertirADTO)
	            .collect(Collectors.toList());
	}
	
    // Obtener por ID (READ)
	public Optional<MateriaDTO> obtenerPorId(Long id) {
        return materiaRepository.findById(id)
                .map(this::convertirADTO);
    }
	
	public MateriaDTO guardar(MateriaDTO dto) { // crear una materia a partir de lo recibido por el dto frontend --> backend
        Carrera carrera = carreraRepository.findById(dto.getCarreraId()) // buscamos a que carrera pertenece la materia
                .orElseThrow(() -> new RuntimeException("Carrera no encontrada"));

        Materia materia = new Materia(); // creamos la materia 
        materia.setNombre(dto.getNombre());
        materia.setAnio(dto.getAnio());
        materia.setCuatrimestre(dto.getCuatrimestre());
        materia.setCarrera(carrera);

        Materia guardada = materiaRepository.save(materia); // la guardamos en la bd 
        return convertirADTO(guardada);
    }
	
	public MateriaDTO actualizar(Long id, MateriaDTO dto) { // recibe el id y el dto con la nueva info
        Materia materia = materiaRepository.findById(id) // busca la materia en la bd 
                .orElseThrow(() -> new RuntimeException("Materia no encontrada"));

        Carrera carrera = carreraRepository.findById(dto.getCarreraId()) // busca a que carrera pertenece la materia
                .orElseThrow(() -> new RuntimeException("Carrera no encontrada"));

        materia.setNombre(dto.getNombre());
        materia.setAnio(dto.getAnio());
        materia.setCuatrimestre(dto.getCuatrimestre());
        materia.setCarrera(carrera);

        Materia actualizada = materiaRepository.save(materia);
        return convertirADTO(actualizada);
    }
	
	public void eliminar(Long id) {
        materiaRepository.deleteById(id);
    }
	
	private MateriaDTO convertirADTO(Materia entidad) {
        MateriaDTO dto = new MateriaDTO();
        dto.setId(entidad.getId());
        dto.setNombre(entidad.getNombre());
        dto.setAnio(entidad.getAnio());
        dto.setCuatrimestre(entidad.getCuatrimestre());

        if (entidad.getCarrera() != null) {// si bien una materia siempre tiene una carrera asociada, es una comprobación. No contradice a optional = false
            dto.setCarreraId(entidad.getCarrera().getId());
            dto.setNombreCarrera(entidad.getCarrera().getNombre());
        }
        
        if(entidad.getCorrelativas() != null) { // si tiene correlativas setea sus datos
        	dto.setCorrelativasIds(entidad.getCorrelativas().stream().map(Materia::getId).collect(Collectors.toList()));
        }
        
        return dto;
        
    }
	
}
