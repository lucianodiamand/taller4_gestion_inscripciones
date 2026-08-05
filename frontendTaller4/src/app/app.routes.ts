import { Routes } from '@angular/router';
// Importa Auth (Login y Registro)
import { LoginComponent } from './auth/login/login';
import { RegistroComponent } from './auth/registro/registro';
//Importa Ingresante
import { IngresanteComponent } from './ingresante/ingresante/ingresante.component';
import { IngresanteFormComponent } from './ingresante/ingresante-form-component/ingresante-form-component';
//Importa Carreras 
import { CarrerasComponent } from './carreras/carreras/carreras.component';
import { CarrerasFormComponent } from './carreras/carreras-form-form-component/carreras-form-component';
//Importa Materias
import { MateriaComponent } from './materia/materia.component/materia.component';
import { MateriaFormComponent } from './materia/materia-form-component/materia-form-component';
//Importaciones de Inscripción a carrera 
import { InscripcionFormComponent } from './inscripcioncarreras/inscripcioncarreras-form-component/inscripcioncarreras-form-component';

//Importaciones de Inscripción a materia: 

import { InscripcionMateriaFormComponent } from './inscripcionmaterias/inscripcionmaterias-form-component/inscripcionmaterias-form-component';
import { MenuPrincipalComponent } from './menu.principal.component/menu.principal.component';

//import {InscripcionMateriaComponent} from './inscripcionmaterias/inscripcionmaterias.component/inscripcionmaterias.component';

export const routes: Routes = [
	
  // Rutas de Autenticacion
  { path: 'login', component: LoginComponent },
  { path: 'registro', component: RegistroComponent },
  
  // Rutas de Ingresantes
  { path: 'ingresante', component: IngresanteComponent }, // muestra la lista 
  { path: 'ingresante/crear', component: IngresanteFormComponent }, // va al formulario para crear
  { path: 'ingresante/editar/:id', component: IngresanteFormComponent }, // va al formulario para editar
  
  // Rutas de Carreras
  { path: 'carrera', component: CarrerasComponent },
  { path: 'carrera/crear', component: CarrerasFormComponent },
  { path: 'carrera/editar/:id', component: CarrerasFormComponent },
  
  // Rutas de Materias
  { path: 'materias', component: MateriaComponent },
  { path: 'materias/crear', component: MateriaFormComponent },       
  { path: 'materias/editar/:id', component: MateriaFormComponent },

  // Rutas de Inscripcion a la carrera
  { path: 'inscripcion/carrera', component: InscripcionFormComponent },
  
  // Rutas de inscripcion a materia: 
  { path: 'inscripcion/materia', component: InscripcionMateriaFormComponent },  

  // Ruta de menu principal
  { path: 'menu', component: MenuPrincipalComponent },
  
  // Rutas por defecto
  { path: '', redirectTo: 'login', pathMatch: 'full' }, //va por defecto al login
];
