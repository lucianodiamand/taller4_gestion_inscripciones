package com.taller4_gestion_inscripciones.backend.controller;

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

import com.taller4_gestion_inscripciones.backend.model.Inscripcion;
import com.taller4_gestion_inscripciones.backend.service.InscripcionService;

@RestController
@RequestMapping("/api/inscripciones") //puse ruta como ejemplo eso todavia no esta implementado

public class InscripcionController {
	@Autowired
    private InscripcionService inscripcionService;

    // 1. Obtener todas las inscripciones -> GET http://localhost:8080/api/inscripciones
    @GetMapping
    public List<Inscripcion> listarTodas() {
        return inscripcionService.obtenerTodas();
    }

    // 2. Obtener una inscripción por ID -> GET http://localhost:8080/api/inscripciones/{id}
    @GetMapping("/{id}")
    public ResponseEntity<Inscripcion> obtenerPorId(@PathVariable Long id) {
        return inscripcionService.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // 3. Crear una nueva inscripción -> POST http://localhost:8080/api/inscripciones
    @PostMapping
    public Inscripcion crear(@RequestBody Inscripcion inscripcion) {
        return inscripcionService.guardar(inscripcion);
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

    // 5. Eliminar una inscripción -> DELETE http://localhost:8080/api/inscripciones/{id}
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        inscripcionService.eliminar(id);
        return ResponseEntity.noContent().build();
    }
}
