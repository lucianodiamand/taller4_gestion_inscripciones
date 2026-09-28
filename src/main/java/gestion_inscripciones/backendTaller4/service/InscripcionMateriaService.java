package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.dto.InscripcionMateriaRequestDTO;
import gestion_inscripciones.backendTaller4.dto.InscripcionMateriaResponseDTO;
import gestion_inscripciones.backendTaller4.entity.InscripcionCarrera;
import gestion_inscripciones.backendTaller4.entity.InscripcionMateria;
import gestion_inscripciones.backendTaller4.entity.Materia;
import gestion_inscripciones.backendTaller4.repository.InscripcionCarreraRepository;
import gestion_inscripciones.backendTaller4.repository.InscripcionMateriaRepository;
import gestion_inscripciones.backendTaller4.repository.MateriaRepository;
import gestion_inscripciones.backendTaller4.repository.MateriasAprobadasRepository;

@Service // para la logica de negocio
public class InscripcionMateriaService { 
	@Autowired
    private InscripcionMateriaRepository inscripcionMateriaRepository;
	
	@Autowired
	private MateriasAprobadasRepository materiasAprobadasRepository;
	
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
        return materiasAprobadasRepository.existsByIngresanteIdAndMateriaIdAndNotaGreaterThanEqual(ingresanteId, materiaId, 6);
    }
    
    private void validarCorrelativas(Long ingresanteId, Materia materia) {

        if (materia.getCorrelativas() == null || materia.getCorrelativas().isEmpty()) {
            return;
        }

        for (Materia correlativa : materia.getCorrelativas()) {				// recorro las correlativas de una materia
            if (!materiaAprobada(ingresanteId, correlativa.getId())) {      // si no esta aprobada..
                throw new IllegalArgumentException(
                    "No puede inscribirse a "
                    + materia.getNombre()
                    + " porque no aprobó "
                    + correlativa.getNombre()
                );
            }
        }
    }
    
    // Guardar / Crear inscripción (CREATE)
    public InscripcionMateriaResponseDTO guardar(InscripcionMateriaRequestDTO dto) {
        InscripcionCarrera insCarrera = inscripcionCarreraRepository.findById(dto.getInscripcionCarreraId())
                .orElseThrow(() -> new RuntimeException("Inscripción de Carrera no encontrada"));

        Materia materia = materiaRepository.findById(dto.getMateriaId())
                .orElseThrow(() -> new RuntimeException("Materia no encontrada"));
        
        Long ingresanteId = insCarrera.getIngresante().getId();
        
        validarCorrelativas(ingresanteId, materia);
       
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

