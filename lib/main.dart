import 'package:flutter/material.dart'; // Importa el paquete de widgets de Flutter
import 'package:firebase_core/firebase_core.dart'; // Importa la inicialización de Firebase
import 'package:firebase_auth/firebase_auth.dart'; // Importa la autenticación de Firebase
import 'package:cloud_firestore/cloud_firestore.dart'; // Importa Firestore
import 'package:image_picker/image_picker.dart'; // Importa el selector de imágenes
import 'package:firebase_storage/firebase_storage.dart'; // Importa el almacenamiento de Firebase
import 'dart:io'; // Importa para usar File

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
  XFile? _selectedImage; // Imagen seleccionada
  String? _uploadedImageUrl; // URL de la imagen subida

  // Función para seleccionar imagen desde la galería (solo selecciona, no sube)
  Future<void> _pickImage() async {
    final ImagePicker picker =
        ImagePicker(); // Crea una instancia del selector de imágenes
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    ); // Abre la galería y espera la selección
    if (image != null) {
      // Si el usuario seleccionó una imagen
      setState(() {
        _selectedImage = image; // Guarda la imagen seleccionada en el estado
      });
    }
  }



  // Función para registrar usuario con email, contraseña e imagen
  Future<void> registerUser() async {
    setState(() {
      isLoading = true; // Muestra el indicador de carga
      errorMessage = ''; // Limpia el mensaje de error
    });

    try {
      // 1. Crear usuario en Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email, // Email introducido por el usuario
            password: password, // Contraseña introducida por el usuario
          );

      // 2. Subir imagen a Firebase Storage (si hay imagen seleccionada)
      String? imageUrl; // Variable para guardar la URL de la imagen
      if (_selectedImage != null) {
        // Si el usuario seleccionó una imagen
        final storageRef = FirebaseStorage.instance.ref().child(
          'user_images/${userCredential.user!.uid}_${_selectedImage!.name}', // Ruta única usando UID y nombre
        );
        final uploadTask = storageRef.putData(
          await _selectedImage!.readAsBytes(), // Sube los bytes de la imagen
        );
        final snapshot = await uploadTask; // Espera a que termine la subida
        imageUrl = await snapshot.ref
            .getDownloadURL(); // Obtiene la URL de descarga
        setState(() {
          _uploadedImageUrl = imageUrl; // Guarda la URL subida en el estado
        });
      }

      // 3. Añadir usuario a Firestore con email y URL de imagen
      await FirebaseFirestore.instance
          .collection('users') // Selecciona la colección 'users'
          .doc(userCredential.user!.uid) // Usa el UID como ID del documento
          .set({
            'email': email, // Guarda el email del usuario
            'createdAt': FieldValue.serverTimestamp(), // Fecha de creación
            if (imageUrl != null)
              'imageUrl': imageUrl, // Si hay imagen, guarda la URL
          });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuario registrado correctamente'), // Mensaje de éxito
        ),
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString(); // Muestra el error en pantalla
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
              SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: Icon(Icons.photo),
                    label: Text('Seleccionar foto'),
                  ),
                  SizedBox(width: 10),
                  if (_selectedImage != null)
                    Text(_selectedImage!.name, style: TextStyle(fontSize: 12)),
                ],
              ),
              if (_selectedImage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image.file(
                    File(_selectedImage!.path),
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
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
