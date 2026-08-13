import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# --- DATOS ---

datos = {
    "ID_Venta": list(range(1, 91)),

    "Fecha": [
        "2026-01-03","2026-01-03","2026-01-04","2026-01-05","2026-01-06",
        "2026-01-07","2026-01-08","2026-01-09","2026-01-10","2026-01-11",
        "2026-01-12","2026-01-13","2026-01-14","2026-01-15","2026-01-16",
        "2026-01-17","2026-01-18","2026-01-19","2026-01-20","2026-01-21",
        "2026-01-22","2026-01-23","2026-01-24","2026-01-25","2026-01-26",
        "2026-01-27","2026-01-28","2026-01-29","2026-01-30","2026-01-31",
        "2026-02-01","2026-02-02","2026-02-03","2026-02-04","2026-02-05",
        "2026-02-06","2026-02-07","2026-02-08","2026-02-09","2026-02-10",
        "2026-02-11","2026-02-12","2026-02-13","2026-02-14","2026-02-15",
        "2026-02-16","2026-02-17","2026-02-18","2026-02-19","2026-02-20",
        "2026-02-21","2026-02-22","2026-02-23","2026-02-24","2026-02-25",
        "2026-02-26","2026-02-27","2026-02-28","2026-03-01","2026-03-02",
        "2026-03-03","2026-03-04","2026-03-05","2026-03-06","2026-03-07",
        "2026-03-08","2026-03-09","2026-03-10","2026-03-11","2026-03-12",
        "2026-03-13","2026-03-14","2026-03-15","2026-03-16","2026-03-17",
        "2026-03-18","2026-03-19","2026-03-20","2026-03-21","2026-03-22",
        "2026-03-23","2026-03-24","2026-03-25","2026-03-26","2026-03-27",
        "2026-03-28","2026-03-29","2026-03-30","2026-03-31","2026-04-01"
    ],

    "Cliente": [
        "Carlos","María","José","Ana","Luis","Sofía","Pedro","Laura","Daniel","Andrea",
        "Carlos","María","José","Ana","Luis","Sofía","Pedro","Laura","Daniel","Andrea",
        "Carlos","María","José","Ana","Luis","Sofía","Pedro","Laura","Daniel","Andrea",
        "Carlos","María","José","Ana","Luis","Sofía","Pedro","Laura","Daniel","Andrea",
        "Carlos","María","José","Ana","Luis","Sofía","Pedro","Laura","Daniel","Andrea",
        "Carlos","María","José","Ana","Luis","Sofía","Pedro","Laura","Daniel","Andrea",
        "Carlos","María","José","Ana","Luis","Sofía","Pedro","Laura","Daniel","Andrea",
        "Carlos","María","José","Ana","Luis","Sofía","Pedro","Laura","Daniel","Andrea",
        "Carlos","María","José","Ana","Luis","Sofía","Pedro","Laura","Daniel","Andrea"
    ],

    "Ciudad": [
        "San José","Alajuela","Heredia","Cartago","San José",
        "Alajuela","Heredia","Cartago","San José","Alajuela",
        "Heredia","San José","Cartago","Alajuela","Heredia",
        "San José","Cartago","Alajuela","Heredia","San José",
        "Alajuela","Cartago","San José","Heredia","Alajuela",
        "San José","Heredia","Cartago","Alajuela","San José",
        "Cartago","Heredia","Alajuela","San José","Cartago",
        "Heredia","San José","Alajuela","Cartago","Heredia",
        "San José","Alajuela","Cartago","Heredia","San José",
        "Alajuela","Heredia","Cartago","San José","Alajuela",
        "Heredia","Cartago","San José","Alajuela","Heredia",
        "Cartago","San José","Alajuela","Heredia","Cartago",
        "San José","Heredia","Alajuela","Cartago","San José",
        "Alajuela","Cartago","Heredia","San José","Alajuela",
        "Heredia","Cartago","San José","Alajuela","Heredia",
        "San José","Cartago","Alajuela","Heredia","San José",
        "Cartago","Alajuela","Heredia","San José","Cartago",
        "Heredia","Alajuela","San José","Cartago","Heredia"
    ],

    "Producto": [
        "Laptop","Mouse","Teclado","Monitor","Laptop",
        "Audífonos","Mouse","Impresora","Laptop","Teclado",
        "Monitor","Mouse","Laptop","Audífonos","Teclado",
        "Monitor","Impresora","Laptop","Mouse","Audífonos",
        "Laptop","Teclado","Monitor","Mouse","Impresora",
        "Laptop","Audífonos","Teclado","Mouse","Monitor",
        "Laptop","Impresora","Audífonos","Mouse","Teclado",
        "Laptop","Monitor","Mouse","Impresora","Audífonos",
        "Teclado","Laptop","Mouse","Monitor","Impresora",
        "Audífonos","Laptop","Teclado","Mouse","Monitor",
        "Impresora","Laptop","Audífonos","Mouse","Teclado",
        "Monitor","Laptop","Impresora","Mouse","Audífonos",
        "Teclado","Laptop","Monitor","Mouse","Impresora",
        "Audífonos","Laptop","Teclado","Monitor","Mouse",
        "Laptop","Impresora","Audífonos","Teclado","Mouse",
        "Monitor","Laptop","Audífonos","Impresora","Mouse",
        "Teclado","Laptop","Monitor","Mouse","Impresora",
        "Audífonos","Laptop","Teclado","Mouse","Monitor"
    ],

    "Categoria": [
        "Computadoras","Accesorios","Accesorios","Monitores","Computadoras",
        "Audio","Accesorios","Impresión","Computadoras","Accesorios",
        "Monitores","Accesorios","Computadoras","Audio","Accesorios",
        "Monitores","Impresión","Computadoras","Accesorios","Audio",
        "Computadoras","Accesorios","Monitores","Accesorios","Impresión",
        "Computadoras","Audio","Accesorios","Accesorios","Monitores",
        "Computadoras","Impresión","Audio","Accesorios","Accesorios",
        "Computadoras","Monitores","Accesorios","Impresión","Audio",
        "Accesorios","Computadoras","Accesorios","Monitores","Impresión",
        "Audio","Computadoras","Accesorios","Accesorios","Monitores",
        "Impresión","Computadoras","Audio","Accesorios","Accesorios",
        "Monitores","Computadoras","Impresión","Accesorios","Audio",
        "Accesorios","Computadoras","Monitores","Accesorios","Impresión",
        "Audio","Computadoras","Accesorios","Monitores","Accesorios",
        "Computadoras","Impresión","Audio","Accesorios","Accesorios",
        "Monitores","Computadoras","Audio","Impresión","Accesorios",
        "Accesorios","Computadoras","Monitores","Accesorios","Impresión",
        "Audio","Computadoras","Accesorios","Accesorios","Monitores"
    ],

    "Cantidad": [
        2,15,8,3,1,6,20,2,3,10,
        4,18,2,7,12,5,3,2,25,8,
        1,14,4,22,3,2,9,11,30,5,
        2,4,7,16,9,1,6,18,3,12,
        5,2,20,4,8,3,2,7,15,6,
        4,3,10,25,2,6,1,18,12,5,
        3,8,15,2,6,4,2,10,20,7,
        1,5,12,3,18,4,2,8,15,6,
        2,11,7,3,5,2,4,14,9,6
    ],

    "Precio_Unitario": [
        450000,12000,18000,85000,450000,
        35000,12000,95000,450000,18000,
        85000,12000,450000,35000,18000,
        85000,95000,450000,12000,35000,
        450000,18000,85000,12000,95000,
        450000,35000,18000,12000,85000,
        450000,95000,35000,12000,18000,
        450000,85000,12000,95000,35000,
        18000,450000,12000,85000,95000,
        35000,450000,18000,12000,85000,
        95000,450000,35000,12000,18000,
        85000,450000,95000,12000,35000,
        18000,450000,85000,12000,95000,
        35000,450000,18000,85000,12000,
        450000,95000,35000,18000,12000,
        85000,450000,35000,95000,12000,
        18000,450000,85000,12000,95000,
        35000,450000,18000,12000,85000
    ],

    "Metodo_Pago": [
        "Tarjeta","SINPE","Efectivo","Tarjeta","Transferencia",
        "SINPE","Tarjeta","Efectivo","Transferencia","Tarjeta",
        "SINPE","Efectivo","Tarjeta","Transferencia","SINPE",
        "Tarjeta","Efectivo","SINPE","Transferencia","Tarjeta",
        "Efectivo","Tarjeta","SINPE","Transferencia","Tarjeta",
        "SINPE","Efectivo","Tarjeta","Transferencia","SINPE",
        "Tarjeta","Efectivo","SINPE","Tarjeta","Transferencia",
        "Efectivo","Tarjeta","SINPE","Transferencia","Tarjeta",
        "Efectivo","SINPE","Tarjeta","Transferencia","SINPE",
        "Tarjeta","Efectivo","SINPE","Tarjeta","Transferencia",
        "SINPE","Efectivo","Tarjeta","Transferencia","SINPE",
        "Tarjeta","Efectivo","SINPE","Tarjeta","Transferencia",
        "Efectivo","Tarjeta","SINPE","Transferencia","Tarjeta",
        "Efectivo","SINPE","Tarjeta","Transferencia","SINPE",
        "Tarjeta","Efectivo","SINPE","Tarjeta","Transferencia",
        "Efectivo","SINPE","Tarjeta","Transferencia","SINPE",
        "Tarjeta","Efectivo","SINPE","Tarjeta","Transferencia",
        "SINPE","Efectivo","Tarjeta","Transferencia","SINPE"
    ],

    "Vendedor": [
        "Carlos","Ana","Luis","María","Pedro",
        "Sofía","Carlos","Ana","Luis","María",
        "Pedro","Sofía","Carlos","Ana","Luis",
        "María","Pedro","Sofía","Carlos","Ana",
        "Luis","María","Pedro","Sofía","Carlos",
        "Ana","Luis","María","Pedro","Sofía",
        "Carlos","Ana","Luis","María","Pedro",
        "Sofía","Carlos","Ana","Luis","María",
        "Pedro","Sofía","Carlos","Ana","Luis",
        "María","Pedro","Sofía","Carlos","Ana",
        "Luis","María","Pedro","Sofía","Carlos",
        "Ana","Luis","María","Pedro","Sofía",
        "Carlos","Ana","Luis","María","Pedro",
        "Sofía","Carlos","Ana","Luis","María",
        "Pedro","Sofía","Carlos","Ana","Luis",
        "María","Pedro","Sofía","Carlos","Ana",
        "Luis","María","Pedro","Sofía","Carlos",
        "Ana","Luis","María","Pedro","Sofía"
    ]
}

df = pd.DataFrame(datos)

# --- CONSULTAS ---

# Ver datos
df.head()

# Columnas
df[["Cliente", "Producto", "Precio_Unitario"]]

# Compras de Carlos
df[df["Cliente"] == "Carlos"]

# Precio mayor a 8000
df[df["Precio_Unitario"] > 8000]

# Ventas en San José
df[df["Ciudad"] == "San José"]

# Dos condiciones
df[
    (df["Cliente"] == "Carlos") &
    (df["Precio_Unitario"] < 50000)
]

# Mayor a menor
df.sort_values("Precio_Unitario", ascending=False)

# Menor a mayor
df.sort_values("Precio_Unitario", ascending=True)

# --- TOTALES ---

# Calcular total
df["Total"] = df["Cantidad"] * df["Precio_Unitario"]

# Mostrar total
df[["ID_Venta", "Producto", "Cantidad", "Precio_Unitario", "Total"]]

# Total por producto
ventas_producto = df.groupby("Producto")["Total"].sum()
ventas_producto

# Tabla por producto
df.groupby("Producto", as_index=False)["Total"].sum()

# Total por pago
ventas_pago = df.groupby("Metodo_Pago", as_index=False)["Total"].sum()
ventas_pago

# --- GRÁFICA 1 ---

# Ventas por producto
ventas_producto.plot(
    kind="bar",
    figsize=(10, 5)
)

plt.title("Ventas por producto")
plt.xlabel("Producto")
plt.ylabel("Total")
plt.xticks(rotation=0)
plt.show()

# --- GRÁFICA 2 ---

# Ventas por ciudad
ventas_ciudad = df.groupby("Ciudad")["Total"].sum()

ventas_ciudad.plot(
    kind="bar",
    figsize=(10, 5)
)

plt.title("Ventas por ciudad")
plt.xlabel("Ciudad")
plt.ylabel("Total")
plt.xticks(rotation=0)
plt.show()

# --- GRÁFICA 3 ---

# Cantidad por producto
cantidad_producto = df.groupby("Producto")["Cantidad"].sum()

cantidad_producto.plot(
    kind="bar",
    figsize=(10, 5),
    color="orange"
)

plt.title("Cantidad vendida por producto")
plt.xlabel("Producto")
plt.ylabel("Cantidad")
plt.xticks(rotation=0)
plt.show()

# --- GRÁFICA 4 ---

# Ventas por pago
pagos = df["Metodo_Pago"].value_counts()

pagos.plot(
    kind="bar",
    figsize=(8, 5),
    color="purple"
)

plt.title("Cantidad de ventas por método de pago")
plt.xlabel("Método de pago")
plt.ylabel("Número de ventas")
plt.xticks(rotation=0)
plt.show()

# --- GRÁFICA 5 ---

# Precios
plt.figure(figsize=(10, 5))

plt.hist(
    df["Precio_Unitario"],
    bins=10,
    edgecolor="black"
)

plt.title("Distribución de precios unitarios")
plt.xlabel("Precio unitario")
plt.ylabel("Frecuencia")
plt.show()

# --- GRÁFICA 6 ---

# Cantidad y precio
plt.figure(figsize=(10, 5))

plt.scatter(
    df["Cantidad"],
    df["Precio_Unitario"],
    color="red"
)

plt.title("Cantidad vs Precio Unitario")
plt.xlabel("Cantidad")
plt.ylabel("Precio Unitario")
plt.show()

# --- GRÁFICA 7 ---

# Ciudad y producto
plt.figure(figsize=(10, 5))

sns.barplot(
    data=df,
    x="Ciudad",
    y="Total",
    hue="Producto"
)

plt.title("Ventas por ciudad y producto")
plt.xlabel("Ciudad")
plt.ylabel("Ventas")
plt.show()

# --- CLASE DE DATOS ---

datos_clase = {
    "Nombre": ["Sophia", "Ana", "Luis", "Andrés", "Sebas"],
    "Clase_Lunes": [90, 85, 78, 92, 88]
}

df_clase = pd.DataFrame(datos_clase)

# --- GRÁFICA 8 ---

plt.figure(figsize=(10, 6))

sns.barplot(
    data=df_clase,
    x="Clase_Lunes",
    y="Nombre",
    hue="Nombre",
    palette=[
        "lightcyan",
        "paleturquoise",
        "palegreen",
        "aquamarine",
        "lightblue"
    ],
    legend=False
)

plt.title("Clase de Ciencia de Datos - Lunes")
plt.xlabel("Ciencias de Datos Lunes")
plt.ylabel("Dylan")

plt.gcf().set_facecolor("mintcream")
plt.gca().set_facecolor("powderblue")

plt.grid(
    axis="x",
    linestyle="--",
    alpha=0.3
)

plt.show()