export interface AsignarNotaDTO {
  idInscripcion: number;
  nota: number;
}

export interface MateriasAprobadasDTO {
  id: number;
  nota: number;
  idIngresante: number;
  nombreIngresante: string;
  idMateria: number;
  nombreMateria: string;
}
