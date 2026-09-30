import { inject } from '@angular/core'; // permite obtener una instancia de un servicio dentro de una función
import { CanActivateFn, Router } from '@angular/router'; // CanActivateFn es el tipo de función que Angular utiliza para crear un guard
        // Un guard sirve para decidir si una ruta puede ser activada o no
        // Router permite manejar la navegación de Angular mediante código
import { AuthService } from './auth.service'; // servicio que se encarga de autenticacion

export const authGuard: CanActivateFn = () => { // creamos constante llamada authGuard que es una funcion de tipo CanActivateFn
  const authService = inject(AuthService); // inyecta authService
  const router = inject(Router); // inyectamos router

  if (authService.estaAutenticado()) { // si esta autenticado retorna true 
    return true;
  }
  router.navigate(['/login']); // si no esta autenticado lo manda a la pagina de login y retorna false 
  return false;
};