import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { Observable } from 'rxjs';
import { CarreraDto } from '../../models/carrera-dto';
import { CarreraService } from '../carrera.service';

@Component({
  selector: 'app-carrera',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './carrera.component.html',
  styleUrl: './carrera.component.css'
})
export class CarreraComponent implements OnInit {
  carreras$!: Observable<CarreraDto[]>;

  constructor(private carreraService: CarreraService) {}

  ngOnInit(): void {
    this.cargarCarreras();
  }

  cargarCarreras(): void {
    this.carreras$ = this.carreraService.obtenerTodas();
  }

  borrar(id?: number): void {
    if (id && confirm('¿Estás seguro de que deseas eliminar esta carrera?')) {
      this.carreraService.eliminar(id).subscribe({
        next: () => {
          this.cargarCarreras(); // Recarga la lista tras eliminar
        },
        error: (err) => console.error('Error al eliminar la carrera:', err)
      });
    }
  }
}