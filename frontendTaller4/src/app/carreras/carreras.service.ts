import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { CarrerasDto } from '../../models/carreras-dto';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class CarrerasService {
  private apiUrl = 'http://localhost:8080/carreras';

  constructor(private http: HttpClient) {}

  obtenerTodos(): Observable<CarrerasDto[]> {
    return this.http.get<CarrerasDto[]>(this.apiUrl);
  }

  obtenerPorId(id: number): Observable<CarrerasDto> {
    return this.http.get<CarrerasDto>(`${this.apiUrl}/buscar/${id}`);
  }

  crear(carreras: CarrerasDto): Observable<CarrerasDto> {
    return this.http.post<CarrerasDto>(`${this.apiUrl}/crear`, carreras);
  }

  actualizar(id: number, carreras: CarrerasDto): Observable<CarrerasDto> {
    return this.http.put<CarrerasDto>(`${this.apiUrl}/editar/${id}`, carreras);
  }

  eliminar(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/eliminar/${id}`);
  }
}
