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
    
    private boolean materiaAprobada(Long ingresanteId, Long materiaId) {

        Optional<InscripcionMateria> inscripcion = // busca si el ingresante tiene una incripcion existente a la materia con ese id
            inscripcionMateriaRepository
                .findByInscripcionCarreraIngresanteIdAndMateriaId(ingresanteId, materiaId);

        if (inscripcion.isPresent() && inscripcion.get().getNota() != null && inscripcion.get().getNota() >= 6) {
            return true;
        } // si encuentra una inscripcion, su nota no es null y es mayor o igual a 6

        return false;
    }
    
    private void validarCorrelativas(Long ingresanteId, Materia materia) {

        if (materia.getCorrelativas() == null || materia.getCorrelativas().isEmpty()) {
            return;
        }

        for (Materia correlativa : materia.getCorrelativas()) {// recorro las correlativas de una materia
            if (!materiaAprobada(ingresanteId, correlativa.getId())) { // si no esta aprobada..
                throw new IllegalArgumentException(
                    "No puede inscribirse a "
                    + materia.getNombre()
                    + " porque no aprobó "
                    + correlativa.getNombre()
                );
            }
        }
    }
    
    /*
    //validacion para 1er año: 
    
    private void validarMateria(Materia materia) {
    	if(materia.getAnio() != 1 || materia.getCuatrimestre() != 1) {
    		throw new RuntimeException("Solo se permiten inscripciones a materias de primer año y primer cuatrimestre "); 
    	}
    }*/
    // Guardar / Crear inscripción (CREATE)
    public InscripcionMateriaResponseDTO guardar(InscripcionMateriaRequestDTO dto) {
        InscripcionCarrera insCarrera = inscripcionCarreraRepository.findById(dto.getInscripcionCarreraId())
                .orElseThrow(() -> new RuntimeException("Inscripción de Carrera no encontrada"));

        Materia materia = materiaRepository.findById(dto.getMateriaId())
                .orElseThrow(() -> new RuntimeException("Materia no encontrada"));
        
        Long ingresanteId = insCarrera.getIngresante().getId();
        
        validarCorrelativas(ingresanteId, materia);

        //validarMateria(materia);
        
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

        //validarMateria(materia);
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
        dto.setNota(entidad.getNota());
       

        if (entidad.getInscripcionCarrera().getIngresante() != null) {
            dto.setInscripcionCarreraId(entidad.getInscripcionCarrera().getId());
            dto.setNumeroDocumento(entidad.getInscripcionCarrera().getIngresante().getNumeroDocumento());
            dto.setNombreIngresante(entidad.getInscripcionCarrera().getIngresante().getNombre());
            dto.setApellidoIngresante(entidad.getInscripcionCarrera().getIngresante().getApellido());
        }

        if (entidad.getMateria() != null) {
        	dto.setMateriaId(entidad.getMateria().getId());
            dto.setNombreMateria(entidad.getMateria().getNombre());
        }

        return dto;
    }

}

