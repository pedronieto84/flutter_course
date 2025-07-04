import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextoDinamico(),
        ),
      ),
    );
  }
}

class TextoDinamico extends StatefulWidget {
  @override
  State<TextoDinamico> createState() => _TextoDinamicoState();
}

class _TextoDinamicoState extends State<TextoDinamico> {
  String mensaje = 'Hola Flutter';

  void cambiarTexto() {
    setState(() {
      mensaje = 'Has pulsado el botón';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          mensaje,
          style: const TextStyle(
            fontFamily: 'Arial',
            fontSize: 25,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: cambiarTexto,
          child: const Text('Cambiar texto'),
        ),
      ],
    );
  }
}