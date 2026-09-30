import { Component, inject } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
//para formularios reactivos y validadores predefinidos
import { Router, RouterLink } from '@angular/router';
import { AuthService } from '../auth.service';

// Módulos de PrimeNG para componentes visuales
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { PasswordModule } from 'primeng/password';
import { ButtonModule } from 'primeng/button';
import { MessageModule } from 'primeng/message';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';

@Component({
  selector: 'app-login', // nombre con el que Angular puede identificar el componente en HTML
  standalone: true, // Significa que este componente es independiente y declara directamente sus imports
  imports: [ReactiveFormsModule, RouterLink,
	//Modulos NGprime
	CardModule,
	InputTextModule,
	PasswordModule,
	ButtonModule,
	MessageModule,
	IconFieldModule,
	InputIconModule
  ],
  templateUrl: './login.html',
  styleUrl: './login.css'
})
export class LoginComponent {
  private fb = inject(FormBuilder);
  private authService = inject(AuthService);
  private router = inject(Router);

  errorMensaje: string = '';

  form = this.fb.group({ // creamos formulario con ambos campos obligatorios
    username: ['', [Validators.required]],
    password: ['', [Validators.required]]
  });

  onSubmit(): void { // se ejecuta cuando se intenta enviar el formulario
    if (this.form.invalid) return;

    this.authService.login(this.form.value as any).subscribe({ // devuelve un observable y se suscribe para recibir cualquier cambio o dato
                // recibe los valores del formulario (credenciales)
      next: (usuario) => { // si la operacion tiene exito
        console.log("Respuesta login:", usuario);
        this.router.navigate(['/menu']);
      },
      error: () => { // si la operacion falla
        this.errorMensaje = 'Usuario o contraseña incorrectos';
      }
    });
  }
}