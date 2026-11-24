-- RECARGA DE LA DEMO: reemplaza SOLO alumnos y notas de prueba.
-- Ejecutar todo el archivo en Query Tool conectado a prueba.
-- La transacción evita dejar una carga parcial si falla uno de los CSV.
BEGIN;
DO $$ BEGIN
    IF current_database() <> 'prueba' THEN
        RAISE EXCEPTION 'Selecciona la base de datos prueba';
    END IF;
END $$;
-- Se nombran ambas tablas: no hace falta CASCADE ni vaciar otras tablas.
TRUNCATE TABLE public.notas, public.alumnos RESTART IDENTITY;
COPY public.alumnos (nombre, apellidos)
FROM '/datos/alumnos.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COPY public.notas (id_alumno, asignatura, nota)
FROM '/datos/notas.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
COMMIT;
-- Resultado: COPY 20, COPY 40. Ante un error, ejecutar ROLLBACK antes de reintentar.
