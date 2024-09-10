import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sobre el desarrollador:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text(
              'Hola, soy Alvaro Chocobar '
              'Estudiante de videojuegos y probando Flutter por primera vez',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                logger.i("Botón de regreso presionado");
                Navigator.pop(context);
              },
              child: const Text('Regresar a Detail'),
            ),
          ],
        ),
      ),
    );
  }
}