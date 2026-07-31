# Ejercicios básicos de Python

# Ejercicio 1: Muestra un saludo.
print("Hola Mundo")


# Ejercicio 2: Imprime tres mensajes personales.
print("Estoy aprendiendo Python")
print("Mi Nombre es Alonso")
print("Tengo 45 años")


# Ejercicio 3: Guarda y muestra un nombre.
nombre = "LUIS"
print(nombre)


# Ejercicio 4: Guarda y muestra nombre, edad y ciudad.
nombre = "Luis"
edad = 20.5
ciudad = "San José"

print(nombre)
print(edad)
print(ciudad)


# Ejercicio 5: Suma dos números definidos.
numero1 = 15
numero2 = 8
resultado = numero1 + numero2

print(resultado)


# Ejercicio 6: Realiza las cuatro operaciones básicas.
numero1 = 15
numero2 = 8

print("Suma:", numero1 + numero2)
print("Resta:", numero1 - numero2)
print("Multiplicación:", numero1 * numero2)
print("División:", numero1 / numero2)


# Ejercicio 7: Pide el nombre y muestra un saludo.
nombre = input("¿Cómo te llamas? ")
print("Hola", nombre)


# Ejercicio 8: Pide la edad y la muestra.
edad = float(input("Digite su edad: "))
print("Su edad es:", edad)


# Ejercicio 9: Pide dos números y los suma.
numero1 = float(input("Primer número: "))
numero2 = float(input("Segundo número: "))
suma = numero1 + numero2

print("La suma es:", suma)


# Ejercicio 10: Indica si la persona es mayor de edad.
edad = float(input("Edad: "))

if edad >= 18:
    print("Es mayor de edad")
else:
    print("Es menor de edad")


# Ejercicio 11: Indica si una nota aprueba o reprueba.
nota = float(input("Nota: "))

if nota >= 70:
    print("Aprobó")
else:
    print("Reprobó")


# Ejercicio 12: Indica si un número es positivo o negativo.
numero = float(input("Digite un número: "))

if numero >= 0:
    print("El número es positivo")
else:
    print("El número es negativo")
