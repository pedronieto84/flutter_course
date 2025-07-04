// Operacions matemàtiques bàsiques

void main() {
  int a = 10;
  int b = 3;

  // Suma
  int suma = a + b;
  print("Suma: $a + $b = $suma");

  // Resta
  int resta = a - b;
  print("Resta: $a - $b = $resta");

  // Multiplicación
  int multiplicacion = a * b;
  print("Multiplicación: $a * $b = $multiplicacion");

  // División (devuelve double)
  double division = a / b;
  print("División: $a / $b = $division");

  // División entera (resultado entero sin decimales)
  int divisionEntera = a ~/ b;
  print("División entera: $a ~/ $b = $divisionEntera");

  // Módulo (resto de la división)
  int modulo = a % b;
  print("Módulo: $a % $b = $modulo");

  // Negativo
  int negativo = -a;
  print("Negativo de $a = $negativo");
}