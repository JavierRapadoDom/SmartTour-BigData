import csv

grupo1 = set()
grupo2 = set()

with open("notebooks/Semana02/datos_grupo1.csv", "r") as archivo:
    lector = csv.reader(archivo)
    next(lector)
    for fila in lector:
        grupo1.add(fila[0])
    

with open("notebooks/Semana02/datos_grupo2.csv", "r") as archivo:
    lector = csv.reader(archivo)

    for fila in lector:
        grupo2.add(fila[0])
    

print(grupo1)
print(grupo2)