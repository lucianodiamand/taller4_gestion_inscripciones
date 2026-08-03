import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators, AbstractControl, ValidationErrors } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { IngresanteService } from '../ingresante.service';
import { Subscription } from 'rxjs';
import { IngresanteDto } from '../../../models/ingresante-dto';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-ingresante-form',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './ingresante-form-component.html',
  styleUrl: './ingresante-form-component.css',
})
export class IngresanteFormComponent implements OnInit, OnDestroy {

  ingresanteForm: FormGroup; // propiedad para contener el formulario

  id: string | null = null; // si es null, estoy creando. Si tiene valor, estoy editando

  subscription!: Subscription; // guarda la referencia a la subscripcion. Subscribe sirve para activar un Observable y empezar a recibir los datos o eventos que este emite a lo largo del tiempo 
    //subscribe es un metodo que recibe una funcion como argumento 

  constructor(
    private readonly fb: FormBuilder, // inyecto un FormBuilder para un formulario
    private readonly servicio: IngresanteService, //inyecto el service
    private readonly route: ActivatedRoute, // sirve para indicar la ruta en la que estoy parado y acceder a informacion de la url
    private readonly router: Router // sirve para cambiar de url sin que el usuario clickee un link
  ) {
    this.ingresanteForm = this.fb.group({
	  //solo letras en nombre y apellido
      nombre: ['', [Validators.required, Validators.pattern(/^[a-zA-Z\s]+$/)]],
      apellido: ['', [Validators.required, Validators.pattern(/^[a-zA-Z\s]+$/)]],
      tipoDocumento: ['', Validators.required],
	  numeroDocumento: ['', Validators.required],
	  //edad entre 1 y 100 anios
	  edad: ['', [
	    Validators.required,
	    Validators.min(1),
	    Validators.max(100)
	  ]],
	  //debe contener @
      email: ['', [Validators.required, Validators.pattern('.*@.*')]],
    },{
	        //Validador personalizado a nivel de formulario para evaluar Tipo + Número juntos
	        validators: this.validarDocumentoSegunTipo
	      });
  }

  ngOnInit() {
    this.id = this.route.snapshot.paramMap.get('id'); // se ejecuta al crear el componente. Se usa para hacer la primer carga de datos. El observable pide a la ruta el valor id de la url
    console.log('ID leído de la URL:', this.id);

	// Escuchamos los cambios en tipoDocumento para re-evaluar la validacion del numero al cambiar la seleccion
	this.ingresanteForm.get('tipoDocumento')?.valueChanges.subscribe(() => {
	      this.ingresanteForm.get('numeroDocumento')?.updateValueAndValidity();
	    });
  if (this.id) { // si el valor de id existe llamo a obtenrPorId para obtener el ingresante
    this.subscription = this.servicio.obtenerPorId(+this.id).subscribe({
      next: (ingresante: IngresanteDto) => {
        this.ingresanteForm.patchValue(ingresante);
      },
      error: (err) => {
        console.error('Error al buscar el ingresante:', err);
      }
    });
  }
}
/*
    Validador personalizado para los requisitos de los tipos de documentos
*/
validarDocumentoSegunTipo(control: AbstractControl): ValidationErrors | null {
    const tipo = control.get('tipoDocumento')?.value;
    const numeroControl = control.get('numeroDocumento');

    if (!tipo || !numeroControl || !numeroControl.value) {
      return null;
    }
	const numero = String(numeroControl.value).trim();

	    // 1) DNI o Libreta Cívica: Solo numeros, entre 7 y 8 digitos
	    if (tipo === 'DNI' || tipo === 'Libreta Cívica') {
	      const esValido = /^\d{7,8}$/.test(numero);
	      if (!esValido) {
	        numeroControl.setErrors({ documentoInvalido: 'Debe contener entre 7 y 8 números.' });
	        return { documentoInvalido: true };
	      }
	    }

	    // 2) Pasaporte: Exactamente 3 letras seguidas de 6 números (ej: ABC123456)
	    if (tipo === 'Pasaporte') {
	      const esValido = /^[a-zA-Z]{3}\d{6}$/.test(numero);
	      if (!esValido) {
	        numeroControl.setErrors({ documentoInvalido: 'El pasaporte debe tener 3 letras seguidas de 6 números.' });
	        return { documentoInvalido: true };
	      }
	    }

	    // Si todo esta bien, limpiamos los errores especificos de este campo si existian
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
    this.ingresanteForm.markAllAsTouched(); // Marca todos los campos como "tocados" para mostrar errores visuales en la plantilla HTML
    return;
  }
  
  if (this.id) { // si recibo el id es porque se va actualizar un ingresante
    this.subscription = this.servicio.actualizar(+this.id, this.ingresanteForm.value).subscribe({ // subscribe es la accion que se ejecuta cuando se inicia una peticion HTTP al backend
      // this.ingresanteForm.value devuelve un objeto plano con los campos del formulario
            // this.subscription se usa para guardar la referencia de una suscripción a un Observable y poder cancelarla más tarde
      // next y error son las callbacks que se ejecutan cuando el navegador recibe la respuesta de la peticion HTTP al backend
      next: () => { // define que accion se debe ejecutar cada vez que el observable emite un nuevo valor exitoso
        this.router.navigate(['/ingreso']); // vuelvo a la url principal del navegador para ingresos
      },
      error: (err) => { // se ejecuta si algo sale mal
        console.error('Error al actualizar el ingresante:', err);
      }
    });
  } else { // si no recibo un id es porque se quiere crear un ingresante
    this.subscription = this.servicio.crear(this.ingresanteForm.value).subscribe({ // this.ingresanteForm.value devuelve un objeto plano con los campos del formulario y crear arma el observable
      next: () => {
        this.router.navigate(['/ingreso']);
      },
      error: (err) => {
        console.error('Error al crear el ingresante:', err);
      }
    });
  }
}

ngOnDestroy(){ // para cancelar la suscripcion
    this.subscription.unsubscribe();
  }

}