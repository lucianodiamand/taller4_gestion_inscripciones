import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { InscripcionMateriaRequestDto, InscripcionMateriaResponseDto } from '../../models/inscripcion-materia-dto';

@Injectable({
  providedIn: 'root'
})
export class InscripcionMateriaService {

  private readonly url = 'http://localhost:8080/inscripcion/materia';


  constructor(private readonly http: HttpClient) {}

  obtenerTodas(): Observable<InscripcionMateriaResponseDto[]> {
    return this.http.get<InscripcionMateriaResponseDto[]>(this.url);
  }

  obtenerPorId(id: number): Observable<InscripcionMateriaResponseDto> {
    return this.http.get<InscripcionMateriaResponseDto>(`${this.url}/${id}`);
  }

    obtenerPorIngresante(ingresanteId: number): Observable<InscripcionMateriaResponseDto[]> {
      return this.http.get<InscripcionMateriaResponseDto[]>(`${this.url}/ingresante/${ingresanteId}`);
    }

  crear(dto: InscripcionMateriaRequestDto): Observable<void> {
    return this.http.post<void>(this.url, dto);
  }

  actualizar(id: number, dto: InscripcionMateriaRequestDto): Observable<void> {
    return this.http.put<void>(`${this.url}/${id}`, dto);
  }

  borrar(id: number): Observable<void> {
    return this.http.delete<void>(`${this.url}/${id}`);
  }
}