import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con una curva personalizada en la parte inferior
          ClipPath(
            clipper: CurvedBottomClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: const Color.fromARGB(255, 253, 244, 204),
            ),
          ),
          
          // Texto principal centrado y con estilos personalizados
          const Align(
            alignment: Alignment(0, -0.7), // Controla la posición (0 = centro, -1 = parte superior, 1 = parte inferior)
            child:Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 30, // Tamaño de fuente
                color: Colors.black,
                fontWeight: FontWeight.bold,
                
              ),
            ),
          ),
          
          // Imagen principal centrada
          Center(
            child: Image.asset(
              'assets/img/jeep.png',
              width: 430,
              height: 430,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}


// Clipper para crear la curva en la parte inferior
class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50); // Inicia el trazo en el borde izquierdo

    // Crea una curva que cubre casi el borde inferior
    path.quadraticBezierTo(
      size.width / 2, // Punto de control
      size.height + 50, // Altura para la curva
      size.width, // Punto final
      size.height - 50, // Borde derecho de la curva
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
