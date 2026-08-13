import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import math
from IPython.display import display


# =========================================================
# EJERCICIO 1
# CORRELACIÓN ENTRE VISITAS Y MONTO DEL PEDIDO
# =========================================================


# 1. Datos
datos = {
    "Comercio": ["A", "B", "C", "D", "E", "F", "G"],
    "Visitas": [2, 4, 1, 6, 3, 5, 2],
    "Pedido": [45, 68, 30, 95, 52, 80, 40]
}

df = pd.DataFrame(datos)


# 2. Columnas para Pearson
df["XY"] = df["Visitas"] * df["Pedido"]
df["X²"] = df["Visitas"] ** 2
df["Y²"] = df["Pedido"] ** 2


# 3. Totales
totales = pd.DataFrame({
    "Comercio": ["Total"],
    "Visitas": [df["Visitas"].sum()],
    "Pedido": [df["Pedido"].sum()],
    "XY": [df["XY"].sum()],
    "X²": [df["X²"].sum()],
    "Y²": [df["Y²"].sum()]
})

tabla_completa = pd.concat(
    [df, totales],
    ignore_index=True
)


# 4. Mostrar tabla
print("TABLA DE COMERCIOS")
display(tabla_completa)


# 5. Sumatorias
n = len(df)

suma_x = df["Visitas"].sum()
suma_y = df["Pedido"].sum()
suma_xy = df["XY"].sum()
suma_x2 = df["X²"].sum()
suma_y2 = df["Y²"].sum()

print("\nSUMATORIAS")
print("n =", n)
print("ΣX =", suma_x)
print("ΣY =", suma_y)
print("ΣXY =", suma_xy)
print("ΣX² =", suma_x2)
print("ΣY² =", suma_y2)


# 6. Fórmula de Pearson
numerador = (n * suma_xy) - (suma_x * suma_y)

parte_x = (n * suma_x2) - (suma_x ** 2)
parte_y = (n * suma_y2) - (suma_y ** 2)

denominador = math.sqrt(parte_x * parte_y)

r = numerador / denominador


# 7. Mostrar procedimiento
print("\nPROCEDIMIENTO DE PEARSON")

print("\nNumerador:")
print(f"{n}({suma_xy}) - {suma_x}({suma_y}) = {numerador}")

print("\nParte X:")
print(f"{n}({suma_x2}) - {suma_x}² = {parte_x}")

print("\nParte Y:")
print(f"{n}({suma_y2}) - {suma_y}² = {parte_y}")

print("\nResultado:")
print(f"r = {r:.3f}")


# 8. Interpretación
if r >= 0.9:
    print("Correlación positiva muy fuerte")
elif r >= 0.7:
    print("Correlación positiva fuerte")
elif r >= 0.5:
    print("Correlación positiva moderada")
elif r > 0:
    print("Correlación positiva débil")
elif r == 0:
    print("No hay correlación")
else:
    print("Correlación negativa")


# 9. Línea de tendencia
pendiente, intercepto = np.polyfit(
    df["Visitas"],
    df["Pedido"],
    1
)

x_linea = np.linspace(
    df["Visitas"].min() - 0.5,
    df["Visitas"].max() + 0.5,
    100
)

y_linea = pendiente * x_linea + intercepto


# 10. Gráfico de dispersión
plt.figure(figsize=(8, 6), facecolor="white")

ax = plt.gca()

ax.set_facecolor("#FDFBFF")

plt.grid(
    True,
    linestyle="--",
    alpha=0.5,
    zorder=0
)

plt.scatter(
    df["Visitas"],
    df["Pedido"],
    color="#9B59B6",
    s=150,
    edgecolor="#5B2C6F",
    linewidth=1.5,
    zorder=5,
    alpha=0.9,
    label="Comercios"
)


# Etiquetas de los comercios
for i, nombre in enumerate(df["Comercio"]):

    plt.annotate(
        nombre,
        (
            df["Visitas"].iloc[i],
            df["Pedido"].iloc[i]
        ),
        xytext=(0, 12),
        textcoords="offset points",
        ha="center",
        va="bottom",
        fontsize=10,
        fontweight="bold"
    )


# Línea de tendencia
plt.plot(
    x_linea,
    y_linea,
    color="#E5989B",
    linestyle="--",
    linewidth=2.5,
    label="Línea de tendencia"
)


# Valor de r
plt.text(
    0.05,
    0.95,
    f"r = {r:.3f}",
    transform=ax.transAxes,
    fontsize=12,
    fontweight="bold",
    verticalalignment="top",
    bbox=dict(
        boxstyle="round",
        facecolor="white",
        edgecolor="gray"
    )
)


plt.title(
    "Relación entre visitas mensuales y monto del pedido",
    fontsize=14,
    fontweight="bold"
)

plt.xlabel("Visitas en el mes (X)")
plt.ylabel("Monto del pedido en miles (Y)")

plt.legend()
plt.tight_layout()
plt.show()


# 11. Gráfico circular
plt.figure(figsize=(8, 8))

plt.pie(
    df["Pedido"],
    labels=df["Comercio"],
    autopct="%1.1f%%",
    startangle=90
)

plt.title(
    "Participación del monto de pedidos por comercio",
    fontsize=14,
    fontweight="bold"
)

plt.axis("equal")
plt.tight_layout()
plt.show()



# =========================================================
# EJERCICIO 2
# GASTO POR VENDEDOR Y VALORES FUERA DE CONTROL
# =========================================================


# 1. Datos
vendedores = list(range(1, 16))

gastos = [
    45, 52, 38, 60, 48,
    55, 42, 50, 58, 47,
    5, 53, 310, 44, 49
]

df_vendedores = pd.DataFrame({
    "Vendedor": vendedores,
    "Gasto": gastos
})


# 2. Promedio
promedio = df_vendedores["Gasto"].mean()


# 3. Desviación estándar
desviacion = df_vendedores["Gasto"].std(ddof=0)


# 4. Límites de control
limite_superior = promedio + 3 * desviacion
limite_inferior = promedio - 3 * desviacion


print("\n\nGRÁFICO DE CONTROL")

print(f"Línea central = {promedio:.1f}")
print(f"Límite superior = {limite_superior:.1f}")
print(f"Límite inferior = {limite_inferior:.1f}")


# 5. Identificar valores fuera de control
df_vendedores["Fuera de control"] = (
    (df_vendedores["Gasto"] > limite_superior) |
    (df_vendedores["Gasto"] < limite_inferior)
)


# Mostrar tabla
print("\nTABLA DE VENDEDORES")
display(df_vendedores)


# Mostrar valores fuera de control
print("\nPuntos fuera de los límites de control:")

display(
    df_vendedores.loc[
        df_vendedores["Fuera de control"],
        ["Vendedor", "Gasto"]
    ]
)


# 6. Colores de las barras
colores = [
    "red" if fuera else "steelblue"
    for fuera in df_vendedores["Fuera de control"]
]


# 7. Gráfico de barras
plt.figure(figsize=(10, 6))

plt.bar(
    df_vendedores["Vendedor"],
    df_vendedores["Gasto"],
    color=colores,
    edgecolor="black",
    alpha=0.8
)


# Línea central
plt.axhline(
    promedio,
    color="green",
    linewidth=2,
    label=f"Línea central = {promedio:.1f}"
)


# Límite superior
plt.axhline(
    limite_superior,
    color="red",
    linestyle="--",
    linewidth=1.5,
    label=f"Límite superior = {limite_superior:.1f}"
)


# Límite inferior
plt.axhline(
    limite_inferior,
    color="red",
    linestyle="--",
    linewidth=1.5,
    label=f"Límite inferior = {limite_inferior:.1f}"
)


# 8. Valores encima de las barras
for i, gasto in enumerate(df_vendedores["Gasto"]):

    plt.text(
        df_vendedores["Vendedor"].iloc[i],
        gasto + 5,
        str(gasto),
        ha="center",
        fontsize=9
    )


# 9. Marcar valores fuera de control
fuera_control = df_vendedores[
    df_vendedores["Fuera de control"]
]

for i, fila in fuera_control.iterrows():

    plt.annotate(
        f"Fuera de control\nVendedor {int(fila['Vendedor'])}",
        (
            fila["Vendedor"],
            fila["Gasto"]
        ),
        xytext=(0, 25),
        textcoords="offset points",
        ha="center",
        color="red",
        fontweight="bold"
    )


# 10. Personalizar gráfica
plt.title(
    "Gráfico de Control - Gasto por Vendedor",
    fontsize=14,
    fontweight="bold"
)

plt.xlabel("Vendedor")
plt.ylabel("Gasto")

plt.xticks(vendedores)

plt.grid(
    axis="y",
    linestyle="--",
    alpha=0.3
)

plt.legend()

plt.tight_layout()

plt.show()