// Set: operaciones básicas
void main() {
  // Crear un Set
  Set<int> s = {1, 2, 3};
  print("Set inicial: $s");

  // Añadir un elemento
  s.add(4);
  print("Después de add(4): $s");

  // Eliminar un elemento
  s.remove(2);
  print("Después de remove(2): $s");

  // Vaciar el set
  s.clear();
  print("Después de clear(): $s");

  // Volver a poblarlo
  s.addAll([1, 2, 3, 4, 5, 6]);

  // Ver si contiene un valor
  print("¿Contiene el 3?: ${s.contains(3)}"); // true
  print("¿Contiene el 9?: ${s.contains(9)}"); // false

  // Longitud
  print("Longitud del set: ${s.length}");

  // Recorrer con for-in
  for (var valor in s) {
    print("Elemento: $valor");
  }

  // Filtrar: números pares
  Set<int> pares = s.where((n) => n % 2 == 0).toSet();
  print("Números pares: $pares");

  // Mapear: elevar al cuadrado
  Set<int> cuadrados = s.map((n) => n * n).toSet();
  print("Cuadrados: $cuadrados");

  // Unión
  Set<int> otros = {5, 6, 7, 8};
  Set<int> union = s.union(otros);
  print("Unión: $union"); // {1, 2, 3, 4, 5, 6, 7, 8}

  // Intersección (elementos comunes)
  Set<int> interseccion = s.intersection(otros);
  print("Intersección: $interseccion"); // {5, 6}

  // Diferencia (elementos que están en s pero no en otros)
  Set<int> diferencia = s.difference(otros);
  print("Diferencia: $diferencia"); // {1, 2, 3, 4}
}
