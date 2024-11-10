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
      debugShowCheckedModeBanner: false,//para borrar la etiqueta 
      home: Scaffold(
        body: Inicio(),
        
      ),
    );
  }
}