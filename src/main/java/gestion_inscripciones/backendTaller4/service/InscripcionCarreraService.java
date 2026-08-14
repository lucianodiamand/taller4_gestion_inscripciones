package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.dto.InscripcionCarreraRequestDTO;
import gestion_inscripciones.backendTaller4.dto.InscripcionCarreraResponseDTO;
import gestion_inscripciones.backendTaller4.dto.MateriaDTO;
import gestion_inscripciones.backendTaller4.entity.Carrera;
import gestion_inscripciones.backendTaller4.entity.Ingresante;
import gestion_inscripciones.backendTaller4.entity.InscripcionCarrera;
import gestion_inscripciones.backendTaller4.repository.CarreraRepository;
import gestion_inscripciones.backendTaller4.repository.IngresanteRepository;
import gestion_inscripciones.backendTaller4.repository.InscripcionCarreraRepository;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;


@Service // para la logica de negocio
public class InscripcionCarreraService { 
	@Autowired
    private InscripcionCarreraRepository inscripcionRepository;
	
	@Autowired
    private IngresanteRepository ingresanteRepository;

    @Autowired
    private CarreraRepository carreraRepository;
    
    @Autowired
    private EmailService emailService; 
    
    // Obtener todas las inscripciones (READ)
    public List<InscripcionCarreraResponseDTO> obtenerTodas() {
        return inscripcionRepository.findAll()
                .stream()
                .map(this::convertirAResponseDTO)
                .collect(Collectors.toList());
    }

    // Obtener por ID (READ)
    public Optional<InscripcionCarreraResponseDTO> obtenerPorId(Long id) {
        return inscripcionRepository.findById(id)
                .map(this::convertirAResponseDTO);
    }
        
	// Obtener inscripciones de un ingresante
	public List<InscripcionCarreraResponseDTO> obtenerPorIngresante(Long ingresanteId) {

	    return inscripcionRepository.findByIngresanteId(ingresanteId)
	            .stream()
	            .map(this::convertirAResponseDTO)
	            .collect(Collectors.toList());
	}
    
    // Guardar / Crear inscripción (CREATE)
    public InscripcionCarreraResponseDTO guardar(InscripcionCarreraRequestDTO dto) {
        Ingresante ingresante = ingresanteRepository.findById(dto.getIngresanteId())
                .orElseThrow(() -> new RuntimeException("Ingresante no encontrado"));

        Carrera carrera = carreraRepository.findById(dto.getCarreraId())
                .orElseThrow(() -> new RuntimeException("Carrera no encontrada"));
        
        InscripcionCarrera entidad = new InscripcionCarrera();
        entidad.setFechaInscripcion(dto.getFechaInscripcion());
        entidad.setIngresante(ingresante);
        entidad.setCarrera(carrera);

        boolean existeInscripcion = inscripcionRepository.existsByIngresanteIdAndCarreraId(dto.getIngresanteId(), dto.getCarreraId());
        if (existeInscripcion) {
        	throw new IllegalArgumentException("El ingresante ya se encuentra inscripto en esta carrera.");
        }
        
        InscripcionCarrera guardada = inscripcionRepository.save(entidad);
        emailService.enviarConfirmacionInscripcionCarrera(
        		guardada.getIngresante().getEmail(),
        		guardada.getIngresante().getNombre(),
        		guardada.getCarrera().getNombre());
        return convertirAResponseDTO(guardada);
    }
    
    // Actualizar inscripción (UPDATE)
    public InscripcionCarreraResponseDTO actualizar(Long id, InscripcionCarreraRequestDTO dto) {
        InscripcionCarrera entidad = inscripcionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Inscripción no encontrada"));

        Ingresante ingresante = ingresanteRepository.findById(dto.getIngresanteId())
                .orElseThrow(() -> new RuntimeException("Ingresante no encontrado"));

        Carrera carrera = carreraRepository.findById(dto.getCarreraId())
                .orElseThrow(() -> new RuntimeException("Carrera no encontrada"));

        entidad.setFechaInscripcion(dto.getFechaInscripcion());
        entidad.setIngresante(ingresante);
        entidad.setCarrera(carrera);

        InscripcionCarrera actualizada = inscripcionRepository.save(entidad);
        emailService.enviarConfirmacionInscripcionCarrera(
        		actualizada.getIngresante().getEmail(),
        		actualizada.getIngresante().getNombre(),
        		actualizada.getCarrera().getNombre());
        return convertirAResponseDTO(actualizada);
    }
    
    
    // Eliminar inscripción (DELETE)
    public void eliminar(Long id) {
    	inscripcionRepository.deleteById(id);
    }
    
    private InscripcionCarreraResponseDTO convertirAResponseDTO(InscripcionCarrera entidad) {
        InscripcionCarreraResponseDTO dto = new InscripcionCarreraResponseDTO();
        dto.setId(entidad.getId());
        dto.setFechaInscripcion(entidad.getFechaInscripcion());

        if (entidad.getIngresante() != null) {
            dto.setIngresanteId(entidad.getIngresante().getId());
            dto.setNombreIngresante(entidad.getIngresante().getNombre());
            dto.setApellidoIngresante(entidad.getIngresante().getApellido());
        }

        if (entidad.getCarrera() != null) {
            dto.setCarreraId(entidad.getCarrera().getId());
            dto.setNombreCarrera(entidad.getCarrera().getNombre());
        }

        return dto;
    }
    
}
