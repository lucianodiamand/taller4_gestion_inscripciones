import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { MateriasDto } from '../../models/materias-dto';


@Injectable({
  providedIn: 'root',
})
export class MateriaService {
  private apiUrl = 'http://localhost:8080/materias';

  constructor(private http: HttpClient) {}

  obtenerTodos(): Observable<MateriasDto[]> {
    return this.http.get<MateriasDto[]>(this.apiUrl);
  }

  obtenerPorId(id: number): Observable<MateriasDto> {
    return this.http.get<MateriasDto>(`${this.apiUrl}/buscar/${id}`);
  }

  crear(materia: MateriasDto): Observable<MateriasDto> {
    return this.http.post<MateriasDto>(`${this.apiUrl}/crear`, materia);
  }

  actualizar(id: number, materia: MateriasDto): Observable<MateriasDto> {
    return this.http.put<MateriasDto>(`${this.apiUrl}/editar/${id}`, materia);
  }

  eliminar(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/eliminar/${id}`);
  }
}
