import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { MateriasAprobadasDTO, AsignarNotaDTO } from '../../models/materia-aprobada-dto';
import { InscripcionMateriaResponseDto } from '../../models/inscripcion-materia-dto';

@Injectable({
  providedIn: 'root'
})

export class MateriasAprobadasService {

  private readonly API_URL = 'http://localhost:8080/materias_aprobadas';

  constructor(private http: HttpClient) { }

  registrarAprobacion(dto: AsignarNotaDTO): Observable<MateriasAprobadasDTO> {
    return this.http.post<MateriasAprobadasDTO>(this.API_URL, dto);
  }

  obtenerPorIngresante(idIngresante: number): Observable<MateriasAprobadasDTO[]> {
    return this.http.get<MateriasAprobadasDTO[]>(`${this.API_URL}/ingresante/${idIngresante}`);
  }


  obtenerInscripcionPorId(idInscripcion: number): Observable<InscripcionMateriaResponseDto> {
    return this.http.get<InscripcionMateriaResponseDto>(`${this.API_URL}/inscripcion/${idInscripcion}`);
  }

}