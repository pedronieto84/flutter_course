// Operaciones con cadenas de texto en Dart

void main() {
  String texto = " Hola Mundo ";

  // Longitud
  print('Longitud: "${texto.trim()}" tiene ${texto.trim().length} caracteres');

  // Substring
  print('Substring (1 a 5): ${texto.substring(1, 5)}');

  // Mayúsculas
  print('Mayúsculas: ${texto.toUpperCase()}');

  // Minúsculas
  print('Minúsculas: ${texto.toLowerCase()}');

  // Buscar substring (contains)
  print('Contiene "Mun": ${texto.contains("Mun")}');

  // Reemplazar (solo la primera coincidencia)
  print('Reemplazar "Hola" por "Adiós": ${texto.replaceFirst("Hola", "Adiós")}');

  // Dividir string
  String csv = "manzana,pera,plátano";
  List<String> frutas = csv.split(",");
  print('Frutas: $frutas');

  // Eliminar espacios (trim)
  print('Sin espacios: "${texto.trim()}"');

  // Convertir número a string
  int numero = 42;
  print('Número a texto: ${numero.toString()}');

  // Concatenación
  String nombre = "Pedro";
  String saludo = "Hola, " + nombre + "!";
  print(saludo);

  // Interpolación
  print('Interpolación: Hola, $nombre! Tienes ${numero} años.');

}