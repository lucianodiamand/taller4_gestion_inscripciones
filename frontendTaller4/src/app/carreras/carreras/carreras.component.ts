import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CarrerasDto } from '../../../models/carreras-dto';
import { CarrerasService } from '../carreras.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-carreras',
  imports: [CommonModule, RouterLink],
  templateUrl: './carreras.component.html',
  styleUrl: './carreras.component.css',
})
export class CarrerasComponent {
  carreras$!: Observable<Array<CarrerasDto>> // observevable con arreglo de CarrerasDto
  
    constructor(private readonly servicio: CarrerasService){} //inyecto el service
  
    ngOnInit() { // se ejecuta al crear el componente. Se usa para hacer la primer carga de datos. El observable pide al servicio todos los ingresantes
        this.carreras$ = this.servicio.obtenerTodos();
    }
  
    borrar(id: number) {
      this.servicio.eliminar(id).subscribe(() => this.ngOnInit());
    }
}
