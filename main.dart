void imprimirElemento<T>(T valor) {
  print('Valor: $valor');
}

void main() {
  imprimirElemento<String>("Hola");
  imprimirElemento<int>(123);
  imprimirElemento<List<String>>(["uno", "dos"]);

  // Exemple de com dona error gràcies al generic
  imprimirElemento<String>(123);
}
