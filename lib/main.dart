import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(create: (_) => MensajeGlobal(), child: MiApp()),
);

class MensajeGlobal extends ChangeNotifier {
  String mensajeA = 'Sin mensaje de B';
  String mensajeB = 'Sin mensaje de A';

  void enviarDeA(String msg) {
    mensajeB = msg;
    notifyListeners();
  }

  void enviarDeB(String msg) {
    mensajeA = msg;
    notifyListeners();
  }
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider: Comunicación Global',
      home: Scaffold(
        appBar: AppBar(title: Text('Provider: Hermanos')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [HijoA(), SizedBox(height: 20), HijoB()],
          ),
        ),
      ),
    );
  }
}

class HijoA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final global = Provider.of<MensajeGlobal>(context);
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
            onPressed: () => global.enviarDeA('¡Mensaje de A para B!'),
            child: Text('Enviar a Hijo B'),
          ),
          SizedBox(height: 10),
          Text(
            'Mensaje de B: ${global.mensajeA}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class HijoB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final global = Provider.of<MensajeGlobal>(context);
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
            onPressed: () => global.enviarDeB('¡Mensaje de B para A!'),
            child: Text('Enviar a Hijo A'),
          ),
          SizedBox(height: 10),
          Text(
            'Mensaje de A: ${global.mensajeB}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
