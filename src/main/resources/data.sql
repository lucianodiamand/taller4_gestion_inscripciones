--Carreras
INSERT INTO public.carrera (id, duracion, nombre) VALUES (1, 5, 'Ingenieria en Sistemas') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (2, 5, 'Ingenieria Civil') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (3, 5, 'Ingenieria Industrial') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (4, 5, 'Contador Público') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (5, 5, 'Abogacía') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (6, 6, 'Arquitectura') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (7, 6, 'Medicina') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (8, 5, 'Psicología') ON CONFLICT (id) DO NOTHING;

--Proxima id a usar es el 9
SELECT pg_catalog.setval('public.carrera_id_seq', 9, false);

--Materias

-- de carrera id==1

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera) 
	VALUES (1, 'Lógica Simbolica', 1, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (2, 'Taller de Programación 1', 1, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (3, 'Análisis Matemático 1', 1, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (4, 'Ingles 1', 1, 1, 1) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (5, 'Ingles 2', 1, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (6, 'Teoría de Grafos', 1, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (7, 'Taller de Programación 2', 1, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (8, 'Análisis Matemático 2', 1, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (9, 'Alg. y Est. de Datos 1', 1, 2, 1) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (10, 'Alg. y Est. de Datos 2', 2, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (11, 'Taller de Programación 3', 2, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (12, 'Análisis Matemático 3', 2, 1, 1) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (13, 'Teoría del Lenguaje', 2, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (14, 'Taller de Programación 4', 2, 2, 1) ON CONFLICT (id) DO NOTHING;	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (15, 'Sistemas Operativos', 2, 2, 1) ON CONFLICT (id) DO NOTHING;

-- de carrerra id==2 
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (16, 'Introducción a Obras Civiles', 1, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (17, 'Algebra Inicial', 1, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (18, 'Calculo 1', 1, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (19, 'Física 1', 1, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (20, 'Química 1', 1, 1, 2) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (21, 'Calculo 2', 1, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (22, 'Física 2', 1, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (23, 'Representación Gráfica', 1, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (24, 'Economía de Obra 1', 1, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (25, 'Algebra Lineal', 1, 2, 2) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (26, 'Estática Aplicada', 2, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (27, 'Calculo 3', 2, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (28, 'Resistencia de lo Materiales', 2, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (29, 'Diseño y Planeación 1', 2, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (30, 'Economía de Obra 2', 2, 1, 2) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (31, 'Métodos Númericos y Series', 2, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (32, 'Topología', 2, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (32, 'Diseño y Planeación 2', 2, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (33, 'Metales y Hormigon 1', 2, 2, 2) ON CONFLICT (id) DO NOTHING;

-- carrera id==3 
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (34, 'Introducción a la Industria', 1, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (35, 'Introducción a Grafos', 1, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (36, 'Calculo 1', 1, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (37, 'Física 1', 1, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (38, 'Química 1', 1, 1, 3) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (39, 'Flujos de Trabajos', 1, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (40, 'Introducción de Economía', 1, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (41, 'Calculo 2', 1, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (42, 'Física 2', 1, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (43, 'Revolución Industrial', 1, 2, 3) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (44, 'Optimización de Procesos', 2, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (45, 'Economía 2', 2, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (46, 'Historia Industría Argentina', 2, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (47, 'Transportes y Materiales', 2, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (48, 'Tratados de Residuos', 2, 1, 3) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (49, 'Automatización de la Industria', 2, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (50, 'Economía 3', 2, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (51, 'Globalización en la Industría', 2, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (52, 'Transportes y Materiales 2', 2, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (53, 'Tratados de Residuos 2', 2, 2, 3) ON CONFLICT (id) DO NOTHING;
	
--de carrera id==4 'Contador Público'

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (54, 'Calculo 1', 1, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (55, 'Intro. Economía', 1, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (56, 'Estado y Leyes', 1, 1, 4) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (57, 'Calculo 2', 1, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (58, 'Intro. Economía 2', 1, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (59, 'Organización de Empresas', 1, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (60, 'Intro. Costos y Ganancias', 1, 2, 4) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (61, 'Macroeconomía 1', 2, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (62, 'Microeconomía 1', 2, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (63, 'Costos y Ganancias', 2, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (64, 'Sistema tributario Argentino', 2, 1, 4) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (65, 'Declaración y Liquidación de Impuestos', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (66, 'Microeconomía 2', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (67, 'Macroeconomía 2', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (68, 'Relación de independencia y dependencia', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (69, 'Modelos Economicos', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (70, 'Análisis de Ganancias y Costos', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (71, 'Mercado Internacional', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (72, 'Modelo Agrario y Ganadero Argentino', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (73, 'Modelos Economicos 2', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (74, 'Sistema de Seguros', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (75, 'Mercado de Bolsa de Valores', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (76, 'Contabilidad', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
	
	
	
