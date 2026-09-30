import { Injectable , inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs';
import { Router } from '@angular/router';
import { UsuarioRequestDTO, UsuarioResponseDTO, UsuarioRegisterRequestDTO } from '../../models/auth-dto';



//localStorage puede usarse sin declarar ya que es un api que proporciona el navegador 
// permite guardar info asociada al sitio

@Injectable({ providedIn: 'root' }) // indica que esta clase puede ser utilizada como un servicio mediante inyección de dependencias
   // providedIn: 'root' significa que Angular crea una instancia disponible para toda la aplicación
export class AuthService {
  private readonly http = inject(HttpClient); // este objeto lo usamos para comunicarnos con el back
  private readonly apiUrl = 'http://localhost:8080/auth'; // url base del endpoint de autenticacion del back
  private readonly router = inject(Router); // para navegar entre rutas 

  registrar(data: UsuarioRegisterRequestDTO): Observable<UsuarioResponseDTO> { // recibe los datos para registrar un usuario
    // devuelve un observable, por lo que la respuesta del backend llega de manera asíncrona
    return this.http.post<UsuarioResponseDTO>(`${this.apiUrl}/register`, data).pipe( // hace un POST y espera que el backend responda con UsuarioResponseDTO, por lo que es asincrono
                    // pipe permite encadenar operadores
      tap(res => { // tap permite ejecutar acciones externas que no modifican ni transforman los datos originales del flujo
        this.guardarUsuario(res); // guardamos en localstorage la información del usuario que devuelve el backend
        if (res.token) this.guardarToken(res.token); // si tiene token lo guardamos
      })
    );
  }

  login(credentials: UsuarioRequestDTO): Observable<UsuarioResponseDTO> { // recibe credenciales (username y password)
    return this.http.post<UsuarioResponseDTO>(`${this.apiUrl}/login`, credentials).pipe( // hace el post 
      tap(res => { 
        this.guardarUsuario(res); // guardamos la respuesta del backend
        if (res.token) this.guardarToken(res.token); // si tiene token se guarda 
      })
    );
  }

  private guardarToken(token: string): void {
    localStorage.setItem('auth_token', token); // localStorage es almacenamiento del navegador donde se guarda el token
  }

  getToken(): string | null { // devuelve string o nada
    return localStorage.getItem('auth_token'); // devuelve el JWT
  }

  private guardarUsuario(usuario: UsuarioResponseDTO): void {
    localStorage.setItem('usuario', JSON.stringify(usuario)); // convierte objeto en string
  }

  getUsuario(): UsuarioResponseDTO | null {
    const usuario = localStorage.getItem('usuario');
    return usuario ? JSON.parse(usuario) : null; // convierte string en objeto
  }

  getRol(): string | null {
    const usuario = this.getUsuario();
    return usuario ? usuario.rol : null;
  }

  getIngresanteId(): number | null {
    const usuario = this.getUsuario() as any; // obtenemos el usuario como any 
    if (!usuario) return null;

    // Verifica las distintas variantes con las que el backend podría nombrar el campo
    const id = usuario.ingresanteId ?? usuario.idIngresante ?? usuario.ingresante?.id; // ?? Si lo de la izquierda es null o undefined, intenta lo de la derecha
                    //  ? trata de acceder a id, pero solamente si ingresante existe
    if (!id) {
      console.warn('El objeto usuario en localStorage no posee ID de ingresante:', usuario);
    }

    return id ? Number(id) : null; // si existe lo convierte a numero
  }

  estaAutenticado(): boolean {
    return !!this.getToken(); // !! son dos negaciones. Devuelvo true si getToken() devuelve algo y false si no devuelve nada
  }

  logout(): void { // cierra sesion
	// Limpiar almacenamiento local / de sesión
    localStorage.removeItem('auth_token');
    localStorage.removeItem('usuario');
	localStorage.removeItem('rol');
	sessionStorage.clear();
	
	// 2. Redirigir al login
	this.router.navigate(['/login']);
  }
}