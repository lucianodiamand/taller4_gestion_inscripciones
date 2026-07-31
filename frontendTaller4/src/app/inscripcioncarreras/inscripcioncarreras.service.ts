import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { InscripcionCarreraRequestDto, InscripcionCarreraResponseDto } from '../../models/inscripcion-carrera-dto';
@Injectable({
  providedIn: 'root'
})
export class InscripcionCarreraService {

  // Ajustamos la URL al endpoint del controller
  private apiUrl = 'http://localhost:8080/inscripcion/carrera'; 

  constructor(private http: HttpClient) { }

  obtenerTodas(): Observable<InscripcionCarreraResponseDto[]> {
    return this.http.get<InscripcionCarreraResponseDto[]>(this.apiUrl);
  }

  crear(inscripcion: InscripcionCarreraRequestDto): Observable<InscripcionCarreraResponseDto> {
    return this.http.post<InscripcionCarreraResponseDto>(this.apiUrl, inscripcion);
  }

  eliminar(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}