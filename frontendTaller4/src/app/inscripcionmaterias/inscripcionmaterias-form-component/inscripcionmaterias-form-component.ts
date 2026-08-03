import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { InscripcionMateriaResponseDto, InscripcionMateriaRequestDto } from '../../../models/inscripcion-materia-dto';
import { InscripcionMateriaService } from '../inscripcionmateria.service';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators} from '@angular/forms';
import { InscripcionCarreraResponseDto } from '../../../models/inscripcion-carrera-dto';
import { MateriasDto } from '../../../models/materias-dto';
import { InscripcionCarreraService } from '../../inscripcioncarreras/inscripcioncarreras.service';
import { MateriaService } from '../../materia/materia.service';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-inscripcion-materia',
  templateUrl: './inscripcionmaterias-form-component.html',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, RouterLink],
  styleUrl: './inscripcionmaterias-form-component.css'
})
export class InscripcionMateriaFormComponent implements OnInit {

  inscripcionForm: FormGroup;
  inscripciones: InscripcionMateriaResponseDto[] = [];
  inscripcionesCarreras: InscripcionCarreraResponseDto[] = [];
  materias: MateriasDto[] = [];
  materiasFiltradas: MateriasDto[] = [];


  constructor(
    private fb: FormBuilder,
    private inscripcionMateriaService: InscripcionMateriaService,
    private inscripcionCarreraService: InscripcionCarreraService,
    private materiaService: MateriaService 
  ) {
    const hoy = new Date().toISOString().split('T')[0];

    this.inscripcionForm = this.fb.group({
      inscripcionCarreraId: ['', Validators.required],
      materiaId: ['', Validators.required],
      fechaInscripcion: [hoy, Validators.required]
    });
  }

  ngOnInit(): void {
    this.cargarListas();
    this.cargarInscripciones();

    this.inscripcionForm.get('inscripcionCarreraId')!.valueChanges.subscribe((valor: string) => {
      const inscripcionCarreraId = +valor;
      this.filtrarMaterias(inscripcionCarreraId);
    });
    // this.inscripcionForm.get('inscripcionCarreraId') para acceder al campo especifico pasado por parametro
    // valueChanges emite un nuevo valor cada vez que el campo cambia (por medio del selector)
    // por medio del suscribe, cada vez que se emite un nuevo valor lo castea a number y lo pasa como parametro a la funcion
  }

  cargarListas(): void {
    // Cargar inscripciones a carrera
    this.inscripcionCarreraService.obtenerTodas().subscribe({
      next: (data: InscripcionCarreraResponseDto[]) => this.inscripcionesCarreras = data,
      error: (err: any) => console.error('Error al obtener inscripciones a carrera:', err)
    });

    // Cargar materias 
    this.materiaService.obtenerTodos().subscribe({
      next: (data: MateriasDto[]) => this.materias = data,
      error: (err: any) => console.error('Error al obtener materias:', err)
    });
  }

  cargarInscripciones(): void {
    // Corregido: guardar en this.inscripciones en vez de this.carreras
   this.inscripcionMateriaService.obtenerTodas().subscribe({
      next: (data: InscripcionMateriaResponseDto[]) => this.inscripciones = data,
      error: (err: any) => console.error('Error al cargar inscripciones a materia:', err)
    });
  }

  filtrarMaterias(inscripcionCarreraId: number): void {
  const inscripcionElegida = this.inscripcionesCarreras.find(i => i.id === inscripcionCarreraId);
  // find recorre el arreglo de inscripciones carreras como un for y devuelve el que coincide

  if (!inscripcionElegida) {
    this.materiasFiltradas = [];
    return;
  }

  this.materiasFiltradas = this.materias.filter(m => {
    return m.carreraId === inscripcionElegida.carreraId && m.anio === 1 && m.cuatrimestre === 1;
    // en el callback la materia m se queda si se cumple la condicion, y filter arma el nuevo arreglo
  });

  /*const materiaActual = this.inscripcionForm.value.materiaId; //guarda la materia elegida
  if (!this.materiasFiltradas.some(m => m.id === materiaActual)) { //
    this.inscripcionForm.patchValue({ materiaId: '' });
  }*/
}

  guardar(): void {
    if (this.inscripcionForm.invalid) {
      this.inscripcionForm.markAllAsTouched();
      return;
    }

    this.inscripcionMateriaService.crear(this.inscripcionForm.value).subscribe({
      next: () => {
        alert('¡Inscripción a materia realizada con éxito!');
        this.inscripcionForm.patchValue({
          inscripcionCarreraId: '',
          materiaId: ''
        });
        this.cargarInscripciones();
      },
      error: (err: any) => console.error('Error al guardar inscripción:', err)
    });
  }
}
