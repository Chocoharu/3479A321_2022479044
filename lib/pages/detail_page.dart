import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';
import 'about_page.dart'; 

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, appData, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          appData.addAction('Acceso a la página de Detalle');
        });

        return Scaffold(
          appBar: AppBar(
            title: const Text('Detail Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'asset/icons/GameIcon.svg',
                  semanticsLabel: 'Acme Logo',
                  height: 100,
                ),
                const Text(
                  'Bienvenido a la página de Detail',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                Text(
                  'Contador: ${appData.counter}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutPage()),
                    );
                  },
                  child: const Text('Ir a About'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Regresar a Home'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}