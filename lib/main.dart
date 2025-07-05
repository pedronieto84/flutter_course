import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo Hijo a Padre',
      home: Scaffold(
        appBar: AppBar(title: Text('Comunicación Hijo → Padre')),
        body: Center(child: Padre()),
      ),
    );
  }
}

class Padre extends StatefulWidget {
  @override
  State<Padre> createState() => _PadreState();
}

class _PadreState extends State<Padre> {
  String mensaje = 'Esperando mensaje del hijo...';

  void actualizarMensaje(String nuevoMensaje) {
    setState(() {
      mensaje = nuevoMensaje;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          Hijo(onMensaje: actualizarMensaje),
          SizedBox(height: 20),
          Text(
            mensaje,
            style: TextStyle(fontSize: 18, color: Colors.blue[900]),
          ),
        ],
      ),
    );
  }
}

class Hijo extends StatelessWidget {
  final void Function(String) onMensaje;
  const Hijo({required this.onMensaje});

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
          ElevatedButton(
            onPressed: () => onMensaje('¡Mensaje enviado del hijo al padre!'),
            child: Text('Enviar mensaje al padre'),
          ),
        ],
      ),
    );
  }
}
