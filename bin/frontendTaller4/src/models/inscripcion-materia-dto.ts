export interface InscripcionMateriaRequestDto {
  fechaInscripcion: string;
  inscripcionCarreraId: number;
  materiaId: number;
}

export interface InscripcionMateriaResponseDto {
  id: number;
  fechaInscripcion: string;

  // Datos de la inscripción a carrera
  inscripcionCarreraId: number;

  // Datos de la materia
  materiaId: number;
  nombreMateria: string;
}