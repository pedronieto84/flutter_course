import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comunicación entre Hermanos Bidireccional',
      home: Scaffold(
        appBar: AppBar(title: Text('Hermanos: Mensajes en ambas direcciones')),
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
  String mensajeA = 'Sin mensaje de B';
  String mensajeB = 'Sin mensaje de A';

  void actualizarDesdeA(String nuevoMensaje) {
    setState(() {
      mensajeB = nuevoMensaje;
    });
  }

  void actualizarDesdeB(String nuevoMensaje) {
    setState(() {
      mensajeA = nuevoMensaje;
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
            'Padre',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          HijoA(onEnviar: actualizarDesdeA, mensaje: mensajeA),
          SizedBox(height: 20),
          HijoB(onEnviar: actualizarDesdeB, mensaje: mensajeB),
        ],
      ),
    );
  }
}

class HijoA extends StatelessWidget {
  final void Function(String) onEnviar;
  final String mensaje;
  const HijoA({required this.onEnviar, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Hijo A',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => onEnviar('¡Mensaje de A para B!'),
            child: Text('Enviar a Hijo B'),
          ),
          SizedBox(height: 10),
          Text('Mensaje de B: $mensaje', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class HijoB extends StatelessWidget {
  final void Function(String) onEnviar;
  final String mensaje;
  const HijoB({required this.onEnviar, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        border: Border.all(color: Colors.purple, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Hijo B',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => onEnviar('¡Mensaje de B para A!'),
            child: Text('Enviar a Hijo A'),
          ),
          SizedBox(height: 10),
          Text('Mensaje de A: $mensaje', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
