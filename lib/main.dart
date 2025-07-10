void main() async {
  await ejecutarTareaSegura();
}

Future<void> ejecutarTareaSegura() async {
  try {
    String resultado = await tareaQueFalla();
    print('Resultado: $resultado');
  } catch (error) {
    print('⚠️ Ocurrió un error: $error');
  }
}

Future<String> tareaQueFalla() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception('Algo salió mal...');
}
