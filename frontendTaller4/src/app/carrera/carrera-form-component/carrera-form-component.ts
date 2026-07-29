import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { CarreraService } from '../carrera.service';

@Component({
  selector: 'app-carrera-form',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink],
  templateUrl: './carrera-form.component.html',
  styleUrl: './carrera-form.component.css'
})
export class CarreraFormComponent implements OnInit {
  carreraForm!: FormGroup;
  isEditMode: boolean = false;
  carreraId?: number;

  constructor(
    private fb: FormBuilder,
    private carreraService: CarreraService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    // Inicializar el formulario reactive
    this.carreraForm = this.fb.group({
      id: [null],
      nombre: ['', [Validators.required]],
      duracionAnios: ['', [Validators.required, Validators.min(1)]]
    });

    // Detectar si venimos a editar (si hay un :id en la URL)
    const idParam = this.route.snapshot.paramMap.get('id');
    if (idParam) {
      this.isEditMode = true;
      this.carreraId = Number(idParam);
      this.cargarCarrera(this.carreraId);
    }
  }

  cargarCarrera(id: number): void {
    this.carreraService.obtenerPorId(id).subscribe({
      next: (data) => this.carreraForm.patchValue(data),
      error: (err) => console.error('Error al cargar la carrera:', err)
    });
  }

  guardar(): void {
    if (this.carreraForm.invalid) {
      return;
    }

    const carreraData = this.carreraForm.value;

    if (this.isEditMode && this.carreraId) {
      this.carreraService.actualizar(this.carreraId, carreraData).subscribe({
        next: () => this.router.navigate(['/carrera']),
        error: (err) => console.error('Error al actualizar:', err)
      });
    } else {
      this.carreraService.crear(carreraData).subscribe({
        next: () => this.router.navigate(['/carrera']),
        error: (err) => console.error('Error al crear:', err)
      });
    }
  }
}