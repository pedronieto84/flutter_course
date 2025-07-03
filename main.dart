// POO: Herencia

class Animal {
  void hablar() => print("El animal hace un sonido");
}

class Perro extends Animal {
  @override // Sobreescritura del método hablar
  void hablar() => print("Guau");
}

void main() {
  Animal animal = Animal();
  animal.hablar(); // Imprime: El animal hace un sonido

  Perro perro = Perro();
  perro.hablar(); // Imprime: Guau
  
}