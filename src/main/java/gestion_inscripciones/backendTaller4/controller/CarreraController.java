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

import gestion_inscripciones.backendTaller4.dto.CarreraDTO;
import gestion_inscripciones.backendTaller4.service.CarreraService;

@RestController
@RequestMapping("/carreras")
public class CarreraController {
	
	@Autowired
    private CarreraService carreraService;
	
	// 1. Obtener todos las carreras -> GET http://localhost:8080/carreras
    @GetMapping
    public List<CarreraDTO> listarTodas() {
        return carreraService.obtenerTodas();
    }
    
    // 2. Obtener una carrera por ID -> GET http://localhost:8080/carreras/{id}
    @GetMapping("/buscar/{id}")
    public ResponseEntity<CarreraDTO> obtenerPorId(@PathVariable Long id) {
        return carreraService.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @PostMapping("/crear")
    public ResponseEntity<CarreraDTO> crear(@RequestBody CarreraDTO dto) {
        CarreraDTO nueva = carreraService.guardar(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(nueva);
    }
    
    @PutMapping("/editar/{id}")
    public ResponseEntity<CarreraDTO> actualizar(@PathVariable Long id, @RequestBody CarreraDTO dto) {
        try {
            CarreraDTO actualizada = carreraService.actualizar(id, dto);
            return ResponseEntity.ok(actualizada);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        carreraService.eliminar(id);
        return ResponseEntity.noContent().build();
    }

}