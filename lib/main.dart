import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Demo Debug', home: DebugDemoScreen());
  }
}

class DebugDemoScreen extends StatefulWidget {
  @override
  State<DebugDemoScreen> createState() => _DebugDemoScreenState();
}

class _DebugDemoScreenState extends State<DebugDemoScreen> {
  int _counter = 0;
  int actualTime = DateTime.now().millisecondsSinceEpoch;
  

  void _incrementCounter() {
    setState(() {
      _counter++;

    });
    actualTime = DateTime.now().millisecondsSinceEpoch;
    // Este print es útil para ver el valor en la consola durante el debug
    print('El valor actual del contador es: $_counter');
    // Aquí puedes poner un breakpoint para ver cómo cambia el estado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Debug')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pulsa el botón para incrementar el contador:'),
            SizedBox(height: 16),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Incrementar'),
            ),
            SizedBox(height: 24),
            Text(
              'Abre el modo Debug y pon un breakpoint en la función _incrementCounter para ver cómo cambia el valor.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailFormScreen extends StatefulWidget {
  @override
  State<EmailFormScreen> createState() => _EmailFormScreenState();
}

class _EmailFormScreenState extends State<EmailFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _showEmailPopup(String email) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Email capturado'),
        content: Text(email),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulario Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val != null && val.contains('@')
                    ? null
                    : 'Introduce un email válido',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showEmailPopup(_emailController.text);
                  }
                },
                child: Text('Mostrar email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
