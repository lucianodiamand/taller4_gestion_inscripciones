-- Datos iniciales para la tabla ingresante
INSERT INTO public.ingresante (id, apellido, edad, email, nombre, numero_documento, tipo_documento) 
VALUES (1, 'Spizzirri', 22, 'franco123@gmail.com', 'Franco', '34231233', 'DNI') 
ON CONFLICT DO NOTHING;

INSERT INTO public.ingresante (id, apellido, edad, email, nombre, numero_documento, tipo_documento) 
VALUES (2, 'Gonzales', 44, 'pepito@gmail.com', 'Pepito', 'lws345678', 'Pasaporte') 
ON CONFLICT DO NOTHING;

-- Sincroniza la secuencia del ID para que el próximo registro creado desde el sistema use el ID 3
SELECT pg_catalog.setval('public.ingresante_id_seq', 2, true);