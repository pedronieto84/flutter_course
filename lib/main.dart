import 'package:flutter/material.dart';
import 'pages/pagina_containers.dart';
import 'pages/pagina_column_row.dart';
import 'pages/pagina_stack.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Ejemplo de Layouts', home: MenuNavegacion());
  }
}

class MenuNavegacion extends StatefulWidget {
  @override
  _MenuNavegacionState createState() => _MenuNavegacionState();
}

class _MenuNavegacionState extends State<MenuNavegacion> {
  int _paginaActual = 0;

  final List<Widget> _paginas = const [
    PaginaContainers(),
    PaginaColumnRow(),
    PaginaStack(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _paginaActual, children: _paginas),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _paginaActual,
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.crop_square),
            label: 'Containers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_column),
            label: 'Column/Row',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Stack'),
        ],
      ),
    );
  }
}
