import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, FormsModule, Validators } from '@angular/forms';
import { RouterLink } from '@angular/router';

import { TableModule } from 'primeng/table';
import { InputNumberModule } from 'primeng/inputnumber';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';

import { MateriasAprobadasService } from '../materias-aprobadas.service';
import { MateriasAprobadasDTO } from '../../../models/materia-aprobada-dto';

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
    CardModule
  ],
  templateUrl: './materias-aprobadas.html',
  styleUrls: ['./materias-aprobadas.css']
})
export class MateriasAprobadas {

  notaForm: FormGroup;
  idIngresanteBusqueda: number | null = null;
  materiasAprobadas: MateriasAprobadasDTO[] = [];
  cargandoTabla: boolean = false;

  // Variables para los mensajes
  mensajeTexto: string = '';
  mensajeTipo: 'exito' | 'error' | 'advertencia' | '' = '';

  constructor(
    private fb: FormBuilder,
    private materiasService: MateriasAprobadasService
  ) {
    this.notaForm = this.fb.group({
      idInscripcion: [null, [Validators.required, Validators.min(1)]],
      nota: [null, [Validators.required, Validators.min(0), Validators.max(10)]]
    });
  }

  guardarNota(): void {
	
    if (this.notaForm.invalid) {
      this.notaForm.markAllAsTouched();
      return;
    }

    this.materiasService.registrarAprobacion(this.notaForm.value).subscribe({
      next: (res: MateriasAprobadasDTO) => {
        this.mostrarMensaje(`Nota ${res.nota} asignada a ${res.nombreIngresante} en ${res.nombreMateria}`, 'exito');
        this.notaForm.reset();
      },
      error: (err: any) => {
        this.mostrarMensaje(err.error?.message || 'No se pudo guardar la nota.', 'error');
      }
    });
  }

  buscarPorIngresante(): void {
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