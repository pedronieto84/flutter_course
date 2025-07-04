// Bucle for-in

void main() {
  // LIST

  List<String> colores = ["rojo", "verde", "azul"];

  for (var color in colores) {
    print("for-in: $color");
  }

  // SET
  Set<int> numeros = {10, 20, 30};

  for (var numero in numeros) {
    print("Número: $numero");
  }

  // MAP
    Map<String, int> edades = {
    "Pedro": 30,
    "Laura": 25,
    "Ana": 28
  };

  for (var entrada in edades.entries) {
    print("${entrada.key} tiene ${entrada.value} años");
  }
}
