// Operar con mapas en Dart
void main() {
  // Crear un mapa
  Map<String, int> mapa = {"a": 1, "b": 2};
  print("Mapa inicial: $mapa");

  // Acceder al valor por clave
  print("Valor de 'a': ${mapa["a"]}");

  // Modificar el valor de una clave
  mapa["a"] = 100;
  print("Mapa después de modificar 'a': $mapa");

  // Añadir una nueva clave-valor
  mapa["nueva"] = 3;
  print("Mapa después de añadir 'nueva': $mapa");

  // Eliminar una clave
  mapa.remove("b");
  print("Mapa después de eliminar 'b': $mapa");

  // Ver si contiene una clave
  print("¿Contiene clave 'a'? ${mapa.containsKey("a")}");

  // Ver si contiene un valor
  print("¿Contiene valor 3? ${mapa.containsValue(3)}");

  // Recorrer claves
  print("Recorriendo claves:");
  for (var clave in mapa.keys) {
    print("- Clave: $clave");
  }

  // Recorrer valores
  print("Recorriendo valores:");
  for (var valor in mapa.values) {
    print("- Valor: $valor");
  }

  // Recorrer clave-valor con .entries
  print("Recorriendo mapa con entries:");
  for (var entrada in mapa.entries) {
    print("- ${entrada.key}: ${entrada.value}");
  }

  // Tamaño del mapa
  print("Tamaño del mapa: ${mapa.length}");

  // Vaciar el mapa
  mapa.clear();
  print("Mapa después de .clear(): $mapa");
}
