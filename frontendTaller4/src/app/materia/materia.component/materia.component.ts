import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Observable } from 'rxjs';
import { MateriaService } from '../materia.service';
import { MateriasDto } from '../../../models/materias-dto';

@Component({
  selector: 'app-carreras',
  imports: [CommonModule, RouterLink],
  templateUrl: './materia.component.html',
  styleUrl: './materia.component.css',
})
export class MateriaComponent {
  materias$!: Observable<Array<MateriasDto>> // observevable con arreglo de CarrerasDto
  
    constructor(private readonly servicio: MateriaService){} //inyecto el service
  
    ngOnInit() { // se ejecuta al crear el componente. Se usa para hacer la primer carga de datos. El observable pide al servicio todos los ingresantes
        this.materias$ = this.servicio.obtenerTodos();
    }
  
    borrar(id: number) {
      this.servicio.eliminar(id).subscribe(() => this.ngOnInit());
    }
}
