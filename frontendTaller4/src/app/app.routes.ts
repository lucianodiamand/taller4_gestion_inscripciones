import { Routes } from '@angular/router';
import { IngresanteComponent } from './ingresante/ingresante/ingresante.component';
import { IngresanteFormComponent } from './ingresante/ingresante-form-component/ingresante-form-component';
import { CarreraComponent } from './carrera/carrera/carrera.component';
import { CarreraFormComponent } from './carrera/carrera-form-component/carrera-form-component';


export const routes: Routes = [
  
  // Rutas de Ingresantes
  { path: 'ingreso', component: IngresanteComponent }, // muestra la lista 
  { path: 'ingreso/crear', component: IngresanteFormComponent }, // va al formulario para crear
  { path: 'ingreso/editar/:id', component: IngresanteFormComponent }, // va al formulario para editar
  
  // Rutas de Carreras
  { path: 'carrera', component: CarreraComponent },
  { path: 'carrera/crear', component: CarreraFormComponent },
  { path: 'carrera/editar/:id', component: CarreraFormComponent },
    
  // Rutas por defecto
  { path: '', redirectTo: 'ingreso', pathMatch: 'full' }, // va a /ingreso
];
