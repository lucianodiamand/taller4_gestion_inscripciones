import { Routes } from '@angular/router';
import { IngresanteComponent } from './ingresante/ingresante/ingresante.component';
import { IngresanteFormComponent } from './ingresante/ingresante-form-component/ingresante-form-component';


export const routes: Routes = [
  { path: 'ingreso', component: IngresanteComponent }, // muestra la lista 
  { path: 'ingreso/crear', component: IngresanteFormComponent }, // va al formulario para crear
  { path: 'ingreso/editar/:id', component: IngresanteFormComponent }, // va al formulario para editar
  { path: '', redirectTo: 'ingreso', pathMatch: 'full' }, // va a /ingreso
];
