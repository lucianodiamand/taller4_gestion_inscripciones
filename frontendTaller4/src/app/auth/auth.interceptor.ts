import { HttpInterceptorFn } from '@angular/common/http'; // tipo de función utilizado para crear un interceptor HTTP
import { inject } from '@angular/core';
import { AuthService } from './auth.service';

export const authInterceptor: HttpInterceptorFn = (req, next) => { 
  // el interceptor tiene como parametros req (peticion HTTP que angular esta por enviar al back) y next representa el siguiente paso y continua con la peticion                               
  const authService = inject(AuthService); // obtenemos authService
  const token = authService.getToken(); // obtenemos el token JWT

  if (token) { // si el token existe 
    req = req.clone({ // clonamos la peticion original y generamos una copia sobre la cual agregamos el header
      setHeaders: { Authorization: `Bearer ${token}` } // el jwt viaja al back con el formato establecido
    });
  }
  return next(req); // se envia la peticion al back  con el jwt 
};