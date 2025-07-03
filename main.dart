// Interfaz 1
abstract class Volador {
  void volar();
}

// Interfaz 2
abstract class Nadador {
  void nadar();
}

// Clase que implementa ambas interfaces
class Pato implements Volador, Nadador {
  @override
  void volar() {
    print("El pato está volando.");
  }

  @override
  void nadar() {
    print("El pato está nadando.");
  }
}

void main() {
  Pato pato = Pato();
  pato.volar(); // El pato está volando.
  pato.nadar(); // El pato está nadando.
}