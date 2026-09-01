export interface InscripcionMateriaRequestDto {
  fechaInscripcion: string;
  inscripcionCarreraId: number;
  materiaId: number;
  nota: number | null;
}

export interface InscripcionMateriaResponseDto {
  id: number;
  fechaInscripcion: string;

  // Datos de la inscripción a carrera
  inscripcionCarreraId: number;

  // Datos de la materia
  materiaId: number;
  nombreMateria: string;
  nota: number | null;

  // Datos del inscripto
  numeroDocumento: string;
  nombreIngresante: string;
  apellidoIngresante: string;
}