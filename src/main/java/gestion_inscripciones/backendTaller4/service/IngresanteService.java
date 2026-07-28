package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gestion_inscripciones.backendTaller4.dto.IngresanteDTO;
import gestion_inscripciones.backendTaller4.entity.Ingresante;
import gestion_inscripciones.backendTaller4.repository.IngresanteRepository;


@Service // para la logica de negocio
public class IngresanteService { 
	@Autowired
    private IngresanteRepository ingresanteRepository;

    // Obtener todas las inscripciones (READ)
	public List<IngresanteDTO> obtenerTodos() {
        return ingresanteRepository.findAll()
                .stream()
                .map(this::convertirADTO)
                .collect(Collectors.toList());
    }

    // Obtener por ID (READ)
	public Optional<IngresanteDTO> obtenerPorId(Long id) {
        return ingresanteRepository.findById(id)
                .map(this::convertirADTO);
    }
    
	// Guardar / Crear inscripción (CREATE)
	public IngresanteDTO guardar(IngresanteDTO dto) {
        Ingresante ingresante = new Ingresante();
        copiarAtributos(dto, ingresante);

        Ingresante guardado = ingresanteRepository.save(ingresante);
        return convertirADTO(guardado);
    }
	
	public IngresanteDTO actualizar(Long id, IngresanteDTO dto) {
        Ingresante ingresante = ingresanteRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Ingresante no encontrado"));

        copiarAtributos(dto, ingresante);

        Ingresante actualizado = ingresanteRepository.save(ingresante);
        return convertirADTO(actualizado);
    }
    
	// Eliminar inscripción (DELETE)
    public void eliminar(Long id) {
    	ingresanteRepository.deleteById(id);
    }
    
    // Helper de mapeo
    private void copiarAtributos(IngresanteDTO dto, Ingresante entidad) {
        entidad.setNombre(dto.getNombre());
        entidad.setApellido(dto.getApellido());
        entidad.setTipoDocumento(dto.getTipoDocumento());
        entidad.setNumeroDocumento(dto.getNumeroDocumento());
        entidad.setEdad(dto.getEdad());
        entidad.setEmail(dto.getEmail());
    }
    
    // Helper de mapeo
    private IngresanteDTO convertirADTO(Ingresante entidad) {
        IngresanteDTO dto = new IngresanteDTO();
        dto.setId(entidad.getId());
        dto.setNombre(entidad.getNombre());
        dto.setApellido(entidad.getApellido());
        dto.setTipoDocumento(entidad.getTipoDocumento());
        dto.setNumeroDocumento(entidad.getNumeroDocumento());
        dto.setEdad(entidad.getEdad());
        dto.setEmail(entidad.getEmail());
        return dto;
    }
}