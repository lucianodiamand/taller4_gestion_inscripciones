package gestion_inscripciones.backendTaller4.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import gestion_inscripciones.backendTaller4.dto.AsignarNotaDTO;
import gestion_inscripciones.backendTaller4.dto.MateriasAprobadasDTO;
import gestion_inscripciones.backendTaller4.service.MateriasAprobadasService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/materias_aprobadas")
@RequiredArgsConstructor
public class MateriasAprobadasController {
	
	private final MateriasAprobadasService materiaAprobadaService;
	
	@PostMapping
	public ResponseEntity<MateriasAprobadasDTO> registrarAprobacion(@Valid @RequestBody AsignarNotaDTO dto){
		MateriasAprobadasDTO resultado = materiaAprobadaService.registrarNota(dto);
		return ResponseEntity.status(HttpStatus.CREATED).body(resultado);
		
	}
	
	@GetMapping("/ingresante/{idIngresante}")
	public ResponseEntity<List<MateriasAprobadasDTO>> obtenerPorIngresante(@PathVariable Long idIngresante){
		List<MateriasAprobadasDTO> aprobadas = materiaAprobadaService.obtenerPorIngresante(idIngresante);
		return ResponseEntity.ok(aprobadas);
		
	}

}
