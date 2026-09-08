package gestion_inscripciones.backendTaller4.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gestion_inscripciones.backendTaller4.dto.AsignarNotaDTO;
import gestion_inscripciones.backendTaller4.dto.InscripcionMateriaResponseDTO;
import gestion_inscripciones.backendTaller4.dto.MateriasAprobadasDTO;
import gestion_inscripciones.backendTaller4.entity.InscripcionMateria;
import gestion_inscripciones.backendTaller4.entity.MateriasAprobadas;
import gestion_inscripciones.backendTaller4.repository.InscripcionMateriaRepository;
import gestion_inscripciones.backendTaller4.repository.MateriasAprobadasRepository;
import jakarta.persistence.EntityNotFoundException;

@Service
public class MateriasAprobadasService {
	
	@Autowired
	private MateriasAprobadasRepository materiaAprobadaRepository;
	
	@Autowired
    private InscripcionMateriaRepository inscripcionMateriaRepository;
	
	@Autowired
	private InscripcionMateriaService inscripcionMateriaService;
    
    @Transactional
    public MateriasAprobadasDTO registrarNota(AsignarNotaDTO dto) {
    	//Buscamos si la inscripcion a la materia existe
    	InscripcionMateria inscripcion = inscripcionMateriaRepository.findById(dto.getIdInscripcion())
    			.orElseThrow(() -> new EntityNotFoundException("Inscripción no encontrada con ID: " + dto.getIdInscripcion()));
    
    	//Actualizar la nota en la inscripcion original (sin borrar el registro)
        inscripcion.setNota(dto.getNota());
        inscripcionMateriaRepository.save(inscripcion);
        
        //Crear un nuevo registro de materia_aprobada
        MateriasAprobadas materiaAprobada = new MateriasAprobadas();
        materiaAprobada.setIngresante(inscripcion.getInscripcionCarrera().getIngresante());
        materiaAprobada.setMateria(inscripcion.getMateria());
        materiaAprobada.setNota(dto.getNota());
        
        MateriasAprobadas guardada = materiaAprobadaRepository.save(materiaAprobada);

        return mapearADTO(guardada);

    }
    
    @Transactional(readOnly = true)
    public List<MateriasAprobadasDTO> obtenerPorIngresante(Long idIngresante) {
        return materiaAprobadaRepository.findByIngresanteId(idIngresante)
                .stream()
                .map(this::mapearADTO)
                .collect(Collectors.toList());
    }
    
    @Transactional(readOnly = true)
    public Optional<InscripcionMateriaResponseDTO> obtenerInscripcionPorId(Long idInscripcion) {

        return inscripcionMateriaService.obtenerPorId(idInscripcion);

    }
    
    private MateriasAprobadasDTO mapearADTO(MateriasAprobadas entidad) {
        return new MateriasAprobadasDTO(
            entidad.getId(),
            entidad.getNota(),
            entidad.getIngresante().getId(),
            entidad.getIngresante().getNombre() + " " + entidad.getIngresante().getApellido(),
            entidad.getMateria().getId(),
            entidad.getMateria().getNombre()
        );
    }
}
