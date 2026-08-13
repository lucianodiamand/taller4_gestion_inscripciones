package gestion_inscripciones.backendTaller4.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import gestion_inscripciones.backendTaller4.dto.InscripcionMateriaRequestDTO;
import gestion_inscripciones.backendTaller4.dto.InscripcionMateriaResponseDTO;
import gestion_inscripciones.backendTaller4.service.InscripcionMateriaService;



@RestController
@RequestMapping("/inscripcion/materia") //puse ruta como ejemplo eso todavia no esta implementado

public class InscripcionMateriaController {
	@Autowired
    private InscripcionMateriaService inscripcionMateriaService;

    // 1. Obtener todas las inscripciones 
	// GET http://localhost:8080/inscripcion/materia
    @GetMapping
    public List<InscripcionMateriaResponseDTO> listarTodas() {
        return inscripcionMateriaService.obtenerTodas();
    }

    // 2. Obtener una inscripción por ID 
    // GET http://localhost:8080/inscripcion/materia/{id}
    @GetMapping("/{id}")
    public ResponseEntity<InscripcionMateriaResponseDTO> obtenerPorId(@PathVariable Long id) {
        return inscripcionMateriaService.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    // 3. CONSULTAR INSCRIPCIONES DE UN ESTUDIANTE ESPECÍFICO
    // GET http://localhost:8080/api/inscripciones-materias/ingresante/{ingresanteId}
    @GetMapping("/ingresante/{ingresanteId}")
    public ResponseEntity<List<InscripcionMateriaResponseDTO>> obtenerPorEstudiante(@PathVariable Long ingresanteId) {
        List<InscripcionMateriaResponseDTO> inscripciones = inscripcionMateriaService.obtenerPorIngresante(ingresanteId);
        return ResponseEntity.ok(inscripciones);
    }   
    
    // 4. REGISTRAR UNA NUEVA INSCRIPCIÓN
    // POST http://localhost:8080/api/inscripciones-materias
    @PostMapping
    public ResponseEntity<InscripcionMateriaResponseDTO> crear(@RequestBody InscripcionMateriaRequestDTO dto) {
        InscripcionMateriaResponseDTO nueva = inscripcionMateriaService.guardar(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(nueva);
    }
    //HttpStatus.CREATED: Es un valor de un enum de Spring que representa internamente el número 201 'Created'.
    
    // 5. ACTUALIZAR UNA INSCRIPCION 
    @PutMapping("/{id}")
    public ResponseEntity<InscripcionMateriaResponseDTO> actualizar(@PathVariable Long id, @RequestBody InscripcionMateriaRequestDTO dto) {
        try {
            InscripcionMateriaResponseDTO actualizada = inscripcionMateriaService.actualizar(id, dto);
            return ResponseEntity.ok(actualizada);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    // 6. DAR DE BAJA (ELIMINAR) UNA INSCRIPCIÓN
    // DELETE http://localhost:8080/api/inscripciones-materias/{id}
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        inscripcionMateriaService.eliminar(id);
        return ResponseEntity.noContent().build();
    }
    
}