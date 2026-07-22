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

import gestion_inscripciones.backendTaller4.entity.Materia;
import gestion_inscripciones.backendTaller4.service.MateriaService;


@RestController
@RequestMapping("/materias")
public class MateriaController {
	
	@Autowired
    private MateriaService materia;
	
	// 1. Obtener todos los ingresantes -> GET http://localhost:8080/materias
    @GetMapping
    public List<Materia> listarTodas() {
        return materia.obtenerTodas();
    }
    
 // 2. Obtener una materia por ID -> GET http://localhost:8080/materias/{id}
    @GetMapping("/{id}")
    public ResponseEntity<Materia> obtenerPorId(@PathVariable Long id) {
        return materia.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
}


