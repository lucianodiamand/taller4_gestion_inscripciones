import { CommonModule } from '@angular/common';
import { Component, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CarrerasDto } from '../../../models/carreras-dto';
import { CarrerasService } from '../carreras.service';
import { Observable } from 'rxjs';
import { AuthService } from '../../auth/auth.service';

import { ButtonModule } from 'primeng/button';
import { TableModule } from 'primeng/table';

@Component({
  selector: 'app-carreras',
  imports: [CommonModule, RouterLink, ButtonModule, TableModule],
  templateUrl: './carreras.component.html',
  styleUrl: './carreras.component.css',
})
export class CarrerasComponent {
  carreras$!: Observable<Array<CarrerasDto>> // observevable con arreglo de CarrerasDto
  
    constructor(private readonly servicio: CarrerasService){} //inyecto el service

    private authService = inject(AuthService);

    rol: String | null = null;
  
    ngOnInit() { // se ejecuta al crear el componente. Se usa para hacer la primer carga de datos. El observable pide al servicio todos los ingresantes
        this.carreras$ = this.servicio.obtenerTodos();
        this.rol = this.authService.getRol();
        console.log("Rol actual:", this.rol);
    }
  
    borrar(id: number) {
      this.servicio.eliminar(id).subscribe(() => this.ngOnInit());
    }

}
