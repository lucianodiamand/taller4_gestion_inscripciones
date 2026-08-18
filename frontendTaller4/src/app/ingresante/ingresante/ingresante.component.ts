import { Component,  OnInit, inject} from '@angular/core';
import { Observable } from 'rxjs';
import { IngresanteDto } from '../../../models/ingresante-dto';
import { IngresanteService } from '../ingresante.service';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { AuthService } from '../../auth/auth.service';

@Component({
  selector: 'app-ingresante',
  imports: [CommonModule, RouterLink, TableModule, ButtonModule],
  templateUrl: './ingresante.component.html',
  styleUrl: './ingresante.component.css',
})
export class IngresanteComponent implements OnInit {

	private authService = inject(AuthService);
	ingresante: IngresanteDto | null = null;

	  rol: String | null = null;
  ingresantes$!: Observable<Array<IngresanteDto>> // observevable con arreglo de IngresanteDto

  constructor(private readonly servicio: IngresanteService){} //inyecto el service

  ngOnInit() {

    this.rol = this.authService.getRol();

    if (this.rol === 'ADMIN') {

      // El ADMIN puede ver todos
      this.ingresantes$ = this.servicio.obtenerTodos();

    } else {

      // El usuario común solamente obtiene su propio ingresante
      const ingresanteId = this.authService.getIngresanteId();

      if (ingresanteId) {

        this.servicio.obtenerPorId(ingresanteId).subscribe({
          next: (data) => {
            this.ingresante = data;
          },
          error: (err) => {
            console.error('Error al obtener mis datos:', err);
          }
        });

      } else {

        console.error('No se encontró el ID del ingresante');

      }
    }

    console.log("Rol actual:", this.rol);
  }

  borrar(id: number) {
    this.servicio.eliminar(id).subscribe(() => this.ngOnInit());
  }

}
