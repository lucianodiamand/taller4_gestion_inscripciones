import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IngresanteDto } from '../../models/ingresante-dto';

@Injectable({
  providedIn: 'root',
})
export class IngresanteService {
  private apiUrl = 'http://localhost:8080/ingreso';

  constructor(private http: HttpClient) {}

  obtenerTodos(): Observable<IngresanteDto[]> {
    return this.http.get<IngresanteDto[]>(this.apiUrl);
  }

  obtenerPorId(id: number): Observable<IngresanteDto> {
    return this.http.get<IngresanteDto>(`${this.apiUrl}/buscar/${id}`);
  }

  crear(ingresante: IngresanteDto): Observable<IngresanteDto> {
    return this.http.post<IngresanteDto>(`${this.apiUrl}/crear`, ingresante);
  }

  actualizar(id: number, ingresante: IngresanteDto): Observable<IngresanteDto> {
    return this.http.put<IngresanteDto>(`${this.apiUrl}/editar/${id}`, ingresante);
  }

  eliminar(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/eliminar/${id}`);
  }
}