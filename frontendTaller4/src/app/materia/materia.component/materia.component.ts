import { CommonModule } from '@angular/common';
import { Component, OnInit, inject } from '@angular/core';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { Observable } from 'rxjs';

import { MateriaService } from '../materia.service';
import { MateriasDto } from '../../../models/materias-dto';
import { AuthService } from '../../auth/auth.service';

import { ButtonModule } from 'primeng/button';
import { TableModule } from 'primeng/table';
import { InputTextModule } from 'primeng/inputtext';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { SelectModule } from 'primeng/select';

@Component({
  selector: 'app-materias',
  imports: [
	CommonModule,
	RouterLink,
	ButtonModule, 
	TableModule,
	InputTextModule,
	IconFieldModule,
	InputIconModule,
	SelectModule],
  templateUrl: './materia.component.html',
  styleUrl: './materia.component.css',
})
export class MateriaComponent implements OnInit {
  materias$!: Observable<Array<MateriasDto>> // observevable con arreglo de MateriasDto
  
  	aniosOptions = [
      { label: '1° Año', value: 1 },
      { label: '2° Año', value: 2 },
      { label: '3° Año', value: 3 },
      { label: '4° Año', value: 4 },
      { label: '5° Año', value: 5 },
	  { label: '6° Año', value: 6 },
    ]; //para poder filtrar por anios en el html
  
    constructor(private readonly servicio: MateriaService){} //inyecto el service

    private authService = inject(AuthService);
    private materiaService = inject(MateriaService);
    private route = inject(ActivatedRoute);

    rol: String | null = null;

    carreraId: number | null = null;
  
    ngOnInit() { // se ejecuta al crear el componente. Se usa para hacer la primer carga de datos. El observable pide al servicio todos los ingresantes
        this.rol = this.authService.getRol();
        const id = this.route.snapshot.paramMap.get('id');

        if (id) {
          this.carreraId = Number(id);
          // Venimos desde una carrera
          this.materias$ = this.materiaService.obtenerPorCarrera(this.carreraId);
        } else {
          // Listado general de materias
          this.materias$ = this.servicio.obtenerTodos();
        }
        console.log("Rol actual:", this.rol);
    }
  
    borrar(id: number) {
      this.servicio.eliminar(id).subscribe(() => {
        if (this.carreraId !== null) {
          this.materias$ =
          this.servicio.obtenerPorCarrera(this.carreraId);
        } else {
          this.materias$ = this.servicio.obtenerTodos();
      }
    });
  }
  
}
