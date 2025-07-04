import 'package:flutter/material.dart';
import 'pages/detail_page.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Navigation Example',
      home: HomePage(),
      routes: {DetailPage.routeName: (context) => DetailPage()},
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  void _navigateToDetail() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        DetailPage.routeName,
        arguments: _idController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter ID')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'Enter ID'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter an ID'
                    : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _navigateToDetail,
                child: Text('Go to Detail Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
