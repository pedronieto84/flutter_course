import 'package:flutter/material.dart';

class PaginaColumnRow extends StatelessWidget {
  const PaginaColumnRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Column & Row Example',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.star, color: Colors.blue, size: 40),
              Icon(Icons.favorite, color: Colors.red, size: 40),
              Icon(Icons.thumb_up, color: Colors.green, size: 40),
            ],
          ),
        ],
      ),
    );
  }
}
