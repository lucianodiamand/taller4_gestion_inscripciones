import { Routes } from '@angular/router';
import { IngresanteComponent } from './ingresante/ingresante/ingresante.component';
import { IngresanteFormComponent } from './ingresante/ingresante-form-component/ingresante-form-component';
import { CarrerasComponent } from './carreras/carreras/carreras.component';
import { CarrerasFormComponent } from './carreras/carreras-form-form-component/carreras-form-component';

export const routes: Routes = [
  
  // Rutas de Ingresantes
  { path: 'ingreso', component: IngresanteComponent }, // muestra la lista 
  { path: 'ingreso/crear', component: IngresanteFormComponent }, // va al formulario para crear
  { path: 'ingreso/editar/:id', component: IngresanteFormComponent }, // va al formulario para editar
  
  // Rutas de Carreras
  { path: 'carrera', component: CarrerasComponent },
  { path: 'carrera/crear', component: CarrerasFormComponent },
  { path: 'carrera/editar/:id', component: CarrerasFormComponent },
    
  // Rutas por defecto
  { path: '', redirectTo: 'ingreso', pathMatch: 'full' }, // va a /ingreso
];
