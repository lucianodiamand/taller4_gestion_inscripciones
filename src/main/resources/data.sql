

INSERT INTO public.ingresante (id, apellido, edad, email, nombre, numero_documento, tipo_documento) 
VALUES (1, 'Spizzirri', 22, 'franco123@gmail.com', 'Franco', '34231233', 'DNI') 
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.ingresante (id, apellido, edad, email, nombre, numero_documento, tipo_documento) 
VALUES (2, 'Gonzales', 44, 'pepito@gmail.com', 'Pepito', 'lws345678', 'Pasaporte') 
ON CONFLICT (id) DO NOTHING;

-- Sincroniza la secuencia del ID para que el próximo registro creado desde el sistema use el ID 3
SELECT pg_catalog.setval('public.ingresante_id_seq', 3, true);


INSERT INTO public.carrera (id, duracion, nombre) VALUES (1, 5, 'Ingenieria en Sistemas ') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (4, 5, 'Ingenieria Civil') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (5, 5, 'Ingenieria Industrial') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (6, 5, 'Contador Público') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (7, 5, 'Abogacía') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (8, 6, 'Arquitectura') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (9, 6, 'Medicina') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (10, 5, 'Psicología') ON CONFLICT (id) DO NOTHING;

SELECT pg_catalog.setval('public.carrera_id_seq', 11, true);