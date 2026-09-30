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
	private MateriasAprobadasRepository materiaAprobadaRepository; // para acceder a la entidad de materias aprobadas
	
	@Autowired
    private InscripcionMateriaRepository inscripcionMateriaRepository; // para acceder a la entidad inscripcionMateria
	
	@Autowired
	private InscripcionMateriaService inscripcionMateriaService;
    
    @Transactional // para gestionar las transacciones de la bd.
    // Si todo el código se ejecuta correctamente, los cambios se guardan en la bd (commit). 
    // Si ocurre un error, srping revierte los cambios hechos para evitar inconsistencias (rollback)
    public MateriasAprobadasDTO registrarNota(AsignarNotaDTO dto) { // es lo que se envia por medio del front (id de inscripcion a materia y nota)
    	//Buscamos si la inscripcion a la materia existe
    	InscripcionMateria inscripcion = inscripcionMateriaRepository.findById(dto.getIdInscripcion())
    			.orElseThrow(() -> new EntityNotFoundException("Inscripción no encontrada con ID: " + dto.getIdInscripcion()));
    
    	// Esto no modifica ninguna propiedad de la inscripcion antes de guardar, por lo que no guarda la nota en inscripcionMateria
        inscripcionMateriaRepository.save(inscripcion);
        
        //Crear un nuevo registro de materia_aprobada a partir de la inscripcion
        MateriasAprobadas materiaAprobada = new MateriasAprobadas();
        materiaAprobada.setIngresante(inscripcion.getInscripcionCarrera().getIngresante());
        materiaAprobada.setMateria(inscripcion.getMateria());
        materiaAprobada.setNota(dto.getNota());
        
        MateriasAprobadas guardada = materiaAprobadaRepository.save(materiaAprobada); // guarda la materiaAprobada en la bd

        return mapearADTO(guardada);

    }
    
    @Transactional(readOnly = true)
    public List<MateriasAprobadasDTO> obtenerPorIngresante(Long idIngresante) { // busca las materias aprobadas de un ingresante
        return materiaAprobadaRepository.findByIngresanteId(idIngresante)
                .stream()
                .map(this::mapearADTO)
                .collect(Collectors.toList());
    }
    
    @Transactional(readOnly = true)
    public Optional<InscripcionMateriaResponseDTO> obtenerInscripcionPorId(Long idInscripcion) { // para la carga de notas primero hago la busqueda de la inscripcion por su id

        return inscripcionMateriaService.obtenerPorId(idInscripcion);

    }
    
    private MateriasAprobadasDTO mapearADTO(MateriasAprobadas entidad) {// construccion de dto
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
