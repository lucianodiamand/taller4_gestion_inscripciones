INSERT INTO public.carrera (id, duracion, nombre) VALUES (1, 5, 'Ingenieria en Sistemas ') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (2, 5, 'Ingenieria Civil') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (3, 5, 'Ingenieria Industrial') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (4, 5, 'Contador Público') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (5, 5, 'Abogacía') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (6, 6, 'Arquitectura') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (7, 6, 'Medicina') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.carrera (id, duracion, nombre) VALUES (8, 5, 'Psicología') ON CONFLICT (id) DO NOTHING;

SELECT pg_catalog.setval('public.carrera_id_seq', 9, true);