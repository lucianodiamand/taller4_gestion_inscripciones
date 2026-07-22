package gestion_inscripciones.backendTaller4.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import gestion_inscripciones.backendTaller4.entity.InscripcionMateria;
import gestion_inscripciones.backendTaller4.service.InscripcionMateriaService;



@RestController
@RequestMapping("/inscripcion/materia") //puse ruta como ejemplo eso todavia no esta implementado

public class InscripcionMateriaController {
	@Autowired
    private InscripcionMateriaService inscripcionMateria;

    // 1. Obtener todas las inscripciones -> GET http://localhost:8080/inscripcion/materia
    @GetMapping
    public List<InscripcionMateria> listarTodas() {
        return inscripcionMateria.obtenerTodas();
    }

    // 2. Obtener una inscripción por ID -> GET http://localhost:8080/inscripcion/materia/{id}
    @GetMapping("/{id}")
    public ResponseEntity<InscripcionMateria> obtenerPorId(@PathVariable Long id) {
        return inscripcionMateria.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // 3. Crear una nueva inscripción -> POST http://localhost:8080/inscripcion/materia
    @PostMapping
    public InscripcionMateria crear(@RequestBody InscripcionMateria inscripcion) {
        return inscripcionMateria.guardar(inscripcion);
    }
    
    /* HAY Q TERMINAR DE IMPLEMETAR EL ACTUALIZAR 
     * 
    // 4. Editar una inscripción -> PUT http://localhost:8080/api/inscripciones/{id}
    @PutMapping("/{id}")
    public ResponseEntity<Inscripcion> actualizar(@PathVariable Long id, @RequestBody Inscripcion inscripcion) {
        try {
            Inscripcion actualizada = inscripcionService.actualizar(id, inscripcion);
            return ResponseEntity.ok(actualizada);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    */

    // 5. Eliminar una inscripción -> DELETE http://localhost:8080/inscripcion/materia/{id}
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
    	inscripcionMateria.eliminar(id);
        return ResponseEntity.noContent().build();
    }
}

