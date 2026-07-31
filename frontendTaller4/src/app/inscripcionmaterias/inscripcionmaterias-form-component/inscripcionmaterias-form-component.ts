import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { InscripcionMateriaResponseDto, InscripcionMateriaRequestDto } from '../../../models/inscripcion-materia-dto';
import { InscripcionMateriaService } from '../inscripcionmateria.service';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule} from '@angular/forms';

@Component({
  selector: 'app-inscripcion-materia',
  templateUrl: './inscripcionmaterias-form-component.html',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  styleUrl: './inscripcionmaterias-form-component.css'
})
export class InscripcionMateriaComponent {

  inscripciones$: Observable<InscripcionMateriaRequestDto[]>;

  constructor(private readonly servicio: InscripcionMateriaService) {
    this.inscripciones$ = this.servicio.listar();
  }

  borrar(id: number) {
    this.servicio.borrar(id).subscribe(() => {
      this.inscripciones$ = this.servicio.listar();
    });
  }
}
