import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  // Punto de entrada de la app, muestra la lista de Pokémons
  runApp(MaterialApp(home: ListaPokemons()));
}

// Widget principal con estado para mostrar la lista de Pokémons
class ListaPokemons extends StatefulWidget {
  @override
  _ListaPokemonsState createState() => _ListaPokemonsState();
}

class _ListaPokemonsState extends State<ListaPokemons> {
  // Lista donde se guardan los nombres de los Pokémons
  List<String> _pokemons = [];

  @override
  void initState() {
    super.initState();
    // Al iniciar el widget, carga los Pokémons desde la API
    _cargarPokemons();
  }

  // Función asíncrona para obtener los Pokémons desde la PokeAPI
  Future<void> _cargarPokemons() async {
    final url = Uri.parse(
      'https://pokeapi.co/api/v2/pokemon?limit=20',
    ); // URL de la API
    final respuesta = await http.get(url); // Realiza la petición HTTP

    if (respuesta.statusCode == 200) {
      // Si la respuesta es exitosa, decodifica el JSON
      final datos = json.decode(respuesta.body);
      final List resultados = datos['results'];

      setState(() {
        // Actualiza la lista de Pokémons con los nombres recibidos
        _pokemons = resultados.map((p) => p['name'] as String).toList();
      });
    } else {
      setState(() {
        // Si hay error, muestra un mensaje en la lista
        _pokemons = ['Error al cargar pokemons'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokémons')),
      body: _pokemons.isEmpty
          // Muestra un indicador de carga mientras se obtienen los datos
          ? Center(child: CircularProgressIndicator())
          // Muestra la lista de Pokémons
          : ListView.builder(
              itemCount: _pokemons.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_pokemons[index]));
              },
            ),
    );
  }
}
