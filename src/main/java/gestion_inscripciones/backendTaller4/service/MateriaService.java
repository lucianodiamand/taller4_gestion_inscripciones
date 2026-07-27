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
    private MateriaRepository materiaRepository;
	
	@Autowired
    private CarreraRepository carreraRepository;

    // Obtener todas las materias (READ)
	public List<MateriaDTO> obtenerTodas() {
        return materiaRepository.findAll()
                .stream()
                .map(this::convertirADTO)
                .collect(Collectors.toList());
    }
	
    // Obtener por ID (READ)
	public Optional<MateriaDTO> obtenerPorId(Long id) {
        return materiaRepository.findById(id)
                .map(this::convertirADTO);
    }
	
	public MateriaDTO guardar(MateriaDTO dto) {
        Carrera carrera = carreraRepository.findById(dto.getCarreraId())
                .orElseThrow(() -> new RuntimeException("Carrera no encontrada"));

        Materia materia = new Materia();
        materia.setNombre(dto.getNombre());
        materia.setAnio(dto.getAnio());
        materia.setCuatrimestre(dto.getCuatrimestre());
        materia.setCarrera(carrera);

        Materia guardada = materiaRepository.save(materia);
        return convertirADTO(guardada);
    }
	
	public MateriaDTO actualizar(Long id, MateriaDTO dto) {
        Materia materia = materiaRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Materia no encontrada"));

        Carrera carrera = carreraRepository.findById(dto.getCarreraId())
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

        if (entidad.getCarrera() != null) {
            dto.setCarreraId(entidad.getCarrera().getId());
            dto.setNombreCarrera(entidad.getCarrera().getNombre());
        }
        return dto;
    }
	
}
