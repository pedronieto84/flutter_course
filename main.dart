// LIST operaciones avanzadas

void main() {
  // Crear una lista
  List<int> numeros = [1, 2, 3, 4, 5, 6];

  // Filtrar pares
  List<int> pares = numeros.where((n) => n % 2 == 0).toList();
  print("Números pares: $pares"); // [2, 4, 6]

  // Doblar los números
  List<int> dobles = numeros.map((n) => n * 2).toList();
  print("Números dobles: $dobles"); // [2, 4, 6, 8, 10, 12]

  // Encontrar primero donde se cumple una condición
  int primerMayorQue3 = numeros.firstWhere((n) => n > 3);
  print("Primer número > 3: $primerMayorQue3"); // 4

  // Combinar acciones
  List<String> textoDeImpares = numeros
      .where((n) => n % 2 != 0) // Filtrar impares
      .map((n) => "Impar: $n") // Convertir a texto
      .toList(); // Devuelve una lista
  print(textoDeImpares); // [Impar: 1, Impar: 3, Impar: 5]
}
