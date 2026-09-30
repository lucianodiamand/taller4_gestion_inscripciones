import { Component, OnInit, ChangeDetectorRef} from '@angular/core';
import { InscripcionMateriaResponseDto} from '../../../models/inscripcion-materia-dto';
import { InscripcionMateriaService } from '../inscripcionmateria.service';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, FormsModule, Validators} from '@angular/forms';
import { InscripcionCarreraResponseDto } from '../../../models/inscripcion-carrera-dto';
import { MateriasDto } from '../../../models/materias-dto';
import { InscripcionCarreraService } from '../../inscripcioncarreras/inscripcioncarreras.service';
import { MateriaService } from '../../materia/materia.service';
import { RouterLink } from '@angular/router';
import { AuthService } from '../../auth/auth.service';
import { MateriasAprobadasService } from '../../materiasAprobadas/materias-aprobadas.service'; 

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

  inscripcionForm: FormGroup; // para formulario
  inscripciones: InscripcionMateriaResponseDto[] = []; // para inscripciones a materias existentes
  inscripcionesCarreras: InscripcionCarreraResponseDto[] = [];
  materias: MateriasDto[] = []; // todas las materias
  materiasFiltradas: MateriasDto[] = []; // las materias que el usuario puede seleccionar
  inscripcionesCarrerasFiltradas: InscripcionCarreraResponseDto[] = [];
  rol: string | null = null;
  materiasAprobadasIds: number[] = []; // guardo id de las materias aprobadas

  constructor( // inyeccion de dependencia mediante constructor
    private fb: FormBuilder,
    private inscripcionMateriaService: InscripcionMateriaService,
    private inscripcionCarreraService: InscripcionCarreraService,
    private materiaService: MateriaService,
    private authService: AuthService,
    private cdr: ChangeDetectorRef,
	private materiasAprobadasService: MateriasAprobadasService
  ) {
    const hoy = new Date().toISOString().split('T')[0]; // fecha actual

    this.inscripcionForm = this.fb.group({ // creamos formulario
      inscripcionCarreraId: ['', Validators.required],
      materiaId: ['', Validators.required],
      fechaInscripcion: [hoy, Validators.required]
    });
  }

  ngOnInit(): void {

    this.rol = this.authService.getRol();

    this.cargarListas();
    this.cargarInscripciones();

    this.inscripcionForm.get('inscripcionCarreraId')!.valueChanges.subscribe((valor: string) => { // obtenemos el id de la inscripcion a carrera seleccionada, el cual puede cambiar
      const inscripcionCarreraId = +valor;                         // recibe cada nuevo valor
      this.filtrarMaterias(inscripcionCarreraId);
    });
    // valueChanges emite un nuevo valor cada vez que el campo cambia (por medio del selector)
    // por medio del suscribe, cada vez que se emite un nuevo valor lo castea a number y lo pasa como parametro a la funcion
  }

  cargarListas(): void {
    // Cargar inscripciones a carrera

    if(this.rol === 'ADMIN'){
      this.inscripcionCarreraService.obtenerTodas().subscribe({
      next: (data: InscripcionCarreraResponseDto[]) => {
        this.cdr.detectChanges();	//por si llego info y no se percato, fuerza la actualizacion del DOM
      },
      error: (err: any) => console.error('Error al obtener inscripciones a carrera:', err)
    });
    } else {
      const ingresanteId = this.authService.getIngresanteId(); // obtenemos el ingresanteId
      if(ingresanteId){
        this.inscripcionCarreraService.obtenerPorIngresante(ingresanteId).subscribe({ // obtenemos solo sus insrcipciones
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

  cargarInscripciones(): void { // obtiene inscripciones a materias

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
		  //Cargamos las inscripciones actuales
          this.inscripcionMateriaService.obtenerPorIngresante(ingresanteId).subscribe({
            next: (data: InscripcionMateriaResponseDto[]) => {
              this.inscripciones = data; //cargamos las inscripciones.
			  //Cargamos las materias aprobadas para validar correlativas
			  this.cargarMateriasAprobadas(ingresanteId);
            },
            error: (err: any) => console.error('Error al cargar mis inscripciones:', err)
          });
      }
    }
  }

filtrarMaterias(inscripcionCarreraId: number): void {
  const inscripcionElegida = this.inscripcionesCarreras.find(i => i.id === inscripcionCarreraId); // busca elemento dentro del arreglo

  if (!inscripcionElegida) {
    this.materiasFiltradas = [];
    return;
  }

  // Si es ESTUDIANTE / GUEST:
  const idsMateriasInscriptas = this.inscripciones.map(ins => ins.materiaId); // map obtiene solo los id de las materias

  this.materiasFiltradas = this.materias.filter(materia => { // filter crea un nuevo arreglo solo con los que cumplen la condicion
    
    if (materia.carreraId !== inscripcionElegida.carreraId) { // la materia debe pertenecer a la carrera seleccionada
      return false;
    }

    if (idsMateriasInscriptas.includes(materia.id)) { // includes pregunta si el id esta dentro del arreglo. No debe estar ya inscripto
      return false;
    }

    // Reglas sobre cuatrimestres y correlativas
    const esPrimerCuatrimestre = materia.anio === 1 && materia.cuatrimestre === 1; // Si es del 1º Año y 1º Cuatrimestre, se habilita directamente

    if (esPrimerCuatrimestre) {
      return true;
    }

    return this.puedeCursarMateria(materia); // Para cualquier otro cuatrimestre posterior, debe cumplir las correlativas
  });

  // Limpia la seleccion previa del formulario si la materia elegida ya no forma parte de la lista filtrada
  const materiaActual = Number(this.inscripcionForm.value.materiaId);
  if (materiaActual && !this.materiasFiltradas.some(m => m.id === materiaActual)) {
    this.inscripcionForm.patchValue({ materiaId: '' });
  }
}


// Método auxiliar para obtener las aprobadas
cargarMateriasAprobadas(ingresanteId: number): void {
  this.materiasAprobadasService.obtenerPorIngresante(ingresanteId).subscribe({ // pide al back las materias aprobadas de un ingresante
    next: (aprobadas) => {
      // Mapeamos a un arreglo que contenga solo los IDs de las materias aprobadas
      this.materiasAprobadasIds = aprobadas.map(a => a.idMateria);

      // Si hay una carrera seleccionada en el formulario, re-calculamos el filtro de materias
      const inscripcionCarreraId = Number(this.inscripcionForm.value.inscripcionCarreraId); // obtenemos inscripcion a carrera actual
      if (inscripcionCarreraId) {
        this.filtrarMaterias(inscripcionCarreraId); // vuelve a filtrar que materias puede cursar
      }
      this.cdr.detectChanges();
    },
    error: (err) => console.error('Error al obtener materias aprobadas:', err)
  });
}

materiaEstaAprobada(materiaId: number): boolean {
  return this.materiasAprobadasIds.includes(materiaId); // para ver si el id de una materia esta dentro de las materias aprobadas
}
  
  puedeCursarMateria(materia: MateriasDto):boolean{ // recibe una materia
	//Si no tiene correlativas la materia, puede cursarla: 
	if(!materia.correlativasIds || materia.correlativasIds.length === 0){
		return true;
	}
	//aca todas las correlativas deben estar aprobadas: 
	return materia.correlativasIds.every(correlativaId => this.materiaEstaAprobada(correlativaId)); // every se fija si todos los elementos cumplen con la condicion
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
