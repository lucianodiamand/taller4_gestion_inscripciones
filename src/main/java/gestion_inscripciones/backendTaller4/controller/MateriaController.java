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

import gestion_inscripciones.backendTaller4.dto.MateriaDTO;
import gestion_inscripciones.backendTaller4.service.MateriaService;


@RestController
@RequestMapping("/materias")
public class MateriaController {
	
	@Autowired
    private MateriaService materiaService;
	
	// 1. Obtener todos los ingresantes -> GET http://localhost:8080/materias
    @GetMapping
    public List<MateriaDTO> listarTodas() {
        return materiaService.obtenerTodas();
    }
    
    // 2. Obtener una materia por ID -> GET http://localhost:8080/materias/{id}
    @GetMapping("/{id}")
    public ResponseEntity<MateriaDTO> obtenerPorId(@PathVariable Long id) {
        return materiaService.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @PostMapping
    public ResponseEntity<MateriaDTO> crear(@RequestBody MateriaDTO dto) {
        MateriaDTO nueva = materiaService.guardar(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(nueva);
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<MateriaDTO> actualizar(@PathVariable Long id, @RequestBody MateriaDTO dto) {
        try {
            MateriaDTO actualizada = materiaService.actualizar(id, dto);
            return ResponseEntity.ok(actualizada);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        materiaService.eliminar(id);
        return ResponseEntity.noContent().build();
    }
    
    
}


