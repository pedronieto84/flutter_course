import 'package:flutter/material.dart';

class PaginaContainers extends StatelessWidget {
  const PaginaContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.brown, width: 4),
        ),
        alignment: Alignment.center,
        child: Text(
          'Container Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
