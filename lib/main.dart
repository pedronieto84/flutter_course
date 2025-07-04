import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Formulario Simple', home: SimpleFormPage());
  }
}

class SimpleFormPage extends StatefulWidget {
  @override
  State<SimpleFormPage> createState() => _SimpleFormPageState();
}

class _SimpleFormPageState extends State<SimpleFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String? _sexo; // Variable para almacenar el sexo seleccionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulario Simple')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20), // Space between fields
                DropdownButtonFormField<String>(
                  value: _sexo,
                  decoration: InputDecoration(
                    labelText: 'Sexo',
                    border: OutlineInputBorder(),
                    hintText: 'No seleccionado',
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Hombre', child: Text('Hombre')),
                    DropdownMenuItem(value: 'Mujer', child: Text('Mujer')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _sexo = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Selecciona un sexo' : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
