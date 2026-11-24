-- DEMO: sustituye SOLO los alumnos y notas de prueba por 3 alumnos y 5 notas.
-- No ejecutar sobre datos que se quieran conservar.
BEGIN;
DO $$ BEGIN
    IF current_database() <> 'prueba' THEN
        RAISE EXCEPTION 'Selecciona la base de datos prueba';
    END IF;
END $$;
TRUNCATE TABLE public.notas, public.alumnos RESTART IDENTITY;
INSERT INTO public.alumnos (nombre, apellidos) VALUES
    ('Ana', 'García López'), ('Luis', 'Martín Pérez'), ('Marta', 'Sánchez Ruiz');
INSERT INTO public.notas (id_alumno, asignatura, nota) VALUES
    (1, 'Big Data', 8.50), (1, 'Python', 9.00), (2, 'Big Data', 6.50),
    (3, 'Python', 7.50), (3, 'Big Data', 8.00);
COMMIT;
