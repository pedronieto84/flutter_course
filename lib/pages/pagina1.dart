import 'package:flutter/material.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1() ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pagina 1',
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }
}
