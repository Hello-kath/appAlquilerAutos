import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:autos/views/register_screen.dart';
import 'package:autos/views/login_screen.dart';

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

          // Barra superior con botones de navegación
          Positioned(
            top: 40, // Ajusta la altura de la barra superior
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botón de Iniciar sesión
                  MouseRegion(
                    onEnter: (_) =>
                        setState(() {}), // Cambia color al hacer hover
                    onExit: (_) => setState(() {}),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.orange, // Color de fondo por defecto
                        foregroundColor: Colors.white, // Color del texto
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      child: const Text('Iniciar sesión'),
                    ),
                  ),
                  // Botón de Registrarse
                  MouseRegion(
                    onEnter: (_) => setState(() {}),
                    onExit: (_) => setState(() {}),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Color de fondo
                        foregroundColor: Colors.white, // Color del texto
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      child: const Text('Registrarse'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Texto principal centrado y con estilos personalizados
          Align(
            alignment:
                const Alignment(0, -0.7), // Controla la posición de la columna
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Ajusta el tamaño de la columna a su contenido
              children: [
                Text(
                  '¿Necesitas un coche?',
                  style: GoogleFonts.luckiestGuy(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  'Tenemos las mejores opciones para ti.',
                  style: GoogleFonts.luckiestGuy(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          // Imagen principal centrada
          Center(
            child: Image.asset(
              'assets/img/jeep.png',
              width: 200, // Ajusta el tamaño de la imagen si es muy grande
              height: 200,
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
