import 'package:flutter/material.dart'; // Importa el paquete de widgets de Flutter
import 'package:firebase_core/firebase_core.dart'; // Importa la inicialización de Firebase
import 'package:firebase_auth/firebase_auth.dart'; // Importa la autenticación de Firebase
import 'package:cloud_firestore/cloud_firestore.dart'; // Importa Firestore

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegura la inicialización de Flutter antes de usar plugins
  await Firebase.initializeApp(); // Inicializa Firebase
  runApp(MyApp()); // Lanza la app principal
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register', // Título de la app
      home: RegisterScreen(), // Pantalla principal
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState(); // Crea el estado
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  String email = ''; // Variable para el email
  String password = ''; // Variable para la contraseña
  String errorMessage = ''; // Mensaje de error
  bool isLoading = false; // Indicador de carga

  Future<void> registerUser() async {
    setState(() {
      isLoading = true; // Muestra el indicador de carga
      errorMessage = ''; // Limpia el mensaje de error
    });

    try {
      // 1. Crear usuario en Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email, // Email introducido
            password: password, // Contraseña introducida
          );

      // 2. Añadir usuario a Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
            'email': email, // Guarda el email
            'createdAt': FieldValue.serverTimestamp(), // Fecha de creación
          });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuario registrado correctamente'),
        ), // Muestra mensaje de éxito
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString(); // Muestra el error
      });
    } finally {
      setState(() {
        isLoading = false; // Oculta el indicador de carga
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'), // Título de la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ), // Espaciado alrededor del formulario
        child: Form(
          key: _formKey, // Asocia la clave al formulario
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ), // Campo de email
                onChanged: (val) => email = val, // Actualiza el email
                validator: (val) => val != null && val.contains('@')
                    ? null
                    : 'Introduce un email válido', // Valida el email
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ), // Campo de contraseña
                obscureText: true, // Oculta el texto
                onChanged: (val) => password = val, // Actualiza la contraseña
                validator: (val) => val != null && val.length >= 6
                    ? null
                    : 'Contraseña mínima de 6 caracteres', // Valida la contraseña
              ),
              SizedBox(height: 20), // Espacio vertical
              isLoading
                  ? CircularProgressIndicator() // Muestra indicador si está cargando
                  : ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          registerUser(); // Llama a la función de registro
                        }
                      },
                      child: Text('Registrarse'), // Texto del botón
                    ),
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ), // Espacio arriba del error
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  ), // Muestra el error
                ),
            ],
          ),
        ),
      ),
    );
  }
}
