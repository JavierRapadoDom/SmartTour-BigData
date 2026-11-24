-- Ejecutar cada consulta por separado en Query Tool de prueba.
SELECT COUNT(*) AS alumnos, MIN(id_alumno) AS primer_id, MAX(id_alumno) AS ultimo_id
FROM public.alumnos; -- 20, 1, 20
SELECT COUNT(*) AS notas, MIN(nota) AS min_nota, MAX(nota) AS max_nota
FROM public.notas; -- 40, 3.90, 9.60
SELECT * FROM public.alumnos ORDER BY id_alumno;
SELECT a.id_alumno, a.nombre, a.apellidos, n.asignatura, n.nota
FROM public.alumnos AS a
JOIN public.notas AS n ON n.id_alumno = a.id_alumno
ORDER BY a.id_alumno, n.asignatura; -- 40 filas; Lucía tiene 8.75 y 7.50
SELECT id_alumno, COUNT(*) AS numero_notas
FROM public.notas GROUP BY id_alumno ORDER BY id_alumno; -- 20 filas con 2 notas
SELECT COUNT(*) AS notas_sin_alumno
FROM public.notas AS n
LEFT JOIN public.alumnos AS a ON a.id_alumno = n.id_alumno
WHERE a.id_alumno IS NULL; -- 0
SELECT asignatura, ROUND(AVG(nota), 2) AS media
FROM public.notas GROUP BY asignatura ORDER BY asignatura;
