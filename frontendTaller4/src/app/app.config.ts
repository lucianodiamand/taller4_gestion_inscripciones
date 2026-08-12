import { ApplicationConfig, 
	provideBrowserGlobalErrorListeners, 
	provideZonelessChangeDetection} from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { routes } from './app.routes';
import { authInterceptor } from './auth/auth.interceptor'
import { providePrimeNG } from 'primeng/config'; // permite utilizar distintos componentes de PrimeNG, que es una biblioteca de componentes de interfaz de usuario para Angular
import Aura from '@primeuix/themes/aura'; // es un tema, determina como se ven las interfaces

export const appConfig: ApplicationConfig = {
  providers: [
    provideZonelessChangeDetection(),
    provideBrowserGlobalErrorListeners(),
    provideRouter(routes),
    provideHttpClient(withInterceptors([authInterceptor])),

    providePrimeNG({
      theme: {
        preset: Aura
      }
    })
  ]
};