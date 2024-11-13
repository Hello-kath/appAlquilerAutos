import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Perfil'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen de Perfil
            CircleAvatar(
              radius: 50,
              backgroundImage: const AssetImage('assets/images/profile.jpg'), // imagen de perfil
              backgroundColor: Colors.orange.shade100,
            ),
            const SizedBox(height: 20),
            // Nombre de usuario
            const Text(
              'kathe', 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Usuario desde enero 2023', 
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),

            // Opciones del perfil
            ListTile(
              leading: const Icon(Icons.email, color: Colors.orange),
              title: const Text('Correo electrónico'),
              subtitle: const Text('katherinevasquez.com'),
              onTap: () {
                //  editar el correo
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.orange),
              title: const Text('Teléfono'),
              subtitle: const Text('+1 234 567 890'),
              onTap: () {
                // editar el teléfono
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.orange),
              title: const Text('Dirección'),
              subtitle: const Text('Urbanizacion los Robles 123, Popayan, Colombia'), 
              onTap: () {
                //  editar la dirección
              },
            ),
            const Divider(),

            // Botón para cerrar sesión
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Acción al tocar el botón (cerrar sesión o navegar a otra pantalla)
                Navigator.pop(context); // cierre de sesión aquí
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Cerrar sesión',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
