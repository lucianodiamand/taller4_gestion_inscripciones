package gestion_inscripciones.backendTaller4.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import gestion_inscripciones.backendTaller4.dto.InscripcionCarreraRequestDTO;
import gestion_inscripciones.backendTaller4.dto.InscripcionCarreraResponseDTO;
//import gestion_inscripciones.backendTaller4.dto.MateriaDTO;
import gestion_inscripciones.backendTaller4.service.InscripcionCarreraService;


@RestController
@RequestMapping("/inscripcion/carrera") //puse ruta como ejemplo eso todavia no esta implementado

public class InscripcionCarreraController {
	@Autowired
    private InscripcionCarreraService inscripcionCarreraService;

    // 1. Obtener todas las inscripciones -> GET http://localhost:8080/inscripcion/carrera
    @GetMapping
    public List<InscripcionCarreraResponseDTO> listarTodas() {
        return inscripcionCarreraService.obtenerTodas();
    }

    // 2. Obtener una inscripción por ID -> GET http://localhost:8080/inscripcion/carrera/{id}
    @GetMapping("/{id}")
    public ResponseEntity<InscripcionCarreraResponseDTO> obtenerPorId(@PathVariable Long id) {
        return inscripcionCarreraService.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
 // 3. Obtener las inscripciones de un ingresante -> GET http://localhost:8080//inscripcion/carrera/ingresante{ingresanteId}
    @GetMapping("/ingresante/{ingresanteId}")
    public List<InscripcionCarreraResponseDTO> obtenerPorIngresante(@PathVariable Long ingresanteId) {
        return inscripcionCarreraService.obtenerPorIngresante(ingresanteId);
    }
    
    // 3. Crear una nueva inscripción -> POST http://localhost:8080/inscripcion/carrera
    @PostMapping
    public ResponseEntity<InscripcionCarreraResponseDTO> crear(@RequestBody InscripcionCarreraRequestDTO dto) {
        InscripcionCarreraResponseDTO nueva = inscripcionCarreraService.guardar(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(nueva);
    }

    // 4. Editar una inscripción -> PUT http://localhost:8080/inscripcion/carrera/{id}
    @PutMapping("/{id}")
    public ResponseEntity<InscripcionCarreraResponseDTO> actualizar(@PathVariable Long id, @RequestBody InscripcionCarreraRequestDTO dto) {
        try {
            InscripcionCarreraResponseDTO actualizada = inscripcionCarreraService.actualizar(id, dto);
            return ResponseEntity.ok(actualizada);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    // 5. Eliminar una inscripción -> DELETE http://localhost:8080/api/inscripciones/{id}
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        inscripcionCarreraService.eliminar(id);
        return ResponseEntity.noContent().build();
    }
}