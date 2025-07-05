import 'package:flutter/material.dart';
import 'pages/pagina_containers.dart';
import 'pages/pagina_column_row.dart';
import 'pages/pagina_stack.dart';
import 'pages/pagina_gridview.dart';
import 'pages/pagina_table.dart';

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
    PaginaGridView(),
    PaginaTable(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 213, 234), // Fondo claro para toda la app
      body: IndexedStack(index: _paginaActual, children: _paginas),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple, // Fondo oscuro para el menú
        selectedItemColor: Colors.black, // Ítem seleccionado en ámbar
        unselectedItemColor:
            Colors.blueAccent, // Ítems no seleccionados en azul
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
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: 'GridView'),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Table',
          ),
        ],
      ),
    );
  }
}
