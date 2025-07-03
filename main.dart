// POO: Abstract Classes 

abstract class Volador {
  void volar();
}

class Pajaro implements Volador {
  @override
  void volar() {
    print("Estoy volando");
  }
}

void main(List<String> args) {
  Pajaro pajaro = Pajaro();
  pajaro.volar(); // Imprime: Estoy volando
  
}