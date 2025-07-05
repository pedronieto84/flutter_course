import 'package:flutter/material.dart';

class PaginaStack extends StatelessWidget {
  const PaginaStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(width: 180, height: 180, color: Colors.blue[100]),
          Container(width: 120, height: 120, color: Colors.blue[300]),
          Container(width: 60, height: 60, color: Colors.blue[900]),
          Text(
            'Stack Example',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
