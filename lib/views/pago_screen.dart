import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final String carritoNombre;
  final String precio;

  const PaymentScreen({super.key, required this.carritoNombre, required this.precio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Medio de Pago'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Card del carrito seleccionado
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.orange.shade100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Icon(Icons.directions_car, size: 50, color: Colors.orange),
                    const SizedBox(height: 10),
                    Text(
                      carritoNombre, // Nombre del carrito
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      precio, // Precio del carrito
                      style: const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ListTile para los métodos de pago
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.credit_card, color: Colors.white),
                    title: const Text(
                      'Tarjeta de Crédito o Débito',
                      style: TextStyle(color: Colors.white),
                    ),
                    tileColor: Colors.blue.shade200,
                    onTap: () {
                      // Acción al seleccionar Tarjeta de Crédito
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _buildDialog(context, 'Tarjeta de Crédito o Débito');
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.wallet_giftcard, color: Colors.white),
                    title: const Text(
                      'PayPal',
                      style: TextStyle(color: Colors.white),
                    ),
                    tileColor: Colors.blue.shade300,
                    onTap: () {
                      // Acción al seleccionar PayPal
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _buildDialog(context, 'PayPal');
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.account_balance, color: Colors.white),
                    title: const Text(
                      'Transferencia Bancaria',
                      style: TextStyle(color: Colors.white),
                    ),
                    tileColor: Colors.green.shade300,
                    onTap: () {
                      // Acción al seleccionar Transferencia Bancaria
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _buildDialog(context, 'Transferencia Bancaria');
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Diálogo que se muestra al seleccionar un método de pago
  Widget _buildDialog(BuildContext context, String paymentMethod) {
    return AlertDialog(
      title: const Text('Confirmación de Pago'),
      content: Text('Has seleccionado $paymentMethod para el pago.'),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Confirmar'),
          onPressed: () {
            // lógica de pago
            Navigator.of(context).pop();
            // Mostrar un mensaje o redirigir a otra pantalla
          },
        ),
      ],
    );
  }
}
