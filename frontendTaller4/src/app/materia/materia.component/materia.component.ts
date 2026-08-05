import { CommonModule } from '@angular/common';
import { Component, OnInit, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Observable } from 'rxjs';
import { MateriaService } from '../materia.service';
import { MateriasDto } from '../../../models/materias-dto';
import { AuthService } from '../../auth/auth.service';

@Component({
  selector: 'app-materias',
  imports: [CommonModule, RouterLink],
  templateUrl: './materia.component.html',
  styleUrl: './materia.component.css',
})
export class MateriaComponent implements OnInit {
  materias$!: Observable<Array<MateriasDto>> // observevable con arreglo de CarrerasDto
  
    constructor(private readonly servicio: MateriaService){} //inyecto el service
    private authService = inject(AuthService);

    rol: String | null = null;
  
    ngOnInit() { // se ejecuta al crear el componente. Se usa para hacer la primer carga de datos. El observable pide al servicio todos los ingresantes
        this.materias$ = this.servicio.obtenerTodos();
        this.rol = this.authService.getRol();
        console.log("Rol actual:", this.rol);
    }
  
    borrar(id: number) {
      this.servicio.eliminar(id).subscribe(() => this.ngOnInit());
    }
}
