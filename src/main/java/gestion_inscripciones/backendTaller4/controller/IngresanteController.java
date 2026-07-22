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

import gestion_inscripciones.backendTaller4.entity.Ingresante;
import gestion_inscripciones.backendTaller4.service.IngresanteService;

@RestController
@RequestMapping("/ingreso")
public class IngresanteController {
	
	@Autowired
    private IngresanteService ingresante;
	
	// 1. Obtener todos los ingresantes -> GET http://localhost:8080/ingreso
    @GetMapping
    public List<Ingresante> listarTodas() {
        return ingresante.obtenerTodas();
    }
    
 // 2. Obtener un ingresante por ID -> GET http://localhost:8080/ingreso/{id}
    @GetMapping("/{id}")
    public ResponseEntity<Ingresante> obtenerPorId(@PathVariable Long id) {
        return ingresante.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
 // 3. Crear un ingresante -> POST http://localhost:8080/ingreso
    @PostMapping
    public Ingresante crear(@RequestBody Ingresante ingreso) {
        return ingresante.guardar(ingreso);
    }
    
    // 4. Editar una inscripción -> PUT http://localhost:8080/ingreso/{id}
    
 // 5. Eliminar un ingresante -> DELETE http://localhost:8080/ingreso/{id}
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        ingresante.eliminar(id);
        return ResponseEntity.noContent().build();
    }

}

