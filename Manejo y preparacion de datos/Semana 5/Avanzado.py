# Ejercicio 1: muestra un menú sencillo.
def ejercicio_1():
    print("\n MENÚ PRINCIPAL ")
    print("1. Saludar")
    print("2. Mostrar nombre")
    print("3. Sumar dos números")
    print("4. Salir")


# Ejercicio 2: permite saludar o escribir un nombre.
def ejercicio_2():
    while True:
        print("\n MENÚ PRINCIPAL ")
        print("1. Saludar")
        print("2. Mostrar nombre")
        print("3. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            print("¡Hola! Bienvenido al programa.")

        elif opcion == "2":
            nombre = input("Digite su nombre: ")
            print("Hola", nombre)

        elif opcion == "3":
            print("Gracias por utilizar el programa.")
            break

        else:
            print("Opción inválida. Intente nuevamente.")


# Ejercicio 3: agrega la suma de dos números.
def ejercicio_3():
    while True:
        print("\n MENÚ PRINCIPAL ")
        print("1. Saludar")
        print("2. Mostrar nombre")
        print("3. Sumar dos números")
        print("4. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            print("¡Hola! Bienvenido al programa.")

        elif opcion == "2":
            nombre = input("Digite su nombre: ")
            print("Hola", nombre)

        elif opcion == "3":
            try:
                num1 = float(input("Digite el primer número: "))
                num2 = float(input("Digite el segundo número: "))
                suma = num1 + num2
                print("La suma es:", suma)
            except ValueError:
                print("Debe digitar números válidos.")

        elif opcion == "4":
            print("Gracias por utilizar el programa.")
            break

        else:
            print("Opción inválida. Intente nuevamente.")


# Ejercicio 4: agrega promedio, análisis y búsqueda de animal.
def ejercicio_4():
    while True:
        print("\n MENÚ PRINCIPAL ")
        print("1. Saludar")
        print("2. Mostrar nombre")
        print("3. Sumar números")
        print("4. Mostrar promedio")
        print("5. Aplicar análisis")
        print("6. Buscar animal")
        print("7. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            print("¡Hola! Bienvenido al programa.")

        elif opcion == "2":
            nombre = input("Digite su nombre: ")
            print("Hola", nombre)

        elif opcion == "3":
            try:
                num1 = float(input("Digite el primer número: "))
                num2 = float(input("Digite el segundo número: "))
                suma = num1 + num2
                print("La suma es:", suma)
            except ValueError:
                print("Debe digitar números válidos.")

        elif opcion == "4":
            try:
                n1 = float(input("Digite la primera nota: "))
                n2 = float(input("Digite la segunda nota: "))
                n3 = float(input("Digite la tercera nota: "))

                promedio = (n1 + n2 + n3) / 3
                print("El promedio es:", round(promedio, 2))
            except ValueError:
                print("Debe digitar notas válidas.")

        elif opcion == "5":
            print("Aplicando análisis...")

        elif opcion == "6":
            animal = input("¿Qué animal desea buscar?: ")
            print("Buscando:", animal)

        elif opcion == "7":
            print("Gracias por utilizar el programa.")
            break

        else:
            print("Opción inválida. Intente nuevamente.")


# Ejercicio 5: crea una tabla para el reporte de ventas.
def crear_datos_ventas():
    datos = {
        "Producto": [
            "Laptop",
            "Mouse",
            "Teclado",
            "Monitor",
            "Audífonos",
            "Impresora",
            "Cámara",
            "Memoria USB"
        ],
        "Categoría": [
            "Computación",
            "Accesorios",
            "Accesorios",
            "Computación",
            "Accesorios",
            "Oficina",
            "Tecnología",
            "Accesorios"
        ],
        "Precio": [
            450000,
            12000,
            25000,
            135000,
            30000,
            95000,
            80000,
            9000
        ],
        "Cantidad": [
            4,
            12,
            8,
            6,
            10,
            3,
            5,
            15
        ]
    }

    return pd.DataFrame(datos)


# Ejercicio 6: realiza diferentes consultas de ventas.
def ejercicio_6():
    df = crear_datos_ventas()

    while True:
        print("\n REPORTE DE VENTAS ")
        print("1. Mostrar todos los productos")
        print("2. Buscar un producto")
        print("3. Mostrar estadísticas")
        print("4. Producto más vendido")
        print("5. Ventas por categoría")
        print("6. Calcular valor total de ventas")
        print("7. Mostrar productos con cantidad > 5")
        print("8. Regresar al menú principal")

        opcion_reporte = input("Seleccione una opción: ")

        if opcion_reporte == "1":
            print("\n TODOS LOS PRODUCTOS ")
            print(df.to_string(index=False))

        elif opcion_reporte == "2":
            producto = input("\n Digite el producto que desea buscar: ")

            resultado = df[
                df["Producto"].str.lower() == producto.lower()
            ]

            if resultado.empty:
                print("\n Producto no encontrado.")
            else:
                print("\n RESULTADO DE LA BÚSQUEDA ")
                print(resultado.to_string(index=False))

        elif opcion_reporte == "3":
            print("\n ESTADÍSTICAS ")
            print(df[["Precio", "Cantidad"]].describe().round(2))

        elif opcion_reporte == "4":
            posicion = df["Cantidad"].idxmax()
            producto_mas_vendido = df.loc[posicion]

            print("\n PRODUCTO MÁS VENDIDO ")
            print("Producto:", producto_mas_vendido["Producto"])
            print("Cantidad:", producto_mas_vendido["Cantidad"])

        elif opcion_reporte == "5":
            copia = df.copy()
            copia["Venta total"] = copia["Precio"] * copia["Cantidad"]

            ventas_categoria = copia.groupby("Categoría").agg(
                Cantidad=("Cantidad", "sum"),
                Venta_total=("Venta total", "sum")
            )

            print("\n VENTAS POR CATEGORÍA ")
            print(ventas_categoria)

        elif opcion_reporte == "6":
            total = (df["Precio"] * df["Cantidad"]).sum()
            print("\nValor total de las ventas: ₡", format(total, ",.2f"))

        elif opcion_reporte == "7":
            productos = df[df["Cantidad"] > 5]

            print("\n PRODUCTOS CON CANTIDAD MAYOR A 5 ")
            print(productos.to_string(index=False))

        elif opcion_reporte == "8":
            print("Regresando al menú de ejercicios...")
            break

        else:
            print("Opción inválida. Intente nuevamente.")


# Menú final: permite ejecutar cualquiera de los ejercicios.
def menu_de_ejercicios():
    while True:
        print("\n TODOS LOS EJERCICIOS ")
        print("1. Mostrar menú sencillo")
        print("2. Menú de saludo y nombre")
        print("3. Menú con suma")
        print("4. Menú completo")
        print("5. Mostrar tabla de ventas")
        print("6. Reporte completo de ventas")
        print("7. Salir")

        opcion = input("Seleccione el ejercicio: ")

        if opcion == "1":
            ejercicio_1()

        elif opcion == "2":
            ejercicio_2()

        elif opcion == "3":
            ejercicio_3()

        elif opcion == "4":
            ejercicio_4()

        elif opcion == "5":
            df = crear_datos_ventas()
            print("\n DATOS DE VENTAS ")
            print(df.to_string(index=False))

        elif opcion == "6":
            ejercicio_6()

        elif opcion == "7":
            print("Programa finalizado.")
            break

        else:
            print("Opción inválida. Intente nuevamente.")


menu_de_ejercicios()