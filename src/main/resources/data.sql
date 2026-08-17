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
	
--de carrera id==5 'Abogacía'

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (77, 'Historia del derecho', 1, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (78, 'Etica y ciudadania', 1, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (79, 'Constitución Nacional', 1, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (80, 'Código Penal Argentino', 1, 1, 5) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (81, 'Sistema Juridico Argentino', 1, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (82, 'Derecho a la defensa y representación', 1, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (83, 'Procesamiento y Protocolo Juridico', 1, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (84, 'Constitución Nacional 2', 1, 2, 5) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (85, 'Derecho Internacional', 2, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (86, 'Derechos Reales y Derecho de Familia y Sucesiones', 2, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (87, 'Derecho Administrativo y Finanzas Públicas', 2, 1, 5) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (88, 'Derecho Laboral y de la Seguridad Social', 2, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (89, 'Sociedades Civiles y Comerciale', 2, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (90, 'Derecho Internacional Público y Privado', 2, 2, 5) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (91, 'Derecho Ambiental y de los Recursos Naturales', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (92, 'Filosofía del Derecho y Ética Profesional', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (93, 'Práctica Profesional Supervisada', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (94, 'Patrocinio Jurídico', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (95, 'Finanzas Públicas y Derecho Tributario', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (96, 'CONTRATOS. PARTE ESPECIAL', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
	
--de carrera id == 6 'Arquitectura'

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (97, 'Introducción a la Arquitectura', 1, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (98, 'Expresión Gráfica I', 1, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (99, 'Materialidad I', 1, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (100, 'Física', 1, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (101, 'Matemáticas I', 1, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (102, 'Epistemología I', 1, 1, 6) ON CONFLICT (id) DO NOTHING;	
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (103, 'Introducción a la Arquitectura II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (104, 'Expresión Gráfica II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (105, 'Materialidad II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (106, 'Física II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (107, 'Matemáticas II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (108, 'Epistemología II', 1, 2, 6) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (109, 'Análisis Proyectual I', 2, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (110, 'Materialidad III', 2, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (111, 'Estática y Resistencia de los materiales', 2, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (112, 'Historia de la Arquitectura I', 2, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (113, 'Geometría Descriptiva', 2, 1, 6) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (114, 'Análisis Proyectual II', 3, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (115, 'Diseño de Estructuras I', 3, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (116, 'Introducción al Urbanismo', 3, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (117, 'Historia de la Arquitectura II', 3, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (118, 'Matemáticas III', 3, 1, 6) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (119, 'Proyecto Arquitéctonico I', 4, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (120, 'Diseño de Estructuras II', 4, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (121, 'Análisis Urbanístico', 4, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (122, 'Producción Edilicia I', 4, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (123, 'Historia de la Arquitectura III', 4, 1, 6) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (124, 'Proyecto Arquitéctonico II', 5, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (125, 'Intervención Urbanística', 5, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (126, 'Producción Edilicia II', 5, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (127, 'Epistemología III', 5, 1, 6) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (128, 'Proyecto Final', 6, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (129, 'Práctica Profesional Supervisada', 6, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (130, 'Idioma Moderno', 6, 1, 6) ON CONFLICT (id) DO NOTHING;
	
-- DE CARRERA ID==7 'MEDICINA'

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (131, 'Crecimiento y Desarrollo', 1, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (132, 'Nutrición', 1, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (133, 'Medicina Social', 1, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (134, 'Introducción a la Salud Pública', 1, 1, 7) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (135, 'El Hombre y su Medio', 2, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (136, 'Injuria', 2, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (137, 'Metodología de la Investigación', 2, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (138, 'Ingles', 2, 1, 7) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (139, 'Defensa', 3, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (140, 'Trabajo Comunitario', 3, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (141, 'Salud Pública', 3, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (142, 'Salud Socioambienta', 3, 1, 7) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (143, 'Historia de la Medicina', 4, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (144, 'Bioética', 4, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (145, 'Medicina Interna', 4, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (146, 'Neurología', 4, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (147, 'Técnica Quirúrgica', 4, 1, 7) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (148, 'Infectología', 5, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (149, 'Pediatría clínica y desarrollo infantil', 5, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (150, 'Salud de la mujer, tocoginecología y salud reproductiva', 5, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (151, 'Semiología', 5, 1, 7) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (152, 'Práctica intensiva supervisada', 6, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (153, 'Atención Primaria de la Salud', 6, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (154, 'Cirugía General', 6, 1, 7) ON CONFLICT (id) DO NOTHING;

-- de carrera id==8 'Psicologia'

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (155, 'Desarrollos Psicológicos Contemporáneos', 1, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (156, 'Problemas Epistemológicos de la Psicología', 1, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (157, 'Psicología', 1, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (158, 'Problemática Filosófica', 1, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (159, 'Lingüística y Discursividad Social', 1, 1, 8) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (160, 'Historia de la Psicología', 2, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (161, 'Metodologías y Gestión de la Investigación en Psicología', 2, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (162, 'Psicoanálisis I', 2, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (163, 'Teoría Social', 2, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (164, 'Biología Humana', 2, 1, 8) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (165, 'Epistemología de la Psicología y el Psicoanális', 3, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (166, 'Perspectivas en Educación', 3, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (167, 'Psicoanálisis II', 3, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (168, 'Psicología Social y Comunitaria', 3, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (169, 'Neuropsicología y Psicología del Desarrollo', 3, 1, 8) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (170, 'Historia y Epistemología de la Psicología', 4, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (171, 'Evaluación y Psicodiagnóstico', 4, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (172, 'Psicoanálisis y Psicopatología', 4, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (173, 'Organizaciones e Instituciones', 4, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (174, 'Psicología del Lenguaje y del Desarrollo', 4, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (175, 'Psicopatología y Neurofarmacología', 4, 1, 8) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (176, 'Salud Pública y Salud Mental', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (177, 'Psicología en el Ámbito Jurídico Forense', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (178, 'Psicología en Educació', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (179, 'Psicoterapias', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (180, 'Clínica I', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (181, 'Psicología en el Trabajo', 5, 1, 8) ON CONFLICT (id) DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (182, 'Intervenciones en Niñez y Adolescencia', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (183, 'Metodologías de la Investigación en Psicología', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (184, 'Clínica II', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (185, 'Práctica Profesional Supervisada', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (186, 'Trabajo Integrador Final', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera)
	VALUES (187, 'Seminarios y Prácticas de Investigación', 6, 1, 8) ON CONFLICT (id) DO NOTHING;
