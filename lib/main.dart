import 'package:autos/views/inicio_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Para borrar la etiqueta
      home: Inicio(), // Pantalla inicial
    
    );
  }
}
