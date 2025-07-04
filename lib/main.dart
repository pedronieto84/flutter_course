import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hola Flutter',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 15,
              color: Colors.red,
            ),
          ),
        ),
      ),
    ),
  );
}
