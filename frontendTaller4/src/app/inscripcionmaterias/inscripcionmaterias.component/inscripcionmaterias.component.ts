import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { InscripcionCarreraResponseDto } from '../../../models/inscripcion-carrera-dto';
import { IngresanteDto } from '../../../models/ingresante-dto';
import { CarrerasDto } from '../../../models/carreras-dto';
import { InscripcionMateriaService } from '../inscripcionmateria.service';
import { IngresanteService } from '../../ingresante/ingresante.service';
import { CarrerasService } from '../../carreras/carreras.service';

@Component({
  selector: 'app-inscripcionmaterias.component',
  imports: [],
  templateUrl: './inscripcionmaterias.component.html',
  styleUrl: './inscripcionmaterias.component.css',
})
export class InscripcionmateriasComponent {}