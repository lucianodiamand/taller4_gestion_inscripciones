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

import gestion_inscripciones.backendTaller4.dto.IngresanteDTO;
import gestion_inscripciones.backendTaller4.service.IngresanteService;

@RestController
@RequestMapping("/ingreso")
public class IngresanteController {
	
	@Autowired
    private IngresanteService ingresanteService;
	
	// 1. Obtener todos los ingresantes -> GET http://localhost:8080/ingreso
    @GetMapping
    public List<IngresanteDTO> listarTodos() {
        return ingresanteService.obtenerTodos();
    }
    
    // 2. Obtener un ingresante por ID -> GET http://localhost:8080/ingreso/{id}
    @GetMapping("/buscar/{id}")
    public ResponseEntity<IngresanteDTO> obtenerPorId(@PathVariable Long id) {
        return ingresanteService.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    // 3. Crear un ingresante -> POST http://localhost:8080/ingreso
    @PostMapping("/crear")
    public ResponseEntity<IngresanteDTO> crear(@RequestBody IngresanteDTO dto) {
        IngresanteDTO nuevo = ingresanteService.guardar(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);
    }
    
    // 4. Editar una inscripción -> PUT http://localhost:8080/ingreso/{id}
    @PutMapping("/editar/{id}")
    public ResponseEntity<IngresanteDTO> actualizar(@PathVariable Long id, @RequestBody IngresanteDTO dto) {
        try {
            IngresanteDTO actualizado = ingresanteService.actualizar(id, dto);
            return ResponseEntity.ok(actualizado);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    // 5. Eliminar un ingresante -> DELETE http://localhost:8080/ingreso/{id}
    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        ingresanteService.eliminar(id);
        return ResponseEntity.noContent().build();
    }

}