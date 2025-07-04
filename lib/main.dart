import 'package:flutter/material.dart';

void main() {
  runApp(
    MiApp(),
  );
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hola Flutter'
          ),
        ),
      ),
    );
  }
}


