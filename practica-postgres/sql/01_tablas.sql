-- Ejecutar UNA VEZ en prueba. Si las tablas existen, inspeccionarlas antes.
BEGIN;
DO $$ BEGIN
    IF current_database() <> 'prueba' THEN
        RAISE EXCEPTION 'Selecciona la base de datos prueba';
    END IF;
END $$;

CREATE TABLE public.alumnos (
    id_alumno INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL
);

CREATE TABLE public.notas (
    id_nota INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_alumno INTEGER NOT NULL,
    asignatura VARCHAR(80) NOT NULL,
    nota NUMERIC(4,2) NOT NULL CHECK (nota BETWEEN 0 AND 10),
    CONSTRAINT fk_notas_alumnos FOREIGN KEY (id_alumno)
        REFERENCES public.alumnos(id_alumno)
);
COMMIT;
