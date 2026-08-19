import { ApplicationConfig, 
	provideBrowserGlobalErrorListeners, 
	provideZonelessChangeDetection} from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient, withInterceptors } from '@angular/common/http';

import { routes } from './app.routes';
import { authInterceptor } from './auth/auth.interceptor'
//import { AuthService } from './auth/auth.service';

// Importaciones de PrimeNG y Temas
import { providePrimeNG } from 'primeng/config';
import Aura from '@primeuix/themes/aura';

export const appConfig: ApplicationConfig = {
  providers: [
    provideZonelessChangeDetection(),
    provideBrowserGlobalErrorListeners(),
    provideRouter(routes),
    provideHttpClient(withInterceptors([authInterceptor])),
	
	
	// Configuración de PrimeNG
	providePrimeNG({
	      theme: {
	        preset: Aura, // Puedes cambiar Aura por Lara, Nora o Material
	        options: {
	          darkModeSelector: 'system' // Opción por defecto: responde al tema del S.O.
	        }
	      }
	    })
  ]
};