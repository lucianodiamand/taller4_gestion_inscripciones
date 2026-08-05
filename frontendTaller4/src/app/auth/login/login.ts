import { Component, inject } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [ReactiveFormsModule, RouterLink],
  templateUrl: './login.html',
  styleUrl: './login.css'
})
export class LoginComponent {
  private fb = inject(FormBuilder);
  private authService = inject(AuthService);
  private router = inject(Router);

  errorMensaje: string = '';

  form = this.fb.group({
    username: ['', [Validators.required]],
    password: ['', [Validators.required]]
  });

  onSubmit(): void {
    if (this.form.invalid) return;

    this.authService.login(this.form.value as any).subscribe({
      next: (usuario) => {
        console.log("Respuesta login:", usuario);
        this.router.navigate(['/menu']);
      },
      error: () => {
        this.errorMensaje = 'Usuario o contraseña incorrectos';
      }
    });
  }
}