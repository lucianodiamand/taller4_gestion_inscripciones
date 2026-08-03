export interface InscripcionCarreraRequestDto {
  fechaInscripcion: string; // Formato YYYY-MM-DD
  ingresanteId: number;
  carreraId: number;
}

export interface InscripcionCarreraResponseDto {
  id: number;
  fechaInscripcion: string;
  ingresanteId: number;
  nombreIngresante: string;
  apellidoIngresante: string;
  carreraId: number;
  nombreCarrera: string;
}