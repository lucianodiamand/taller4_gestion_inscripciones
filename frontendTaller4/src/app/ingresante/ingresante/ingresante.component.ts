import { Component,  OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { IngresanteDto } from '../../../models/ingresante-dto';
import { IngresanteService } from '../ingresante.service';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';

@Component({
  selector: 'app-ingresante',
  imports: [CommonModule, RouterLink, TableModule, ButtonModule],
  templateUrl: './ingresante.component.html',
  styleUrl: './ingresante.component.css',
})
export class IngresanteComponent implements OnInit {

  ingresantes$!: Observable<Array<IngresanteDto>> // observevable con arreglo de IngresanteDto

  constructor(private readonly servicio: IngresanteService){} //inyecto el service

  ngOnInit() { // se ejecuta al crear el componente. Se usa para hacer la primer carga de datos. El observable pide al servicio todos los ingresantes
      this.ingresantes$ = this.servicio.obtenerTodos();
  }

  borrar(id: number) {
    this.servicio.eliminar(id).subscribe(() => this.ngOnInit());
  }

}
