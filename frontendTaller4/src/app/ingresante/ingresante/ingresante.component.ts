import { Component, OnInit, OnDestroy, inject, DestroyRef, ChangeDetectorRef } from '@angular/core';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { Observable, Subscription } from 'rxjs';
import { IngresanteDto } from '../../../models/ingresante-dto';
import { IngresanteService } from '../ingresante.service';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { AuthService } from '../../auth/auth.service';

@Component({
  selector: 'app-ingresante',
  standalone: true,
  imports: [CommonModule, RouterLink, TableModule, ButtonModule],
  templateUrl: './ingresante.component.html',
  styleUrl: './ingresante.component.css',
})
export class IngresanteComponent implements OnInit, OnDestroy {

  private readonly authService = inject(AuthService);
  private readonly servicio = inject(IngresanteService);
  private readonly destroyRef = inject(DestroyRef); // Inyección para limpiar suscripciones automáticamente
  private readonly cdr = inject(ChangeDetectorRef); // Inyectamos ChangeDetectorRef (problema de mostrar datos ingresante)
  
  // Manejador centralizado de suscripciones
  private readonly subscriptions = new Subscription();

  ingresante: IngresanteDto | null = null;
  rol: string | null = null;
  cargando: boolean = true; // Agregamos flag de carga (problema de mostrar datos ingresante)
  ingresantes$!: Observable<Array<IngresanteDto>>;

  ngOnInit() {
    this.rol = this.authService.getRol();
    console.log("Rol actual:", this.rol);

    // Si es ADMIN, asigna la lista completa
    if (this.rol === 'ADMIN') {
      this.ingresantes$ = this.servicio.obtenerTodos();
	}
	// Cargar datos del ingresante
	this.cargarDatosIngresante();
	}
	
	private cargarDatosIngresante(){
	
		// Obtener el ID del ingresante desde la sesión
		const ingresanteId = this.authService.getIngresanteId();
		if (ingresanteId) {
		      this.servicio.obtenerPorId(+ingresanteId)
		        .pipe(takeUntilDestroyed(this.destroyRef)) // Cancela automáticamente al salir de la pantalla
		        .subscribe({
		          next: (data) => {
		            console.log("Datos cargados con éxito:", data);
		            this.ingresante = data;
					this.cargando = false; //Finaliza carga (problema de mostrar datos ingresante)
					this.cdr.detectChanges(); //Forzamos a Angular a redibujar la vista (problema de mostrar datos ingresante)
		          },
		          error: (err) => {
		            console.error('Error al obtener mis datos:', err);
					this.cargando = false;
					this.cdr.detectChanges();
		          }
		        });
		    } else {
				this.cargando = false;
				this.cdr.detectChanges();
		        console.warn('Atención: No se encontró ingresanteId en localStorage/Sesión.');
		    }
		
	}

  borrar(id: number) {
    this.subscriptions.add(
      this.servicio.eliminar(id).subscribe({
        next: () => {
          // Refrescamos la lista únicamente si es ADMIN
          if (this.rol === 'ADMIN') {
            this.ingresantes$ = this.servicio.obtenerTodos();
          }
        },
        error: (err) => console.error('Error al eliminar ingresante:', err)
      })
    );
  }

  ngOnDestroy() {
    // Cancela todas las suscripciones de forma segura al destruir el componente
    this.subscriptions.unsubscribe();
  }
}