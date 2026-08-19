import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators, AbstractControl, ValidationErrors } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { IngresanteService } from '../ingresante.service';
import { Subscription } from 'rxjs';
import { IngresanteDto } from '../../../models/ingresante-dto';
import { CommonModule } from '@angular/common';
import { InputTextModule } from 'primeng/inputtext';
import { SelectModule } from 'primeng/select';
import { ButtonModule } from 'primeng/button';

@Component({
  selector: 'app-ingresante-form',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, InputTextModule, SelectModule, ButtonModule, RouterLink],
  templateUrl: './ingresante-form-component.html',
  styleUrl: './ingresante-form-component.css',
})
export class IngresanteFormComponent implements OnInit, OnDestroy {

  ingresanteForm: FormGroup;
  id: string | null = null;

  // Manejador centralizado de suscripciones para evitar memory leaks y errores al destruir el componente
  private readonly subscriptions = new Subscription();

  tiposDocumento = [
    { label: 'DNI', value: 'DNI' },
    { label: 'Pasaporte', value: 'Pasaporte' },
    { label: 'Libreta Cívica', value: 'Libreta Cívica' }
  ];

  constructor(
    private readonly fb: FormBuilder,
    private readonly servicio: IngresanteService,
    private readonly route: ActivatedRoute,
    private readonly router: Router
  ) {
    this.ingresanteForm = this.fb.group({
      nombre: ['', [Validators.required, Validators.pattern(/^[a-zA-Z\s]+$/)]],
      apellido: ['', [Validators.required, Validators.pattern(/^[a-zA-Z\s]+$/)]],
      tipoDocumento: ['', Validators.required],
      numeroDocumento: ['', Validators.required],
      edad: ['', [Validators.required, Validators.min(1), Validators.max(100)]],
      email: ['', [Validators.required, Validators.pattern('.*@.*')]],
    }, {
      validators: this.validarDocumentoSegunTipo
    });
  }

  ngOnInit() {
    this.id = this.route.snapshot.paramMap.get('id');

    // Escuchamos los cambios en tipoDocumento
    const subTipoDoc = this.ingresanteForm.get('tipoDocumento')?.valueChanges.subscribe(() => {
      this.ingresanteForm.get('numeroDocumento')?.updateValueAndValidity();
    });
    if (subTipoDoc) this.subscriptions.add(subTipoDoc);

    // Si viene un ID en la URL, buscamos los datos para editar
    if (this.id) {
      this.subscriptions.add(
        this.servicio.obtenerPorId(+this.id).subscribe({
          next: (ingresante: IngresanteDto) => {
            this.ingresanteForm.patchValue(ingresante);
          },
          error: (err) => {
            console.error('Error al buscar el ingresante:', err);
          }
        })
      );
    }
  }

  validarDocumentoSegunTipo(control: AbstractControl): ValidationErrors | null {
    const tipo = control.get('tipoDocumento')?.value;
    const numeroControl = control.get('numeroDocumento');

    if (!tipo || !numeroControl || !numeroControl.value) {
      return null;
    }
    const numero = String(numeroControl.value).trim();

    if (tipo === 'DNI' || tipo === 'Libreta Cívica') {
      const esValido = /^\d{7,8}$/.test(numero);
      if (!esValido) {
        numeroControl.setErrors({ documentoInvalido: 'Debe contener entre 7 y 8 números.' });
        return { documentoInvalido: true };
      }
    }

    if (tipo === 'Pasaporte') {
      const esValido = /^[a-zA-Z]{3}\d{6}$/.test(numero);
      if (!esValido) {
        numeroControl.setErrors({ documentoInvalido: 'El pasaporte debe tener 3 letras seguidas de 6 números.' });
        return { documentoInvalido: true };
      }
    }

    if (numeroControl.hasError('documentoInvalido')) {
      delete numeroControl.errors?.['documentoInvalido'];
      if (!Object.keys(numeroControl.errors || {}).length) {
        numeroControl.setErrors(null);
      }
    }

    return null;
  }

  guardar() {
    if (this.ingresanteForm.invalid) {
      this.ingresanteForm.markAllAsTouched();
      return;
    }

    if (this.id) {
      this.subscriptions.add(
        this.servicio.actualizar(+this.id, this.ingresanteForm.value).subscribe({
          next: () => this.router.navigate(['/ingresante']),
          error: (err) => console.error('Error al actualizar el ingresante:', err)
        })
      );
    } else {
      this.subscriptions.add(
        this.servicio.crear(this.ingresanteForm.value).subscribe({
          next: () => this.router.navigate(['/ingresante']),
          error: (err) => console.error('Error al crear el ingresante:', err)
        })
      );
    }
  }

  ngOnDestroy() {
    // Al destruir el componente descalcula y cancela de forma segura todas las suscripciones activas
    this.subscriptions.unsubscribe();
  }
}