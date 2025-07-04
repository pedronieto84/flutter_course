import 'package:flutter/material.dart';
import 'pages/pagina1.dart';
import 'pages/pagina2.dart';
import 'pages/pagina3.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MenuNavegacion());
  }
}

class MenuNavegacion extends StatefulWidget {
  @override
  _MenuNavegacionState createState() => _MenuNavegacionState();
}

class _MenuNavegacionState extends State<MenuNavegacion> {
  int _paginaActual = 0;

  final List<Widget> _paginas = const [Pagina1(), Pagina2(), Pagina3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _paginaActual, children: _paginas),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Cambia el color de fondo
        selectedItemColor: Colors.white, // Color del ítem seleccionado
        unselectedItemColor:
            Colors.white70, // Color de los ítems no seleccionados
        currentIndex: _paginaActual,
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: 'Página 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: 'Página 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3), 
            label: 'Página 3'),
        ],
      ),
    );
  }
}
