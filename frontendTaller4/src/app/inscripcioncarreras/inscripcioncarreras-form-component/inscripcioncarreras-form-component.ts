import { Component, inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { InscripcionCarreraService } from '../inscripcioncarreras.service';
import { CarrerasService } from '../../carreras/carreras.service'; 
import { InscripcionCarreraResponseDto } from '../../../models/inscripcion-carrera-dto';
import { CarrerasDto } from '../../../models/carreras-dto';
import { RouterLink } from '@angular/router';
import { AuthService } from '../../auth/auth.service';

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
  carreras: CarrerasDto[] = []; 

  rol: string | null = null;

  constructor(
    private fb: FormBuilder,
    private inscripcionService: InscripcionCarreraService,
    private carrerasService: CarrerasService,
    private authService: AuthService
  ) {
    const hoy = new Date().toISOString().split('T')[0];

    this.inscripcionForm = this.fb.group({
      carreraId: ['', Validators.required],
      fechaInscripcion: [hoy, Validators.required]
    });
  }

  ngOnInit(): void {
    this.rol = this.authService.getRol(); // obtengo rol
    this.cargarCarreras();
    this.cargarInscripciones(); // para obtener las inscripciones hechas
  }

  cargarCarreras(): void{
    this.carrerasService.obtenerTodos().subscribe({ // cargo las carreras disponibles para mostrarlas en el formulario
      next: (data: CarrerasDto[]) => this.carreras = data,
      error: (err: any) => console.error('Error al obtener carreras:', err)
    });
  }

  cargarInscripciones(): void { // para llenar tabla de inscripciones registradas
    
    if (this.rol === 'ADMIN') { // si el rol del usuario es admin, puede ver todas las inscripciones
      this.inscripcionService.obtenerTodas().subscribe({
        next: data => this.inscripciones = data
      });
    } else { // si es guest, solo puede ver las del ingresante
      const ingresanteId = this.authService.getIngresanteId();

      if(ingresanteId) {
        this.inscripcionService.obtenerPorIngresante(ingresanteId).subscribe({
          next: (data: InscripcionCarreraResponseDto[]) => this.inscripciones = data,
          error: (err: any) => console.error('Error al cargar mis inscripciones:', err)
        });
      }
    }
  }

  guardar(): void {

    if (this.inscripcionForm.invalid) {
      this.inscripcionForm.markAllAsTouched();
      return;
    }

    const ingresanteId = this.authService.getIngresanteId();

    if (!ingresanteId) {
      console.error('No se encontró el ingresante asociado al usuario.');
      return;
    }
    
    const datos = {
      ingresanteId: ingresanteId,
      carreraId: Number(this.inscripcionForm.value.carreraId),
      fechaInscripcion: this.inscripcionForm.value.fechaInscripcion
    };

    this.inscripcionService.crear(datos).subscribe({
      next: () => {
        alert('¡Inscripción realizada con éxito!');
        this.inscripcionForm.patchValue({ carreraId: '' });
        this.cargarInscripciones();
      },
      error: err => console.error('Error al guardar inscripción:', err)
    });
  }
}