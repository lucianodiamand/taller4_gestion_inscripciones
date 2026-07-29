import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CarreraDto } from '../models/carrera-dto';

@Injectable({
  providedIn: 'root',
})
export class CarreraService {
  private apiUrl = 'http://localhost:8080/carreras';

  constructor(private http: HttpClient) {}

  obtenerTodas(): Observable<CarreraDto[]> {
    return this.http.get<CarreraDto[]>(this.apiUrl);
  }

  obtenerPorId(id: number): Observable<CarreraDto> {
    return this.http.get<CarreraDto>(`${this.apiUrl}/buscar/${id}`);
  }

  crear(carrera: CarreraDto): Observable<CarreraDto> {
    return this.http.post<CarreraDto>(`${this.apiUrl}/crear`, carrera);
  }

  actualizar(id: number, carrera: CarreraDto): Observable<CarreraDto> {
    return this.http.put<CarreraDto>(`${this.apiUrl}/editar/${id}`, carrera);
  }

  eliminar(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/eliminar/${id}`);
  }
}