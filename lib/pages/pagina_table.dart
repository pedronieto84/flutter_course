import 'package:flutter/material.dart';

class PaginaTable extends StatelessWidget {
  const PaginaTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        border: TableBorder.all(color: Colors.blueGrey),
        children: [
          TableRow(
            children: [
              tableCell('Header 1', true),
              tableCell('Header 2', true),
              tableCell('Header 3', true),
            ],
          ),
          TableRow(
            children: [
              tableCell('Row 1, Col 1'),
              tableCell('Row 1, Col 2'),
              tableCell('Row 1, Col 3'),
            ],
          ),
          TableRow(
            children: [
              tableCell('Row 2, Col 1'),
              tableCell('Row 2, Col 2'),
              tableCell('Row 2, Col 3'),
            ],
          ),
        ],
      ),
    );
  }

  Widget tableCell(String text, [bool isHeader = false]) {
    return Container(
      padding: EdgeInsets.all(12),
      color: isHeader ? Colors.blue[100] : Colors.white,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
