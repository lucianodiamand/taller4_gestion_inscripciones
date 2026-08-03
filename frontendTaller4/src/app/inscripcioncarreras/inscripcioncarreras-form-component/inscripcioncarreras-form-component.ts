import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { InscripcionCarreraService } from '../inscripcioncarreras.service';
import { IngresanteService } from '../../ingresante/ingresante.service';
import { CarrerasService } from '../../carreras/carreras.service'; 
import { InscripcionCarreraResponseDto } from '../../../models/inscripcion-carrera-dto';
import { IngresanteDto } from '../../../models/ingresante-dto';
import { CarrerasDto } from '../../../models/carreras-dto';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-inscripcion-form',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, RouterLink],
  templateUrl: './inscripcioncarreras-form-component.html',
  styleUrl: './inscripcioncarreras-form-component.css'
})
export class InscripcionFormComponent implements OnInit {
eliminar(arg0: number) {
throw new Error('Method not implemented.');
}

  inscripcionForm: FormGroup;
  inscripciones: InscripcionCarreraResponseDto[] = [];
  
  ingresantes: IngresanteDto[] = [];
  carreras: CarrerasDto[] = []; 

  constructor(
    private fb: FormBuilder,
    private inscripcionService: InscripcionCarreraService,
    private ingresanteService: IngresanteService,
    private carrerasService: CarrerasService 
  ) {
    const hoy = new Date().toISOString().split('T')[0];

    this.inscripcionForm = this.fb.group({
      ingresanteId: ['', Validators.required],
      carreraId: ['', Validators.required],
      fechaInscripcion: [hoy, Validators.required]
    });
  }

  ngOnInit(): void {
    this.cargarListas();
    this.cargarInscripciones();
  }

  cargarListas(): void { // para los select del formulario
    // Cargar ingresantes
    this.ingresanteService.obtenerTodos().subscribe({
      next: (data: IngresanteDto[]) => this.ingresantes = data,
      error: (err: any) => console.error('Error al obtener ingresantes:', err)
    });

    // Cargar carreras (Cambiado a obtenerTodos() y tipado)
    this.carrerasService.obtenerTodos().subscribe({
      next: (data: CarrerasDto[]) => this.carreras = data,
      error: (err: any) => console.error('Error al obtener carreras:', err)
    });
  }

  cargarInscripciones(): void { // para llenar tabla de inscripciones registradas
    // Corregido: guardar en this.inscripciones en vez de this.carreras
    this.inscripcionService.obtenerTodas().subscribe({
      next: (data: InscripcionCarreraResponseDto[]) => this.inscripciones = data,
      error: (err: any) => console.error('Error al cargar inscripciones:', err)
    });
  }

  guardar(): void {
    if (this.inscripcionForm.invalid) {
      this.inscripcionForm.markAllAsTouched();
      return;
    }

    this.inscripcionService.crear(this.inscripcionForm.value).subscribe({
      next: () => {
        alert('¡Inscripción realizada con éxito!');
        this.inscripcionForm.patchValue({
          ingresanteId: '',
          carreraId: ''
        });
        this.cargarInscripciones();
      },
      error: (err: any) => console.error('Error al guardar inscripción:', err)
    });
  }
}