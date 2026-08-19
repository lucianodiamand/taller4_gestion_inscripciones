import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs';
import { UsuarioRequestDTO, UsuarioResponseDTO, UsuarioRegisterRequestDTO } from '../../models/auth-dto';

@Injectable({ providedIn: 'root' })
export class AuthService {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://localhost:8080/auth';

  registrar(data: UsuarioRegisterRequestDTO): Observable<UsuarioResponseDTO> {
    return this.http.post<UsuarioResponseDTO>(`${this.apiUrl}/register`, data).pipe(
      tap(res => {
        this.guardarUsuario(res);
        if (res.token) this.guardarToken(res.token);
      })
    );
  }

  login(credentials: UsuarioRequestDTO): Observable<UsuarioResponseDTO> {
    return this.http.post<UsuarioResponseDTO>(`${this.apiUrl}/login`, credentials).pipe(
      tap(res => {
        this.guardarUsuario(res);
        if (res.token) this.guardarToken(res.token);
      })
    );
  }

  private guardarToken(token: string): void {
    localStorage.setItem('auth_token', token);
  }

  getToken(): string | null {
    return localStorage.getItem('auth_token');
  }

  private guardarUsuario(usuario: UsuarioResponseDTO): void {
    localStorage.setItem('usuario', JSON.stringify(usuario));
  }

  getUsuario(): UsuarioResponseDTO | null {
    const usuario = localStorage.getItem('usuario');
    return usuario ? JSON.parse(usuario) : null;
  }

  getRol(): string | null {
    const usuario = this.getUsuario();
    return usuario ? usuario.rol : null;
  }

  getIngresanteId(): number | null {
    const usuario = this.getUsuario() as any;
    if (!usuario) return null;

    // Verifica las distintas variantes con las que el backend podría nombrar el campo
    const id = usuario.ingresanteId ?? usuario.idIngresante ?? usuario.ingresante?.id;

    if (!id) {
      console.warn('El objeto usuario en localStorage no posee ID de ingresante:', usuario);
    }

    return id ? Number(id) : null;
  }

  estaAutenticado(): boolean {
    return !!this.getToken();
  }

  logout(): void {
    localStorage.removeItem('auth_token');
    localStorage.removeItem('usuario');
  }
}