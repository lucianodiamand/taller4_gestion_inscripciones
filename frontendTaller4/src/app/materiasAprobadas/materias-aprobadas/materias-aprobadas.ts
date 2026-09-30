import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, FormsModule, Validators } from '@angular/forms';
import { RouterLink } from '@angular/router';

import { TableModule } from 'primeng/table';
import { InputNumberModule } from 'primeng/inputnumber';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { MessageModule } from 'primeng/message';

import { MateriasAprobadasService } from '../materias-aprobadas.service';
import { MateriasAprobadasDTO } from '../../../models/materia-aprobada-dto';
import { InscripcionMateriaResponseDto } from '../../../models/inscripcion-materia-dto';
import { AuthService } from '../../auth/auth.service';

@Component({
  selector: 'app-materias-aprobadas',
  standalone: true,
  imports: [
	RouterLink,
    CommonModule,
    ReactiveFormsModule,
    FormsModule,
    TableModule,
    InputNumberModule,
    ButtonModule,
    CardModule,
	MessageModule
  ],
  templateUrl: './materias-aprobadas.html',
  styleUrls: ['./materias-aprobadas.css']
})
export class MateriasAprobadas { // para materias aprobadas y carga de notas

  notaForm: FormGroup; // formulario usado para cargar nota
  idIngresanteBusqueda: number | null = null;
  idInscripcionMateriaBusqueda: number | null = null;
  inscripcionEncontrada: InscripcionMateriaResponseDto | null = null;
  materiasAprobadas: MateriasAprobadasDTO[] = [];
  cargandoTabla: boolean = false;
  rol: string | null = null;

  // Variables para los mensajes
  mensajeTexto: string = '';
  mensajeTipo: 'exito' | 'error' | 'advertencia' | '' = '';

  constructor(
    private fb: FormBuilder,
    private materiasService: MateriasAprobadasService,
    private authService: AuthService,
	private cdr: ChangeDetectorRef
  ) {
    this.notaForm = this.fb.group({ // creo formulario de nota
      idInscripcion: [null, [Validators.required, Validators.min(1)]],
      nota: [null, [Validators.required, Validators.min(0), Validators.max(10)]]
    });
    const usuario = this.authService.getUsuario();
    if (usuario) {
      this.rol = usuario.rol;
    }
  }
  
  ngOnInit(): void{
	this.rol = this.authService.getRol();
	
	//si es estudiante, cargamos las materias aprobadas para mostrarlas 
	if(this.rol === 'GUEST'){
		this.cargarMateriasAprobadasAlumno();
	}
  }
  
  cargarMateriasAprobadasAlumno():void {
	const ingresanteId = this.authService.getIngresanteId();
	
	if(!ingresanteId){
		this.mostrarMensaje('No se pudo identificar la sesión del estudiante.', 'error');
		return;
	}
	
	this.cargandoTabla = true;
	this.materiasService.obtenerPorIngresante(ingresanteId).subscribe({
		next: (data: MateriasAprobadasDTO[]) => {
			this.materiasAprobadas = data;
			this.cargandoTabla = false;
			this.cdr.detectChanges();
		},
		error: () => {
			this.cargandoTabla = false;
			this.mostrarMensaje('Error al consultar el historial de materias.', 'error');
		}
	})
  }
  
  guardarNota(): void {
	
    if (this.notaForm.invalid) {
      this.notaForm.markAllAsTouched();
      return;
    }

    this.materiasService.registrarAprobacion(this.notaForm.value).subscribe({
      next: (res: MateriasAprobadasDTO) => {
        console.log('RESPUESTA DEL BACKEND:', res);

        this.mostrarMensaje(`Nota ${res.nota} asignada a ${res.nombreIngresante} en ${res.nombreMateria}`, 'exito');
        this.notaForm.reset(); // limpia formulario
      },
      error: (err: any) => {
        this.mostrarMensaje(err.error?.message || 'No se pudo guardar la nota.', 'error');
      }
    });
  }

buscarInscripcion(): void { // 
  if (!this.idInscripcionMateriaBusqueda) {
    this.mostrarMensaje('Ingrese un ID de inscripción válido.', 'advertencia');
    return;
  }

  this.materiasService.obtenerInscripcionPorId(this.idInscripcionMateriaBusqueda).subscribe({
    next: (data: InscripcionMateriaResponseDto) => {
      this.inscripcionEncontrada = data;
      this.notaForm.patchValue({idInscripcion: data.id}); // completamos el campo id inscripcion del formulario
    },
    error: () => {
      this.inscripcionEncontrada = null;
      this.mostrarMensaje('Error al consultar la inscripción.', 'error');
    }
  });
}

  buscarPorIngresante(): void { // busca materias aprobadas por ingresante
    if (!this.idIngresanteBusqueda) {
      this.mostrarMensaje('Ingrese un ID de ingresante válido.', 'advertencia');
      return;
    }

    this.cargandoTabla = true;
    this.materiasService.obtenerPorIngresante(this.idIngresanteBusqueda).subscribe({
      next: (data: MateriasAprobadasDTO[]) => {
        this.materiasAprobadas = data;
        this.cargandoTabla = false;
      },
      error: () => {
        this.cargandoTabla = false;
        this.mostrarMensaje('Error al consultar el historial de materias.', 'error');
      }
    });
  }

  private mostrarMensaje(texto: string, tipo: 'exito' | 'error' | 'advertencia'): void {
    this.mensajeTexto = texto;
    this.mensajeTipo = tipo;
  }
}