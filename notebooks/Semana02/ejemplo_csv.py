import csv

grupo1 = [
    ["Nombre"],
    ["Ana"],
    ["Ricardo"],
    ["Lucas"],
    ["Juan"],
    ["Pablo"]
]

grupo2 = [
    ["Nombre"],
    ["Marcos"],
    ["Ernesto"],
    ["Lolito"],
    ["Maria"],
    ["Pablo"]
]

with open("datos_grupo1.csv", "w", encoding="utf-8", newline="") as archivo:
    escritor = csv.writer(archivo)
    escritor.writerows(grupo1)
    

with open("datos_grupo2.csv", "w", encoding="utf-8", newline="") as archivo:
    escritor = csv.writer(archivo)
    escritor.writerows(grupo2)
    


