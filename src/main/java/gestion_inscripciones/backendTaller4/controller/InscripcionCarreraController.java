package gestion_inscripciones.backendTaller4.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import gestion_inscripciones.backendTaller4.entity.InscripcionCarrera;
import gestion_inscripciones.backendTaller4.service.InscripcionCarreraService;


@RestController
@RequestMapping("/inscripcion/carrera") //puse ruta como ejemplo eso todavia no esta implementado

public class InscripcionCarreraController {
	@Autowired
    private InscripcionCarreraService inscripcionCarrera;

    // 1. Obtener todas las inscripciones -> GET http://localhost:8080/inscripcion/carrera
    @GetMapping
    public List<InscripcionCarrera> listarTodas() {
        return inscripcionCarrera.obtenerTodas();
    }

    // 2. Obtener una inscripción por ID -> GET http://localhost:8080/inscripcion/carrera/{id}
    @GetMapping("/{id}")
    public ResponseEntity<InscripcionCarrera> obtenerPorId(@PathVariable Long id) {
        return inscripcionCarrera.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // 3. Crear una nueva inscripción -> POST http://localhost:8080/api/inscripciones
    @PostMapping
    public InscripcionCarrera crear(@RequestBody InscripcionCarrera inscripcion) {
        return inscripcionCarrera.guardar(inscripcion);
    }
    

    // 4. Editar una inscripción -> PUT http://localhost:8080/inscripcion/carrera/{id}
    @PutMapping("/{id}")
    public ResponseEntity<InscripcionCarrera> actualizar(@PathVariable Long id, @RequestBody InscripcionCarrera inscripcion) {
        try {
            InscripcionCarrera actualizada = inscripcionCarrera.actualizar(id, inscripcion);
            return ResponseEntity.ok(actualizada);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    

    // 5. Eliminar una inscripción -> DELETE http://localhost:8080/api/inscripciones/{id}
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        inscripcionCarrera.eliminar(id);
        return ResponseEntity.noContent().build();
    }
}
