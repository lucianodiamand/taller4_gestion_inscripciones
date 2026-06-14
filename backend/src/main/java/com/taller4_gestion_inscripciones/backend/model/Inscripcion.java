package com.taller4_gestion_inscripciones.backend.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

public class Inscripcion {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nombreEstudiante;

    @Column(nullable = false)
    private String emailEstudiante;

    @Column(nullable = false)
    private String curso;

    @Column(nullable = false)
    private LocalDate fechaInscripcion;

	
}
