// POO: Polimorfismo

class Animal {
  void hablar() => print("El animal hace un sonido");
}

class Perro extends Animal {
  @override
  void hablar() => print("Guau");
}

class Gato extends Animal {
  @override
  void hablar() => print("Miau");
}


void main() {
  // Lista de animales, pero con tipos derivados (Perro, Gato)
  List<Animal> animales = [Perro(), Gato(), Animal()];

  for (var animal in animales) {
    animal.hablar(); // Polimorfismo: llama al método correcto según el tipo real
  }
}