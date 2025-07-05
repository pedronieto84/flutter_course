import 'package:flutter/material.dart';


class MiBoton extends StatelessWidget {
  final String texto;

  MiBoton({required this.texto});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => print("Pulsado"),
      child: Text(texto),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(child: MiBoton(texto: 'Haz clic')),
    ),
  ));
}