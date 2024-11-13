import 'package:flutter/material.dart';
import 'package:autos/views/info_screen.dart'; 
import 'package:autos/views/perfil_screen.dart'; 

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // Lista de imágenes de carritos
  final List<String> carImages = [
    'assets/img/carro.jpg',  // Ruta de la imagen local 1
    'assets/img/jeep.png',  // Ruta de la imagen local 2
    'assets/img/carro1.png',  // Ruta de la imagen local 3
    'assets/img/carro2.png',  // Ruta de la imagen local 4
    'assets/img/carro3.png',  // Ruta de la imagen local 5
    'assets/img/carro4.png',  // Ruta de la imagen local 6
    'assets/img/carro5.png',  // Ruta de la imagen local 7
    'assets/img/carro6.png',  // Ruta de la imagen local 8
    'assets/img/carro7.png',  // Ruta de la imagen local 9
    'assets/img/carro8.png',  // Ruta de la imagen local 10
    'assets/img/carro9.png',  // Ruta de la imagen local 11
     
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        backgroundColor:Colors.orange,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: SizedBox(
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.orange),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Perfil()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Menú',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Perfil()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,  //3 para 3 columnas
            crossAxisSpacing: 10,  // Espacio entre las columnas
            mainAxisSpacing: 10,  // Espacio entre las filas
          ),
          itemCount: carImages.length,  // Número de carritos disponibles
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const info()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: const Color.fromARGB(255, 244, 230, 181),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Reemplazar el ícono del carro por una imagen
                    Image.asset(
                      carImages[index],  // Ruta de la imagen 
                      height: 80,          // Ajusta el tamaño de la imagen
                      width: 80,           // Ajusta el tamaño de la imagen
                      fit: BoxFit.cover,   // Ajuste de la imagen
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Carrito ${index + 1}', // Texto con el índice
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const Text(
                      '\$100/día', // Precio de ejemplo
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const info()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Alquilar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


