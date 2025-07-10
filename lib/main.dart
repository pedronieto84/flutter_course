void main() {
  esperarYDecirHola();
}

Future<void> esperarYDecirHola() async {
  print('Esperando...');
  await Future.delayed(Duration(seconds: 2));
  print('¡Hola!');
}