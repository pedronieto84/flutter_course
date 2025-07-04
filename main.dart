// LIST operaciones más habituales

void main() {
  // Crear una lista
  List<String> frutas = ["manzana", "pera", "plátano"];

  // Acceder a un elemento por índice
  print("Primera fruta: ${frutas[0]}"); // manzana

  // Modificar un elemento
  frutas[1] = "naranja";
  print("Lista modificada: $frutas"); // [manzana, naranja, plátano]

  // Añadir un elemento al final
  frutas.add("kiwi");
  print("Después de añadir: $frutas");

  // Añadir varios elementos
  frutas.addAll(["melón", "sandía"]);
  print("Después de añadir varios: $frutas");

  // Insertar en una posición concreta
  frutas.insert(1, "limón");
  print("Después de insertar: $frutas");

  // Eliminar por valor
  frutas.remove("plátano");
  print("Después de eliminar 'plátano': $frutas");

  // Eliminar por índice
  frutas.removeAt(0);
  print("Después de eliminar en índice 0: $frutas");

  // Ver si contiene un valor
  print("Contiene 'kiwi'? ${frutas.contains("kiwi")}");

  // Ordenar la lista
  frutas.sort();
  print("Ordenada: $frutas");

  // Revertir el orden
  frutas = frutas.reversed.toList();
  print("Revertida: $frutas");

  // Longitud de la lista
  print("Número de frutas: ${frutas.length}");
}
