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

import gestion_inscripciones.backendTaller4.entity.Carrera;
import gestion_inscripciones.backendTaller4.service.CarreraService;


@RestController
@RequestMapping("/carreras")
public class CarreraController {
	
	@Autowired
    private CarreraService carrera;
	
	// 1. Obtener todos las carreras -> GET http://localhost:8080/carreras
    @GetMapping
    public List<Carrera> listarTodas() {
        return carrera.obtenerTodas();
    }
    
 // 2. Obtener una carrera por ID -> GET http://localhost:8080/carreras/{id}
    @GetMapping("/{id}")
    public ResponseEntity<Carrera> obtenerPorId(@PathVariable Long id) {
        return carrera.obtenerPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }


}

