import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { Subscription } from 'rxjs';
import { MateriaService } from '../materia.service';
import { ActivatedRoute, Router } from '@angular/router';
import { MateriasDto } from '../../../models/materias-dto';

@Component({
  selector: 'app-materia-form-component',
  imports: [ReactiveFormsModule],
  templateUrl: './materia-form-component.html',
  styleUrl: './materia-form-component.css',
})
export class MateriaFormComponent implements OnInit, OnDestroy {

  materiaForm: FormGroup; // propiedad para contener el formulario

  id: string | null = null; // si es null, estoy creando. Si tiene valor, estoy editando

  subscription!: Subscription; // guarda la referencia a la subscripcion. Subscribe sirve para activar un Observable y empezar a recibir los datos o eventos que este emite a lo largo del tiempo 

  constructor(
    private readonly fb: FormBuilder, // inyecto un FormBuilder para un formulario
    private readonly servicio: MateriaService, //inyecto el service
    private readonly route: ActivatedRoute, // sirve para indicar la ruta en la que estoy parado y acceder a informacion de la url
    private readonly router: Router // sirve para cambiar de url sin que el usuario clickee un link, usando el metodo navigate
  ) {
    this.materiaForm = this.fb.group({
      nombre: [""],
      anio: [""],
      cuatrimestre: [""],
      carreraId: [""],
    });
  }

  ngOnInit() {
    this.id = this.route.snapshot.paramMap.get('id'); // se ejecuta al crear el componente. Se usa para hacer la primer carga de datos. El observable pide a la ruta el valor id de la url
    console.log('ID leído de la URL:', this.id);

  if (this.id) { // si el valor de id existe llamo a obtenrPorId para obtener la carrera
    this.subscription = this.servicio.obtenerPorId(+this.id).subscribe({
      next: (materia: MateriasDto) => {
        this.materiaForm.patchValue(materia);
      },
      error: (err) => {
        console.error('Error al buscar la materia:', err);
      }
    });
  }
}

guardar() {
  console.log(this.materiaForm.value);

  if (this.id) { // si recibo el id es porque se va actualizar una materia
    this.subscription = this.servicio.actualizar(+this.id, this.materiaForm.value).subscribe({ // subscribe es la accion que se ejecuta cuando se inicia una peticion HTTP al backend
      // this.materiaForm.value devuelve un objeto plano con los campos del formulario
            // this.subscription se usa para guardar la referencia de una suscripción a un Observable y poder cancelarla más tarde
      // next y error son las callbacks que se ejecutan cuando el navegador recibe la respuesta de la peticion HTTP al backend
      next: () => { // define que accion se debe ejecutar cada vez que el observable emite un nuevo valor exitoso
        this.router.navigate(['/materias']); // vuelvo a la url principal del navegador para materias
      },
      error: (err) => { // se ejecuta si algo sale mal
        console.error('Error al actualizar la carrera:', err);
      }
    });
  } else { // si no recibo un id es porque se quiere crear una materia
    this.subscription = this.servicio.crear(this.materiaForm.value).subscribe({ // this.materiaForm.value devuelve un objeto plano con los campos del formulario y crear el observable
      next: () => {
        this.router.navigate(['/materias']);
      },
      error: (err) => {
        console.error('Error al crear la materia:', err);
      }
    });
  }
}

ngOnDestroy(){ // para cancelar la suscripcion
    this.subscription.unsubscribe();
  }

}