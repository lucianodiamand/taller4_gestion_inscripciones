import { Component, OnDestroy, inject } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators, AbstractControl, ValidationErrors } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { AuthService } from '../auth.service';
import { Subscription } from 'rxjs';
import { UsuarioRegisterRequestDTO } from '../../../models/auth-dto';

// Módulos de PrimeNG
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { InputNumberModule } from 'primeng/inputnumber';
import { SelectModule } from 'primeng/select';
import { PasswordModule } from 'primeng/password';
import { ButtonModule } from 'primeng/button';
import { MessageModule } from 'primeng/message';

@Component({
  selector: 'app-registro',
  standalone: true,
  imports: [
	ReactiveFormsModule, 
	RouterLink,
	CardModule,
	InputTextModule,
	InputNumberModule,
	SelectModule,
	PasswordModule,
	ButtonModule,
	MessageModule
  ],
  templateUrl: './registro.html',
  styleUrl: './registro.css'
})
export class RegistroComponent implements OnDestroy {
  private fb = inject(FormBuilder);
  private authService = inject(AuthService);
  private router = inject(Router);

  errorMensaje: string = '';
  private subscription!: Subscription;
  
  tiposDocumento: string[] = ['DNI', 'Pasaporte', 'Libreta Cívica'];

  // Formulario con los mismos validadores que en Ingresante
  form = this.fb.group({
    nombre: ['', [Validators.required, Validators.pattern(/^[a-zA-Z\s]+$/)]],
    apellido: ['', [Validators.required, Validators.pattern(/^[a-zA-Z\s]+$/)]],
    username: ['', [Validators.required, Validators.minLength(4)]],
    email: ['', [Validators.required,Validators.email]],
    password: ['', [Validators.required, Validators.minLength(6)]],
    edad: [null as number | null, [Validators.required, Validators.min(1), Validators.max(100)]],
    tipoDocumento: ['', [Validators.required]],
    numeroDocumento: ['', [Validators.required]],
  }, {
    validators: this.validarDocumentoSegunTipo
  });

  constructor() {
    // Escuchamos cambios en tipoDocumento para reevaluar el numeroDocumento
    this.form.get('tipoDocumento')?.valueChanges.subscribe(() => {
      this.form.get('numeroDocumento')?.updateValueAndValidity();
    });
  }

  /*
    Validador personalizado copiado de IngresanteFormComponent
  */
  validarDocumentoSegunTipo(control: AbstractControl): ValidationErrors | null {
    const tipo = control.get('tipoDocumento')?.value;
    const numeroControl = control.get('numeroDocumento');

    if (!tipo || !numeroControl || !numeroControl.value) {
      return null;
    }
    
    const numero = String(numeroControl.value).trim();

    // 1) DNI o Cédula/Libreta: Solo números, 7 u 8 dígitos
    if (tipo === 'DNI' || tipo === 'Libreta Cívica') {
      const esValido = /^\d{7,8}$/.test(numero);
      if (!esValido) {
        numeroControl.setErrors({ documentoInvalido: 'Debe contener entre 7 y 8 números.' });
        return { documentoInvalido: true };
      }
    }

    // 2) Pasaporte: 3 letras + 6 números
    if (tipo === 'PASAPORTE' || tipo === 'Pasaporte') {
      const esValido = /^[a-zA-Z]{3}\d{6}$/.test(numero);
      if (!esValido) {
        numeroControl.setErrors({ documentoInvalido: 'El pasaporte debe tener 3 letras seguidas de 6 números.' });
        return { documentoInvalido: true };
      }
    }

    // Limpieza de errores si el valor ya es válido
    if (numeroControl.hasError('documentoInvalido')) {
      delete numeroControl.errors?.['documentoInvalido'];
      if (!Object.keys(numeroControl.errors || {}).length) {
        numeroControl.setErrors(null);
      }
    }

    return null;
  }

  onSubmit(): void {
    if (this.form.invalid) {
      this.form.markAllAsTouched();
      return;
    }
	
	const formVal = this.form.value;
	//Mapeo los valores explicito
	const registroData: UsuarioRegisterRequestDTO = {
	    nombre: formVal.nombre!,
	    apellido: formVal.apellido!,
	    username: formVal.username!,
	    email: formVal.email!,
	    password: formVal.password!,
	    edad: Number(formVal.edad),
	    tipoDocumento: formVal.tipoDocumento!,
	    numeroDocumento: formVal.numeroDocumento!
	};
	  
	  
    this.subscription = this.authService.registrar(registroData).subscribe({
      next: () => {
        this.router.navigate(['/ingresante']);
      },
      error: (err) => {
        this.errorMensaje = err.error?.message || 'Error al registrar el usuario';
      }
    });
  }

  ngOnDestroy(): void {
    if (this.subscription) {
      this.subscription.unsubscribe();
    }
  }
}