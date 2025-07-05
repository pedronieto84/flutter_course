import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo Padre-Hijo',
      home: Scaffold(
        appBar: AppBar(title: Text('Padre e Hijo')),
        body: Center(child: Padre()),
      ),
    );
  }
}

class Padre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String mensaje = '¡Hola desde el padre!';
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        border: Border.all(color: Colors.blue, width: 3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Componente Padre',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Hijo(texto: mensaje),
        ],
      ),
    );
  }
}

class Hijo extends StatelessWidget {
  final String texto;
  const Hijo({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        border: Border.all(color: Colors.deepOrange, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Componente Hijo',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          Text(texto, style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

// Para mostrar el ejemplo en la app, puedes usar Padre() como una de las páginas del menú o como body principal.
