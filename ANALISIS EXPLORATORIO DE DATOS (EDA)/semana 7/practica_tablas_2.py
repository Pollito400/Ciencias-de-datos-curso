import pandas as pd
import matplotlib.pyplot as plt


# ============================================================
# EJERCICIO 1
# VENTAS DE TIENDA FÍSICA Y TIENDA ONLINE
# ============================================================

# Datos
datos_ventas = {
    "Mes": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],

    "Ventas_tienda_fisica": [
        4200, 4150, 4300, 4180, 4250, 4100,
        4220, 4190, 4260, 4150, 4300, 4230
    ],

    "Ventas_tienda_online": [
        800, 870, 950, 1050, 1180, 1300,
        1450, 1600, 1750, 1900, 2100, 2350
    ]
}

# Crear DataFrame
df_ventas = pd.DataFrame(datos_ventas)

# Calcular ventas totales
df_ventas["Ventas_totales"] = (
    df_ventas["Ventas_tienda_fisica"] +
    df_ventas["Ventas_tienda_online"]
)

# Calcular porcentaje de tienda física
df_ventas["Porcentaje_fisica"] = (
    df_ventas["Ventas_tienda_fisica"] /
    df_ventas["Ventas_totales"]
) * 100

# Calcular porcentaje de tienda online
df_ventas["Porcentaje_online"] = (
    df_ventas["Ventas_tienda_online"] /
    df_ventas["Ventas_totales"]
) * 100


# Mostrar tabla
print("TABLA DE VENTAS")
print(df_ventas)


# ============================================================
# GRÁFICO 1
# PORCENTAJE DE PARTICIPACIÓN DE LAS VENTAS
# ============================================================

plt.figure(figsize=(10, 6))

# Línea tienda física
plt.plot(
    df_ventas["Mes"],
    df_ventas["Porcentaje_fisica"],
    marker="o",
    label="Tienda física"
)

# Línea tienda online
plt.plot(
    df_ventas["Mes"],
    df_ventas["Porcentaje_online"],
    marker="o",
    label="Tienda online"
)


# Números de porcentaje de tienda física
for x, y in zip(
    df_ventas["Mes"],
    df_ventas["Porcentaje_fisica"]
):
    plt.text(
        x,
        y + 1,
        f"{y:.1f}%",
        ha="center"
    )


# Números de porcentaje de tienda online
for x, y in zip(
    df_ventas["Mes"],
    df_ventas["Porcentaje_online"]
):
    plt.text(
        x,
        y - 3,
        f"{y:.1f}%",
        ha="center"
    )


plt.title("Porcentaje de participación de ventas por mes")
plt.xlabel("Mes")
plt.ylabel("Porcentaje (%)")

plt.xticks(df_ventas["Mes"])
plt.ylim(0, 100)

plt.grid(True)
plt.legend()

plt.show()


# ============================================================
# GRÁFICO 2
# COMPARACIÓN DE VENTAS FÍSICAS Y ONLINE
# ============================================================

plt.figure(figsize=(10, 6))

# Tienda física
plt.plot(
    df_ventas["Mes"],
    df_ventas["Ventas_tienda_fisica"],
    marker="o",
    label="Tienda física"
)

# Tienda online
plt.plot(
    df_ventas["Mes"],
    df_ventas["Ventas_tienda_online"],
    marker="o",
    label="Tienda online"
)


plt.title("Comparación de ventas: Tienda física vs Tienda online")
plt.xlabel("Mes")
plt.ylabel("Ventas en miles de colones")

plt.xticks(df_ventas["Mes"])

plt.grid(True)
plt.legend()

plt.show()



# ============================================================
# EJERCICIO 2
# RENUNCIAS POR TRIMESTRE DURANTE TRES AÑOS
# ============================================================

# Datos
datos_renuncias = {
    "Trimestre": [
        "Q1 (ene-mar)",
        "Q2 (abr-jun)",
        "Q3 (jul-sep)",
        "Q4 (oct-dic)"
    ],

    "Año 1": [3, 2, 2, 9],
    "Año 2": [4, 3, 2, 10],
    "Año 3": [3, 2, 3, 11]
}

# Crear DataFrame
df_renuncias = pd.DataFrame(datos_renuncias)


# Mostrar tabla
print("\nTABLA DE RENUNCIAS")
print(df_renuncias)


# ============================================================
# GRÁFICO 3
# RENUNCIAS POR TRIMESTRE - TRES AÑOS SUPERPUESTOS
# ============================================================

plt.figure(figsize=(10, 6))

# Año 1
plt.plot(
    df_renuncias["Trimestre"],
    df_renuncias["Año 1"],
    marker="o",
    label="Año 1"
)

# Año 2
plt.plot(
    df_renuncias["Trimestre"],
    df_renuncias["Año 2"],
    marker="o",
    label="Año 2"
)

# Año 3
plt.plot(
    df_renuncias["Trimestre"],
    df_renuncias["Año 3"],
    marker="o",
    label="Año 3"
)


# Agregar números a cada punto
for i in range(len(df_renuncias)):

    plt.text(
        i,
        df_renuncias["Año 1"][i] + 0.2,
        str(df_renuncias["Año 1"][i]),
        ha="center"
    )

    plt.text(
        i,
        df_renuncias["Año 2"][i] + 0.2,
        str(df_renuncias["Año 2"][i]),
        ha="center"
    )

    plt.text(
        i,
        df_renuncias["Año 3"][i] + 0.2,
        str(df_renuncias["Año 3"][i]),
        ha="center"
    )


plt.title("Renuncias por trimestre durante tres años")
plt.xlabel("Trimestre")
plt.ylabel("Cantidad de renuncias")

plt.legend()
plt.grid(True)

plt.show()


# ============================================================
# GRÁFICO 4
# COMPARACIÓN DE RENUNCIAS CON BARRAS AGRUPADAS
# ============================================================

# Poner trimestre como índice
df_grafico = df_renuncias.set_index("Trimestre")

# Crear gráfico de barras
df_grafico.plot(
    kind="bar",
    figsize=(10, 6)
)

plt.title("Comparación de renuncias por trimestre")
plt.xlabel("Trimestre")
plt.ylabel("Cantidad de renuncias")

plt.xticks(rotation=0)
plt.grid(axis="y")

plt.show()