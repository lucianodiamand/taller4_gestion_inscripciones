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

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id) 
	VALUES (1, 'Lógica Simbolica', 1, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (2, 'Taller de Programación 1', 1, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (3, 'Análisis Matemático 1', 1, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (4, 'Ingles 1', 1, 1, 1) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (5, 'Ingles 2', 1, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (6, 'Teoría de Grafos', 1, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (7, 'Taller de Programación 2', 1, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (8, 'Análisis Matemático 2', 1, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (9, 'Alg. y Est. de Datos 1', 1, 2, 1) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (10, 'Alg. y Est. de Datos 2', 2, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (11, 'Taller de Programación 3', 2, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (12, 'Análisis Matemático 3', 2, 1, 1) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (13, 'Teoría del Lenguaje', 2, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (14, 'Taller de Programación 4', 2, 2, 1) ON CONFLICT (id) DO NOTHING;	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (15, 'Sistemas Operativos', 2, 2, 1) ON CONFLICT (id) DO NOTHING;

-- de carrerra id==2 
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (16, 'Introducción a Obras Civiles', 1, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (17, 'Algebra Inicial', 1, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (18, 'Calculo 1', 1, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (19, 'Física 1', 1, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (20, 'Química 1', 1, 1, 2) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (21, 'Calculo 2', 1, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (22, 'Física 2', 1, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (23, 'Representación Gráfica', 1, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (24, 'Economía de Obra 1', 1, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (25, 'Algebra Lineal', 1, 2, 2) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (26, 'Estática Aplicada', 2, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (27, 'Calculo 3', 2, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (28, 'Resistencia de lo Materiales', 2, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (29, 'Diseño y Planeación 1', 2, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (30, 'Economía de Obra 2', 2, 1, 2) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (31, 'Métodos Númericos y Series', 2, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (32, 'Topología', 2, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (32, 'Diseño y Planeación 2', 2, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (33, 'Metales y Hormigon 1', 2, 2, 2) ON CONFLICT (id) DO NOTHING;

-- carrera id==3 
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (34, 'Introducción a la Industria', 1, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (35, 'Introducción a Grafos', 1, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (36, 'Calculo 1', 1, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (37, 'Física 1', 1, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (38, 'Química 1', 1, 1, 3) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (39, 'Flujos de Trabajos', 1, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (40, 'Introducción de Economía', 1, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (41, 'Calculo 2', 1, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (42, 'Física 2', 1, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (43, 'Revolución Industrial', 1, 2, 3) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (44, 'Optimización de Procesos', 2, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (45, 'Economía 2', 2, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (46, 'Historia Industría Argentina', 2, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (47, 'Transportes y Materiales', 2, 1, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (48, 'Tratados de Residuos', 2, 1, 3) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (49, 'Automatización de la Industria', 2, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (50, 'Economía 3', 2, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (51, 'Globalización en la Industría', 2, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (52, 'Transportes y Materiales 2', 2, 2, 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (53, 'Tratados de Residuos 2', 2, 2, 3) ON CONFLICT (id) DO NOTHING;
	
--de carrera id==4 'Contador Público'

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (54, 'Calculo 1', 1, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (55, 'Intro. Economía', 1, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (56, 'Estado y Leyes', 1, 1, 4) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (57, 'Calculo 2', 1, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (58, 'Intro. Economía 2', 1, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (59, 'Organización de Empresas', 1, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (60, 'Intro. Costos y Ganancias', 1, 2, 4) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (61, 'Macroeconomía 1', 2, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (62, 'Microeconomía 1', 2, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (63, 'Costos y Ganancias', 2, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (64, 'Sistema tributario Argentino', 2, 1, 4) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (65, 'Declaración y Liquidación de Impuestos', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (66, 'Microeconomía 2', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (67, 'Macroeconomía 2', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (68, 'Relación de independencia y dependencia', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (69, 'Modelos Economicos', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (70, 'Análisis de Ganancias y Costos', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (71, 'Mercado Internacional', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (72, 'Modelo Agrario y Ganadero Argentino', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (73, 'Modelos Economicos 2', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (74, 'Sistema de Seguros', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (75, 'Mercado de Bolsa de Valores', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (76, 'Contabilidad', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
	
--de carrera id==5 'Abogacía'

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (77, 'Historia del derecho', 1, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (78, 'Etica y ciudadania', 1, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (79, 'Constitución Nacional', 1, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (80, 'Código Penal Argentino', 1, 1, 5) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (81, 'Sistema Juridico Argentino', 1, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (82, 'Derecho a la defensa y representación', 1, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (83, 'Procesamiento y Protocolo Juridico', 1, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (84, 'Constitución Nacional 2', 1, 2, 5) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (85, 'Derecho Internacional', 2, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (86, 'Derechos Reales y Derecho de Familia y Sucesiones', 2, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (87, 'Derecho Administrativo y Finanzas Públicas', 2, 1, 5) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (88, 'Derecho Laboral y de la Seguridad Social', 2, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (89, 'Sociedades Civiles y Comerciale', 2, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (90, 'Derecho Internacional Público y Privado', 2, 2, 5) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (91, 'Derecho Ambiental y de los Recursos Naturales', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (92, 'Filosofía del Derecho y Ética Profesional', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (93, 'Práctica Profesional Supervisada', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (94, 'Patrocinio Jurídico', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (95, 'Finanzas Públicas y Derecho Tributario', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (96, 'CONTRATOS. PARTE ESPECIAL', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
	
--de carrera id == 6 'Arquitectura'

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (97, 'Introducción a la Arquitectura', 1, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (98, 'Expresión Gráfica I', 1, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (99, 'Materialidad I', 1, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (100, 'Física', 1, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (101, 'Matemáticas I', 1, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (102, 'Epistemología I', 1, 1, 6) ON CONFLICT (id) DO NOTHING;	
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (103, 'Introducción a la Arquitectura II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (104, 'Expresión Gráfica II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (105, 'Materialidad II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (106, 'Física II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (107, 'Matemáticas II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (108, 'Epistemología II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (109, 'Análisis Proyectual I', 2, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (110, 'Materialidad III', 2, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (111, 'Estática y Resistencia de los materiales', 2, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (112, 'Historia de la Arquitectura I', 2, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (113, 'Geometría Descriptiva', 2, 1, 6) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (114, 'Análisis Proyectual II', 3, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (115, 'Diseño de Estructuras I', 3, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (116, 'Introducción al Urbanismo', 3, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (117, 'Historia de la Arquitectura II', 3, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (118, 'Matemáticas III', 3, 1, 6) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (119, 'Proyecto Arquitéctonico I', 4, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (120, 'Diseño de Estructuras II', 4, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (121, 'Análisis Urbanístico', 4, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (122, 'Producción Edilicia I', 4, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (123, 'Historia de la Arquitectura III', 4, 1, 6) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (124, 'Proyecto Arquitéctonico II', 5, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (125, 'Intervención Urbanística', 5, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (126, 'Producción Edilicia II', 5, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (127, 'Epistemología III', 5, 1, 6) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (128, 'Proyecto Final', 6, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (129, 'Práctica Profesional Supervisada', 6, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (130, 'Idioma Moderno', 6, 1, 6) ON CONFLICT (id) DO NOTHING;
	
-- DE CARRERA ID==7 'MEDICINA'

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (131, 'Crecimiento y Desarrollo', 1, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (132, 'Nutrición', 1, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (133, 'Medicina Social', 1, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (134, 'Introducción a la Salud Pública', 1, 1, 7) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (135, 'El Hombre y su Medio', 2, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (136, 'Injuria', 2, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (137, 'Metodología de la Investigación', 2, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (138, 'Ingles', 2, 1, 7) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (139, 'Defensa', 3, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (140, 'Trabajo Comunitario', 3, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (141, 'Salud Pública', 3, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (142, 'Salud Socioambienta', 3, 1, 7) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (143, 'Historia de la Medicina', 4, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (144, 'Bioética', 4, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (145, 'Medicina Interna', 4, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (146, 'Neurología', 4, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (147, 'Técnica Quirúrgica', 4, 1, 7) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (148, 'Infectología', 5, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (149, 'Pediatría clínica y desarrollo infantil', 5, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (150, 'Salud de la mujer, tocoginecología y salud reproductiva', 5, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (151, 'Semiología', 5, 1, 7) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (152, 'Práctica intensiva supervisada', 6, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (153, 'Atención Primaria de la Salud', 6, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (154, 'Cirugía General', 6, 1, 7) ON CONFLICT (id) DO NOTHING;

-- de carrera id==8 'Psicologia'

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (155, 'Desarrollos Psicológicos Contemporáneos', 1, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (156, 'Problemas Epistemológicos de la Psicología', 1, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (157, 'Psicología', 1, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (158, 'Problemática Filosófica', 1, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (159, 'Lingüística y Discursividad Social', 1, 1, 8) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (160, 'Historia de la Psicología', 2, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (161, 'Metodologías y Gestión de la Investigación en Psicología', 2, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (162, 'Psicoanálisis I', 2, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (163, 'Teoría Social', 2, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (164, 'Biología Humana', 2, 1, 8) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (165, 'Epistemología de la Psicología y el Psicoanális', 3, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (166, 'Perspectivas en Educación', 3, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (167, 'Psicoanálisis II', 3, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (168, 'Psicología Social y Comunitaria', 3, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (169, 'Neuropsicología y Psicología del Desarrollo', 3, 1, 8) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (170, 'Historia y Epistemología de la Psicología', 4, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (171, 'Evaluación y Psicodiagnóstico', 4, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (172, 'Psicoanálisis y Psicopatología', 4, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (173, 'Organizaciones e Instituciones', 4, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (174, 'Psicología del Lenguaje y del Desarrollo', 4, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (175, 'Psicopatología y Neurofarmacología', 4, 1, 8) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (176, 'Salud Pública y Salud Mental', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (177, 'Psicología en el Ámbito Jurídico Forense', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (178, 'Psicología en Educació', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (179, 'Psicoterapias', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (180, 'Clínica I', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (181, 'Psicología en el Trabajo', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (182, 'Intervenciones en Niñez y Adolescencia', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (183, 'Metodologías de la Investigación en Psicología', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (184, 'Clínica II', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (185, 'Práctica Profesional Supervisada', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (186, 'Trabajo Integrador Final', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (187, 'Seminarios y Prácticas de Investigación', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
