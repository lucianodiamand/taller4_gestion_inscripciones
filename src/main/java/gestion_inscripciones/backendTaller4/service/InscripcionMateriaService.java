package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
//import org.springframework.web.server.ResponseStatusException;

import gestion_inscripciones.backendTaller4.dto.InscripcionMateriaRequestDTO;
import gestion_inscripciones.backendTaller4.dto.InscripcionMateriaResponseDTO;
import gestion_inscripciones.backendTaller4.entity.InscripcionCarrera;
import gestion_inscripciones.backendTaller4.entity.InscripcionMateria;
import gestion_inscripciones.backendTaller4.entity.Materia;
import gestion_inscripciones.backendTaller4.repository.InscripcionCarreraRepository;
import gestion_inscripciones.backendTaller4.repository.InscripcionMateriaRepository;
import gestion_inscripciones.backendTaller4.repository.MateriaRepository;

@Service // para la logica de negocio
public class InscripcionMateriaService { 
	@Autowired
    private InscripcionMateriaRepository inscripcionMateriaRepository;

    @Autowired
    private InscripcionCarreraRepository inscripcionCarreraRepository;

    @Autowired
    private MateriaRepository materiaRepository;

    // Obtener todas las inscripciones (READ)
    public List<InscripcionMateriaResponseDTO> obtenerTodas() {
        return inscripcionMateriaRepository.findAll()
                .stream()
                .map(this::convertirAResponseDTO)
                .collect(Collectors.toList());
    }

    // Obtener por ID (READ)
    public Optional<InscripcionMateriaResponseDTO> obtenerPorId(Long id) {
        return inscripcionMateriaRepository.findById(id)
                .map(this::convertirAResponseDTO);
    }
    
    
    public List<InscripcionMateriaResponseDTO> obtenerPorIngresante(Long ingresanteId) {
        return inscripcionMateriaRepository.findByInscripcionCarreraIngresanteId(ingresanteId)
        		.stream()
                .map(this::convertirAResponseDTO)
                .collect(Collectors.toList());
    }
    
    //validacion para 1er año: 
    
    private void validarMateria(Materia materia) {
    	if(materia.getAnio() != 1 || materia.getCuatrimestre() != 1) {
    		throw new RuntimeException("Solo se permiten inscripciones a materias de primer año y primer cuatrimestre "); 
    	}
    }
    // Guardar / Crear inscripción (CREATE)
    public InscripcionMateriaResponseDTO guardar(InscripcionMateriaRequestDTO dto) {
        InscripcionCarrera insCarrera = inscripcionCarreraRepository.findById(dto.getInscripcionCarreraId())
                .orElseThrow(() -> new RuntimeException("Inscripción de Carrera no encontrada"));

        Materia materia = materiaRepository.findById(dto.getMateriaId())
                .orElseThrow(() -> new RuntimeException("Materia no encontrada"));

        validarMateria(materia);
        
        InscripcionMateria entidad = new InscripcionMateria();
        entidad.setFechaInscripcion(dto.getFechaInscripcion());
        entidad.setInscripcionCarrera(insCarrera);
        entidad.setMateria(materia);

        
        boolean existeInscripcion = inscripcionMateriaRepository.existsByInscripcionCarreraIdAndMateriaId(
        		dto.getInscripcionCarreraId(),
        		dto.getMateriaId());
        
        if(existeInscripcion) {
        	throw new IllegalArgumentException(
        			"El ingresante ya esta inscripto en esta materia"); 
        }
        
        InscripcionMateria guardada = inscripcionMateriaRepository.save(entidad);

        return convertirAResponseDTO(guardada);
    }
    
    // Actualizar inscripción (UPDATE)
    public InscripcionMateriaResponseDTO actualizar(Long id, InscripcionMateriaRequestDTO dto) {
        // 1. Buscamos la inscripción original
        InscripcionMateria entidad = inscripcionMateriaRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Inscripción a materia no encontrada"));

        // 2. Buscamos las nuevas relaciones
        InscripcionCarrera insCarrera = inscripcionCarreraRepository.findById(dto.getInscripcionCarreraId())
                .orElseThrow(() -> new RuntimeException("Inscripción de Carrera no encontrada"));

        Materia materia = materiaRepository.findById(dto.getMateriaId())
                .orElseThrow(() -> new RuntimeException("Materia no encontrada"));

        validarMateria(materia);
        // 3. Actualizamos los datos
        entidad.setFechaInscripcion(dto.getFechaInscripcion());
        entidad.setInscripcionCarrera(insCarrera);
        entidad.setMateria(materia);

        // 4. Guardamos y devolvemos el DTO
        InscripcionMateria actualizada = inscripcionMateriaRepository.save(entidad);
        return convertirAResponseDTO(actualizada);
    }
    
    // Eliminar inscripción (DELETE)
    public void eliminar(Long id) {
    	inscripcionMateriaRepository.deleteById(id);
    }
    
    private InscripcionMateriaResponseDTO convertirAResponseDTO(InscripcionMateria entidad) {
        InscripcionMateriaResponseDTO dto = new InscripcionMateriaResponseDTO();
        dto.setId(entidad.getId());
        dto.setFechaInscripcion(entidad.getFechaInscripcion());

        if (entidad.getInscripcionCarrera() != null) {
            dto.setInscripcionCarreraId(entidad.getInscripcionCarrera().getId());
        }

        if (entidad.getMateria() != null) {
        	dto.setMateriaId(entidad.getMateria().getId());
            dto.setNombreMateria(entidad.getMateria().getNombre());
        }

        return dto;
    }
    
}

