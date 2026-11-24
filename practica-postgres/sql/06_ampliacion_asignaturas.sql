-- Propuesta de ampliación de Lab04a. Ejecutar después de la demo que se quiera ampliar.
-- Repetible: tras una nueva ingesta, volver a ejecutar para asociar las nuevas notas.
BEGIN;
DO $$ BEGIN
    IF current_database() <> 'prueba' THEN
        RAISE EXCEPTION 'Selecciona la base de datos prueba';
    END IF;
END $$;
CREATE TABLE IF NOT EXISTS public.asignaturas (
    id_asignatura INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre_asignatura VARCHAR(80) NOT NULL UNIQUE
);
INSERT INTO public.asignaturas (nombre_asignatura)
VALUES ('Big Data'), ('Python') ON CONFLICT (nombre_asignatura) DO NOTHING;
-- Lab04b usa además Bases de Datos: se conservan todas las materias existentes.
INSERT INTO public.asignaturas (nombre_asignatura)
SELECT DISTINCT asignatura FROM public.notas
ON CONFLICT (nombre_asignatura) DO NOTHING;
ALTER TABLE public.notas ADD COLUMN IF NOT EXISTS id_asignatura INTEGER
    REFERENCES public.asignaturas(id_asignatura);
UPDATE public.notas AS n SET id_asignatura = s.id_asignatura
FROM public.asignaturas AS s WHERE s.nombre_asignatura = n.asignatura;
COMMIT;

SELECT a.nombre, a.apellidos, s.nombre_asignatura, n.nota
FROM public.notas AS n
JOIN public.alumnos AS a ON a.id_alumno = n.id_alumno
JOIN public.asignaturas AS s ON s.id_asignatura = n.id_asignatura
ORDER BY a.id_alumno, s.nombre_asignatura;
SELECT COUNT(*) AS notas_sin_asignatura FROM public.notas WHERE id_asignatura IS NULL;
-- Se conserva temporalmente asignatura (texto) para mantener el COPY original.
-- En una normalización definitiva se elimina esa columna y se usa solo la FK;
-- eso exigiría adaptar también el formato y el proceso de ingesta de Lab04b.
