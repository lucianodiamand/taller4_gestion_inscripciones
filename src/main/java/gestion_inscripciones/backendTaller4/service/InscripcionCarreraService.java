package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.dto.InscripcionCarreraRequestDTO;
import gestion_inscripciones.backendTaller4.dto.InscripcionCarreraResponseDTO;
import gestion_inscripciones.backendTaller4.entity.Carrera;
import gestion_inscripciones.backendTaller4.entity.Ingresante;
import gestion_inscripciones.backendTaller4.entity.InscripcionCarrera;
import gestion_inscripciones.backendTaller4.repository.CarreraRepository;
import gestion_inscripciones.backendTaller4.repository.IngresanteRepository;
import gestion_inscripciones.backendTaller4.repository.InscripcionCarreraRepository;


@Service // para la logica de negocio
public class InscripcionCarreraService { 
	@Autowired
    private InscripcionCarreraRepository inscripcionRepository; // para acceder a inscripCarrera
	
	@Autowired
    private IngresanteRepository ingresanteRepository; // para acceder a ingresante

    @Autowired
    private CarreraRepository carreraRepository; // para acceder a carrera
    
    @Autowired
    private EmailService emailService; // para inyectar el servicio de email
    
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
	public List<InscripcionCarreraResponseDTO> obtenerPorIngresante(Long ingresanteId) { // busca todas las incripciones a carrera segun el id del ingresante

	    return inscripcionRepository.findByIngresanteId(ingresanteId)
	            .stream()
	            .map(this::convertirAResponseDTO)
	            .collect(Collectors.toList());
	}
    
    // Guardar / Crear inscripción (CREATE)
    public InscripcionCarreraResponseDTO guardar(InscripcionCarreraRequestDTO dto) {
        Ingresante ingresante = ingresanteRepository.findById(dto.getIngresanteId()) // primero buscamos el id del ingresante
                .orElseThrow(() -> new RuntimeException("Ingresante no encontrado"));

        Carrera carrera = carreraRepository.findById(dto.getCarreraId()) // despues buscamos la insrcipcion a carrera
                .orElseThrow(() -> new RuntimeException("Carrera no encontrada"));
        
        InscripcionCarrera entidad = new InscripcionCarrera(); // creamos la entidad inscripcion a carrera 
        entidad.setFechaInscripcion(dto.getFechaInscripcion());
        entidad.setIngresante(ingresante);
        entidad.setCarrera(carrera);

        boolean existeInscripcion = inscripcionRepository.existsByIngresanteIdAndCarreraId(dto.getIngresanteId(), dto.getCarreraId());
        if (existeInscripcion) { // para evitar inscripciones duplicadas
        	throw new IllegalArgumentException("El ingresante ya se encuentra inscripto en esta carrera.");
        }
        
        InscripcionCarrera guardada = inscripcionRepository.save(entidad); // guardamos la inscripcion en la bd
        emailService.enviarConfirmacionInscripcionCarrera(// para enviar email 
        		guardada.getIngresante().getEmail(),
        		guardada.getIngresante().getNombre(),
        		guardada.getCarrera().getNombre());
        return convertirAResponseDTO(guardada);
    }
    
    // Actualizar inscripción (UPDATE)
    public InscripcionCarreraResponseDTO actualizar(Long id, InscripcionCarreraRequestDTO dto) {
        InscripcionCarrera entidad = inscripcionRepository.findById(id) // buscamos id de de la inscripcion recibida desde el front y la nueva info
                .orElseThrow(() -> new RuntimeException("Inscripción no encontrada"));

        Ingresante ingresante = ingresanteRepository.findById(dto.getIngresanteId()) // chequeamos el id del ingresante
                .orElseThrow(() -> new RuntimeException("Ingresante no encontrado"));

        Carrera carrera = carreraRepository.findById(dto.getCarreraId()) // chequeamos el id de la carrera 
                .orElseThrow(() -> new RuntimeException("Carrera no encontrada"));

        entidad.setFechaInscripcion(dto.getFechaInscripcion()); // seteamos atributos
        entidad.setIngresante(ingresante);
        entidad.setCarrera(carrera);

        InscripcionCarrera actualizada = inscripcionRepository.save(entidad); // actualizamos
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

        if (entidad.getIngresante() != null) { // si bien la relacion es obligatoria, es una simple verificación
            dto.setIngresanteId(entidad.getIngresante().getId());
            dto.setNombreIngresante(entidad.getIngresante().getNombre());
            dto.setApellidoIngresante(entidad.getIngresante().getApellido());
            dto.setNumeroDocumento(entidad.getIngresante().getNumeroDocumento());
        }

        if (entidad.getCarrera() != null) {
            dto.setCarreraId(entidad.getCarrera().getId());
            dto.setNombreCarrera(entidad.getCarrera().getNombre());
        }

        return dto; // lo que recibe el frontend
    }
    
}
