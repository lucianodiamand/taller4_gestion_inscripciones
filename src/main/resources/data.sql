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

-- de carrera id==1	(Completa)
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

	-- correlativas de 1-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (5, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (7, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (6, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (8, 3) ON CONFLICT DO NOTHING;	
 
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (10, 'Alg. y Est. de Datos 2', 2, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (11, 'Taller de Programación 3', 2, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (12, 'Análisis Matemático 3', 2, 1, 1) ON CONFLICT (id) DO NOTHING;
	
	-- correlativas de 2-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (10, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (11, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (12, 8) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (12, 6) ON CONFLICT DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (13, 'Teoría del Lenguaje', 2, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (14, 'Taller de Programación 4', 2, 2, 1) ON CONFLICT (id) DO NOTHING;	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (15, 'Sistemas Operativos', 2, 2, 1) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 2-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (13, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (14, 11) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (15, 11) ON CONFLICT DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (188, 'Arquitectura de la computadora', 3, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (189, 'Ingeniería de Software', 3, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (190, 'Bases de Datos', 3, 1, 1) ON CONFLICT (id) DO NOTHING;

	--correlativas de 3-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (188, 15) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (189, 14) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (190, 14) ON CONFLICT DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (191, 'Arquitectura de la computadora II', 3, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (192, 'Ingeniería de Software II', 3, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (193, 'Bases de Datos II', 3, 2, 1) ON CONFLICT (id) DO NOTHING;

	--correlativas de 3-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (191, 188) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (192, 189) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (193, 190) ON CONFLICT DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (194, 'Redes de Computadoras I', 4, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (195, 'Introducción a la IA', 4, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (196, 'Taller de Programación V', 4, 1, 1) ON CONFLICT (id) DO NOTHING;

	--correlativas de 4-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (194, 191) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (195, 192) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (196, 193) ON CONFLICT DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (197, 'Redes de Computadoras II', 4, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (198, 'Seguridad Informática', 4, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (199, 'Programación Profesional', 4, 2, 1) ON CONFLICT (id) DO NOTHING;

	--correlativas de 4-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (197, 194) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (198, 195) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (199, 196) ON CONFLICT DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (200, 'Gestión de la Organización', 5, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (201, 'Machine Learning', 5, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (202, 'Seminario I', 5, 1, 1) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 5-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (201, 195) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (202, 199) ON CONFLICT DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (203, 'Seminario II', 5, 2, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (204, 'Seminario III', 5, 1, 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (205, 'Proyecto Final', 5, 1, 1) ON CONFLICT (id) DO NOTHING;

	--correlativas de 5-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (203, 202) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (204, 202) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (205, 200) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (205, 201) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (205, 202) ON CONFLICT DO NOTHING;
	
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
	
	--correlaticas de 1-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (21, 18 ) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (22, 19) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (23, 17) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (24, 16) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (25, 17) ON CONFLICT DO NOTHING;
	
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

	--correlativas de 2-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (26, 21 ) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (27, 21) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (28, 22) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (29, 23) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (30, 24) ON CONFLICT DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (31, 'Métodos Númericos y Series', 2, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (32, 'Topología', 2, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (206, 'Diseño y Planeación 2', 2, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (33, 'Metales y Hormigon 1', 2, 2, 2) ON CONFLICT (id) DO NOTHING;

	--correlativas de 2-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (31, 27) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (32, 29) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (206, 29) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (33, 28) ON CONFLICT DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (207, 'Materiales', 3, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (208, 'Topología II', 3, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (209, 'Obras Maritimas', 3, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (210, 'Metales y Hormigon 2', 3, 1, 2) ON CONFLICT (id) DO NOTHING;	

	--correlativas de 3-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (207, 33) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (208, 32) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (209, 206) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (210, 33) ON CONFLICT DO NOTHING;	
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (211, 'Materiales II', 3, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (212, 'Obras Colgantes', 3, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (213, 'Estres en Infraestructura', 3, 2, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (214, 'Metales y Hormigon 3', 3, 2, 2) ON CONFLICT (id) DO NOTHING;
	
	--correlaticas de 3-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (211, 207) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (212, 209) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (213, 210) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (214, 210) ON CONFLICT DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (215, 'Materiales III', 4, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (216, 'Mega Obras', 4, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (217, 'Infraestructuras contra desastres naturales', 4, 1, 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (218, 'Leyes y Normativas de Obras', 4, 1, 2) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 4-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (215, 211) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (216, 212) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (217, 213) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (218, 214) ON CONFLICT DO NOTHING;
	
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
	
	--correlativas de 1-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (39, 34) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (40, 36) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (41, 36) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (42, 37) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (43, 34) ON CONFLICT DO NOTHING;
	
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
	
	--correlativas de 2-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (44, 39) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (45, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (46, 43) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (47, 39) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (48, 42) ON CONFLICT DO NOTHING;	
		
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

	--correlativas de 2-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (49, 44) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (50, 45) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (51, 46) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (52, 47) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (53, 48) ON CONFLICT DO NOTHING;	
	
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

	--correlativas de 1-2 
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (57, 54) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (58, 55) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (59, 56) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (60, 55) ON CONFLICT DO NOTHING;	

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (61, 'Macroeconomía 1', 2, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (62, 'Microeconomía 1', 2, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (63, 'Costos y Ganancias', 2, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (64, 'Sistema tributario Argentino', 2, 1, 4) ON CONFLICT (id) DO NOTHING;

	--correlativas de 2-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (61, 57) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (62, 58) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (63, 59) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (64, 56) ON CONFLICT DO NOTHING;	
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (65, 'Declaración y Liquidación de Impuestos', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (66, 'Microeconomía 2', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (67, 'Macroeconomía 2', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (68, 'Relación de independencia y dependencia', 2, 2, 4) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 2-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (65, 63) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (66, 62) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (67, 61) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (68, 64) ON CONFLICT DO NOTHING;
		
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (69, 'Modelos Economicos', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (70, 'Análisis de Ganancias y Costos', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (71, 'Mercado Internacional', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (72, 'Modelo Agrario y Ganadero Argentino', 3, 1, 4) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 3-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (69, 67) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (70, 65) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (71, 67) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (72, 65) ON CONFLICT DO NOTHING;	
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (73, 'Modelos Economicos 2', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (74, 'Sistema de Seguros', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (75, 'Mercado de Bolsa de Valores', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (76, 'Contabilidad', 3, 2, 4) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 3-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (73, 69) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (74, 70) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (75, 71) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (76, 70) ON CONFLICT DO NOTHING;	
	
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
	
	--correlativas de 1-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (81, 77) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (82, 78) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (83, 80) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (84, 79) ON CONFLICT DO NOTHING;		
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (85, 'Derecho Internacional', 2, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (86, 'Derechos Reales y Derecho de Familia y Sucesiones', 2, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (87, 'Derecho Administrativo y Finanzas Públicas', 2, 1, 5) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 2-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (85, 82) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (86, 84) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (87, 84) ON CONFLICT DO NOTHING;	
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (88, 'Derecho Laboral y de la Seguridad Social', 2, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (89, 'Sociedades Civiles y Comerciale', 2, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (90, 'Derecho Internacional Público y Privado', 2, 2, 5) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 2-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (88, 87) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (89, 87) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (90, 85) ON CONFLICT DO NOTHING;		
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (91, 'Derecho Ambiental y de los Recursos Naturales', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (92, 'Filosofía del Derecho y Ética Profesional', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (93, 'Práctica Profesional Supervisada', 3, 1, 5) ON CONFLICT (id) DO NOTHING;
	
	--correlativasde 3-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (91, 85) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (92, 89) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (93, 90) ON CONFLICT DO NOTHING;		
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (94, 'Patrocinio Jurídico', 3, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (95, 'Finanzas Públicas y Derecho Tributario', 3, 2, 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (96, 'CONTRATOS. PARTE ESPECIAL', 3, 2, 5) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 3-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (94, 92) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (95, 92) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (96, 93) ON CONFLICT DO NOTHING;		
	
--de carrera id == 6 'Arquitectura'	(completa)

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

	--correlativas de 1-2
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (103, 97) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (104, 98) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (105, 99) ON CONFLICT DO NOTHING;	
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (106, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (107, 101) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (108, 102) ON CONFLICT DO NOTHING;
			
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

	--correlativas de 2-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (109, 103) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (110, 104) ON CONFLICT DO NOTHING;	
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (111, 105) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (112, 106) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (113, 107) ON CONFLICT DO NOTHING;	
	
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

	--correlativas de 3-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (114, 109) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (115, 110) ON CONFLICT DO NOTHING;	
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (116, 111) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (117, 112) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (118, 113) ON CONFLICT DO NOTHING;	
	
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
	
	--correlativas de 4-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (119, 114) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (120, 115) ON CONFLICT DO NOTHING;	
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (121, 116) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (122, 117) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (123, 118) ON CONFLICT DO NOTHING;	
		
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (124, 'Proyecto Arquitéctonico II', 5, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (125, 'Intervención Urbanística', 5, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (126, 'Producción Edilicia II', 5, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (127, 'Epistemología III', 5, 1, 6) ON CONFLICT (id) DO NOTHING;

	--correlativas de 5-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (124, 119) ON CONFLICT DO NOTHING;	
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (125, 121) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (126, 122) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (127, 108) ON CONFLICT DO NOTHING;	
		
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (128, 'Proyecto Final', 6, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (129, 'Práctica Profesional Supervisada', 6, 1, 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (130, 'Idioma Moderno', 6, 1, 6) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 6-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (128, 124) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (129, 126) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (130, 127) ON CONFLICT DO NOTHING;
	
-- DE CARRERA ID==7 'MEDICINA' (Completa)

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

	--correlativas de 2-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (135, 131) ON CONFLICT DO NOTHING;	
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (136, 134) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (137, 133) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (138, 134) ON CONFLICT DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (139, 'Defensa', 3, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (140, 'Trabajo Comunitario', 3, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (141, 'Salud Pública', 3, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (142, 'Salud Socioambienta', 3, 1, 7) ON CONFLICT (id) DO NOTHING;

	--correlativas de 3-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (139, 136) ON CONFLICT DO NOTHING;	
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (140, 135) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (141, 133) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (142, 135) ON CONFLICT DO NOTHING;
	
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
	
	--correlativas de 4-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (143, 141) ON CONFLICT DO NOTHING;	
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (144, 139) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (145, 140) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (146, 142) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (147, 141) ON CONFLICT DO NOTHING;
	
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (148, 'Infectología', 5, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (149, 'Pediatría clínica y desarrollo infantil', 5, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (150, 'Salud de la mujer, tocoginecología y salud reproductiva', 5, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (151, 'Semiología', 5, 1, 7) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 5-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (148, 147) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (149, 143) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (150, 145) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (151, 146) ON CONFLICT DO NOTHING;

INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (152, 'Práctica intensiva supervisada', 6, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (153, 'Atención Primaria de la Salud', 6, 1, 7) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.materia (id, nombre, anio, cuatrimestre, carrera_id)
	VALUES (154, 'Cirugía General', 6, 1, 7) ON CONFLICT (id) DO NOTHING;
	
	--correlativas de 6-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (152, 148) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (153, 150) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (154, 148) ON CONFLICT DO NOTHING;
	
-- de carrera id==8 'Psicologia' (Completa)

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

	--correlativas de 2-1 
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (160, 157) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (161, 155) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (162, 157) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (163, 159) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (164, 156) ON CONFLICT DO NOTHING;

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

	--correlativas de 3-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (165, 160) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (166, 161) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (167, 162) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (168, 163) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (169, 164) ON CONFLICT DO NOTHING;
			
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
	
	--correlativas de 4-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (170, 165) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (171, 166) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (172, 167) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (173, 168) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (174, 169) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (175, 169) ON CONFLICT DO NOTHING;
	
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
	
	--correlativas de 5-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (176, 170) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (177, 171) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (178, 172) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (179, 173) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (180, 174) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (181, 175) ON CONFLICT DO NOTHING;
	
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
	
	--correlativas de 6-1
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (182, 176) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (183, 177) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (184, 178) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (185, 179) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (186, 180) ON CONFLICT DO NOTHING;
INSERT INTO public.materia_correlativa (materia_id, correlativa_id) 
	VALUES (187, 181) ON CONFLICT DO NOTHING;
