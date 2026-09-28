import { Component, OnInit, ChangeDetectorRef} from '@angular/core';
import { InscripcionMateriaResponseDto, InscripcionMateriaRequestDto } from '../../../models/inscripcion-materia-dto';
import { InscripcionMateriaService } from '../inscripcionmateria.service';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, FormsModule, Validators} from '@angular/forms';
import { InscripcionCarreraResponseDto } from '../../../models/inscripcion-carrera-dto';
import { MateriasDto } from '../../../models/materias-dto';
import { InscripcionCarreraService } from '../../inscripcioncarreras/inscripcioncarreras.service';
import { MateriaService } from '../../materia/materia.service';
import { RouterLink } from '@angular/router';
import { AuthService } from '../../auth/auth.service';

import { ButtonModule } from 'primeng/button';
import { SelectModule } from 'primeng/select';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { CardModule } from 'primeng/card';
import { MessageModule } from 'primeng/message';

@Component({
  selector: 'app-inscripcion-materia',
  templateUrl: './inscripcionmaterias-form-component.html',
  standalone: true,
  imports: [ReactiveFormsModule,
	 CommonModule,
	 RouterLink,
	 ButtonModule, 
	 SelectModule, 
	 InputTextModule, 
	 TableModule, 
	 CardModule, 
	 MessageModule, 
	 FormsModule],
  styleUrl: './inscripcionmaterias-form-component.css'
})
export class InscripcionMateriaFormComponent implements OnInit {

  inscripcionForm: FormGroup;
  inscripciones: InscripcionMateriaResponseDto[] = [];
  inscripcionesCarreras: InscripcionCarreraResponseDto[] = [];
  materias: MateriasDto[] = [];
  materiasFiltradas: MateriasDto[] = [];
  //dnis: string[]; 
  //dniSeleccionado: string = '';
  inscripcionesCarrerasFiltradas: InscripcionCarreraResponseDto[] = [];
  rol: string | null = null;


  constructor(
    private fb: FormBuilder,
    private inscripcionMateriaService: InscripcionMateriaService,
    private inscripcionCarreraService: InscripcionCarreraService,
    private materiaService: MateriaService,
    private authService: AuthService,
    private cdr: ChangeDetectorRef
  ) {
    const hoy = new Date().toISOString().split('T')[0];

    this.inscripcionForm = this.fb.group({
      inscripcionCarreraId: ['', Validators.required],
      materiaId: ['', Validators.required],
      fechaInscripcion: [hoy, Validators.required]
    });
  }

  ngOnInit(): void {

    this.rol = this.authService.getRol();

    this.cargarListas();
    this.cargarInscripciones();

    this.inscripcionForm.get('inscripcionCarreraId')!.valueChanges.subscribe((valor: string) => {
      const inscripcionCarreraId = +valor;
      this.filtrarMaterias(inscripcionCarreraId);
    });
    // this.inscripcionForm.get('inscripcionCarreraId') para acceder al campo especifico pasado por parametro
    // valueChanges emite un nuevo valor cada vez que el campo cambia (por medio del selector)
    // por medio del suscribe, cada vez que se emite un nuevo valor lo castea a number y lo pasa como parametro a la funcion
  }

  cargarListas(): void {
    // Cargar inscripciones a carrera

    if(this.rol === 'ADMIN'){
      this.inscripcionCarreraService.obtenerTodas().subscribe({
      next: (data: InscripcionCarreraResponseDto[]) => {
        //this.inscripcionesCarreras = data;
		//this.dnis = [
			//...new Set(data.map(ins => ins.numeroDocumento))
		//];
		
        this.cdr.detectChanges();	//por si llego info y no se percato, fuerza la actualizacion del DOM
      },
      error: (err: any) => console.error('Error al obtener inscripciones a carrera:', err)
    });
    } else {
      const ingresanteId = this.authService.getIngresanteId();
      if(ingresanteId){
        this.inscripcionCarreraService.obtenerPorIngresante(ingresanteId).subscribe({
          next: (data: InscripcionCarreraResponseDto[]) => {
            this.inscripcionesCarreras = data;
            this.cdr.detectChanges();
          },
          error: (err: any) => console.error('Error al obtener mis inscripciones a carrera:', err)
          });
      }
    }

    // Cargar materias 
    this.materiaService.obtenerTodos().subscribe({
      next: (data: MateriasDto[]) => this.materias = data,
      error: (err: any) => console.error('Error al obtener materias:', err)
    });
  }

  cargarInscripciones(): void {

    if(this.rol === 'ADMIN'){
      this.inscripcionMateriaService.obtenerTodas().subscribe({
      next: (data: InscripcionMateriaResponseDto[]) => {
        this.inscripciones = data;
        this.cdr.detectChanges();
      },
      error: (err: any) => console.error('Error al cargar inscripciones a materia:', err)
    });
    } else {
      const ingresanteId = this.authService.getIngresanteId();
      if(ingresanteId){
          this.inscripcionMateriaService.obtenerPorIngresante(ingresanteId).subscribe({
            next: (data: InscripcionMateriaResponseDto[]) => {
              this.inscripciones = data; //cargamos las inscripciones y sus notas.
			  
			  //si tenemos una carrera seleccionada, volvemos a calcular las materias disponibles:
			  const inscripcionCarreraId = Number(this.inscripcionForm.value.inscripcionCarreraId);
			  
			  if(inscripcionCarreraId){
				this.filtrarMaterias(inscripcionCarreraId);
			  }
			  
              this.cdr.detectChanges();
            },
            error: (err: any) => console.error('Error al cargar mis inscripciones:', err)
          });
      }
    }
  }

filtrarMaterias(inscripcionCarreraId: number): void {
  const inscripcionElegida = this.inscripcionesCarreras.find(i => i.id === inscripcionCarreraId);

  if (!inscripcionElegida) {
    this.materiasFiltradas = [];
    return;
  }

  // Si es ADMIN: Muestra las materias donde el alumno ya esta registrado (para cargar/editar notas)
  if (this.rol === 'ADMIN') {
    const materiasInscripto = this.inscripciones
      .filter(ins => ins.inscripcionCarreraId === inscripcionCarreraId)
      .map(ins => ins.materiaId);

    this.materiasFiltradas = this.materias.filter(materia => materiasInscripto.includes(materia.id));
    return;
  }

  // Si es ESTUDIANTE / GUEST:
  const idsMateriasInscriptas = this.inscripciones.map(ins => ins.materiaId);

  this.materiasFiltradas = this.materias.filter(materia => {
    // 1. Debe pertenecer a la carrera seleccionada
    if (materia.carreraId !== inscripcionElegida.carreraId) {
      return false;
    }

    // 2. NO debe estar inscripto previamente (ni aprobada ni cursando)
    if (idsMateriasInscriptas.includes(materia.id)) {
      return false;
    }

    // 3. REGLA DE CUATRIMESTRES Y CORRELATIVAS:
    // Si es del 1º Año y 1º Cuatrimestre, se habilita directamente
    const esPrimerCuatrimestre = materia.anio === 1 && materia.cuatrimestre === 1;

    if (esPrimerCuatrimestre) {
      return true;
    }

    // Para cualquier otro cuatrimestre posterior, debe cumplir las correlativas
    return this.puedeCursarMateria(materia);
  });

  // Limpia la seleccion previa del formulario si la materia elegida ya no forma parte de la lista filtrada
  const materiaActual = Number(this.inscripcionForm.value.materiaId);
  if (materiaActual && !this.materiasFiltradas.some(m => m.id === materiaActual)) {
    this.inscripcionForm.patchValue({ materiaId: '' });
  }
}


  materiaEstaAprobada(materiaId: number): boolean{
	const inscripcion = this.inscripciones.find(ins => ins.materiaId === materiaId); 
	
	return !!inscripcion && inscripcion.nota !== null && inscripcion.nota >= 6; 
  }
  
  puedeCursarMateria(materia: MateriasDto):boolean{
	//Sino tiene correlativas la materia, puede cursarla: 
	if(!materia.correlativasIds || materia.correlativasIds.length === 0){
		return true;
	}
	//aca todas las correlativas deben estar aprobadas: 
	return materia.correlativasIds.every(correlativaId => this.materiaEstaAprobada(correlativaId));
  }
  
  actualizarNota(inscripcion: InscripcionMateriaResponseDto): void{
	const dto: InscripcionMateriaRequestDto = {
		fechaInscripcion: inscripcion.fechaInscripcion, 
		inscripcionCarreraId: inscripcion.inscripcionCarreraId, 
		materiaId: inscripcion.materiaId, 
		nota: inscripcion.nota
	};
	
	this.inscripcionMateriaService.actualizar(inscripcion.id, dto).subscribe({
		next: () => {
			alert('Nota actualizada correctamente.');
			this.cargarInscripciones(); 
		}, 
		
		error: (err) => {
			console.error('Error al actualizar la nota:', err);
			alert('No se puedo actualizar la nota');
		}
	});
  }
  
  guardar(): void {
    if (this.inscripcionForm.invalid) {
      this.inscripcionForm.markAllAsTouched();
      return;
    }
	
	const materiaIdSeleccionada = Number(this.inscripcionForm.value.materiaId);

		  // Validaciones locales rápidas si es un usuario tipo GUEST/Estudiante
		  const yaEstaInscripto = this.inscripciones.some(
		    ins => ins.materiaId === materiaIdSeleccionada
		  );

		  if (yaEstaInscripto) {
		    alert('Ya te encuentras inscripto en esta materia.');
		    return;
		  }
	  
    this.inscripcionMateriaService.crear(this.inscripcionForm.value).subscribe({
      next: () => {
        alert('¡Inscripción a materia realizada con éxito!');
        this.inscripcionForm.patchValue({
          inscripcionCarreraId: '',
          materiaId: ''
        });
        this.materiasFiltradas = [];
        this.cargarInscripciones();
      },
	  error: (err) => {
	  	      console.error('Error al guardar inscripción:', err);
	  	      
	  	      // Capturamos el mensaje que envía el backend
	  	      const mensajeError = err?.error?.message || 'Ya te encuentras registrado en esta materia o ocurrió un error.';
	  	      alert(mensajeError);
	  	    }
    });
  }
}
