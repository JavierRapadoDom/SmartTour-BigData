-- Ejecutar cada SELECT por separado en Query Tool de prueba para ver su salida.
SELECT current_database(), current_user;
SELECT * FROM public.alumnos ORDER BY id_alumno;
SELECT * FROM public.notas ORDER BY id_nota;
SELECT nombre, apellidos FROM public.alumnos ORDER BY id_alumno;
SELECT * FROM public.notas ORDER BY nota DESC;
SELECT a.nombre, a.apellidos, n.asignatura, n.nota
FROM public.alumnos AS a
INNER JOIN public.notas AS n ON a.id_alumno = n.id_alumno
ORDER BY a.nombre, n.asignatura;

-- Pruebas negativas: seleccionar y ejecutar SOLO una sentencia cada vez.
-- Se dejan comentadas para no interrumpir las consultas anteriores.
-- Error esperado 23503: no existe el alumno 999.
-- INSERT INTO public.notas (id_alumno, asignatura, nota) VALUES (999, 'Big Data', 10.00);
-- Error esperado 23514: la nota no puede superar 10.
-- INSERT INTO public.notas (id_alumno, asignatura, nota) VALUES (1, 'Big Data', 12.00);
-- Si se usaba una transacción manual y queda abortada, ejecutar ROLLBACK.
