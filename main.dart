// Dart: Funciones
void main() {
  saludar();
  saludarPersona('Juan');
  int resultado = sumar(5, 3);
  print('Resultado de la suma: $resultado');
  int producto = multiplicar(4, 2);
  print('Producto: $producto');
  mostrarMensaje('¡Hola, Dart!', 'Even');
  imprimirDatos(nombre: 'Luis');
}

// Sin parametros
void saludar() {
  print('Hola, mundo!');
}

// Con parametros
void saludarPersona(String nombre) {
  print('Hola, $nombre!');
}

// Con retorno
int sumar(int a, int b) {
  return a + b;
}

// Arrow function solamente si es una sola línea
int multiplicar(int x, int y) => x * y;

// Con parámetros opcionales por defecto
void mostrarMensaje(String mensaje, [String autor = 'Anónimo']) {
  print('"$mensaje" - $autor');
}

// Con parámetros nombrados
void imprimirDatos({required String nombre, int edad = 0}) {
  print('Nombre: $nombre, Edad: $edad');
}
