import 'animal.dart'; // importació relativa

class Perro extends Animal {
  String raza;

  Perro(String nombre, this.raza) : super(nombre);

  @override
  void hablar() {
    print('$nombre (de raza $raza) dice: Guau!');
  }
}