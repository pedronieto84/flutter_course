class Persona {
  String nombre;
  Persona(this.nombre); // Constructor de la clase Persona
}

class Empleado extends Persona {
  int salario;

  Empleado(String nombre, this.salario) : super(nombre);
}

main() {
  Empleado empleado = Empleado("Juan", 50000);
  print("Nombre: ${empleado.nombre}, Salario: ${empleado.salario}");
}