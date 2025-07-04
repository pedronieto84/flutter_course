// Operaciones matemàticas complejas

import 'dart:math'; // Para operaciones como pow()

void main() {
  double x = -3.7;
  double y = 4.2;

  // Valor absoluto
  print("abs($x) = ${x.abs()}"); // 3.7 // Este no necesita importar dart:math

  // Máximo
  print("max($x, $y) = ${max(x, y)}"); // 4.2

  // Mínimo
  print("min($x, $y) = ${min(x, y)}"); // -3.7

  // Potencia
  print("pow(2, 5) = ${pow(2, 5)}"); // 32

  // Raíz cuadrada
  print("sqrt(16) = ${sqrt(16)}"); // 4.0

  // Logaritmo natural (base e)
  print("log(10) = ${log(10)}"); // ~2.3025

  // Exponencial (e^x)
  print("exp(2) = ${exp(2)}"); // ~7.389

  // Trigonometría
  double angulo = pi / 4; // 45 grados

  print("sin(pi/4) = ${sin(angulo)}"); // ~0.707
  print("cos(pi/4) = ${cos(angulo)}"); // ~0.707
  print("tan(pi/4) = ${tan(angulo)}"); // ~1.0

  // Redondeo hacia abajo
  print("floor($x) = ${x.floor()}"); // -4

  // Redondeo hacia arriba
  print("ceil($x) = ${x.ceil()}"); // -3

  // Truncar decimales
  print("truncate($x) = ${x.truncate()}"); // -3

  // Número aleatorio entre 0.0 y 1.0
  Random rng = Random();
  print("random double (0-1): ${rng.nextDouble()}");

  // Número aleatorio entero entre 0 y 99
  print("random int (0-99): ${rng.nextInt(100)}");

}