import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/about_page.dart';
import 'package:flutter_application_1/pages/audit_page.dart';
import 'package:flutter_application_1/pages/detail_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    logger.i("State Created");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    MainContentPage(),  
    const DetailPage(),       
    const AboutPage(),        
    const AuditPage(),        
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: _pages[_selectedIndex], 
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Pantalla Principal'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Detalle'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sobre'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context); 
              },
            ),
            ListTile(
              title: const Text('Auditoría'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainContentPage extends StatefulWidget {
  @override
  _MainContentPageState createState() => _MainContentPageState();
}

class _MainContentPageState extends State<MainContentPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  String _getResultMessage() {
    if (_counter >= 10) {
      return 'Victoria';
    } else if (_counter == 5) {
      return 'Derrota';
    } else {
      return 'Sigue jugando...';
    }
  }

  Widget _getResultIcon() {
    if (_counter == 5) {
      return SvgPicture.asset(
        'asset/icons/Defeat.svg',
        semanticsLabel: 'Icono de Derrota',
        height: 100,
      );
    } else if (_counter >= 10) {
      return SvgPicture.asset(
        'asset/icons/Victory.svg',
        semanticsLabel: 'Icono de Victoria',
        height: 100,
      );
    } else {
      return SvgPicture.asset(
        'asset/icons/GameIcon.svg',
        semanticsLabel: 'Icono del Juego',
        height: 100,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 20,
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _getResultIcon(),
              const SizedBox(height: 16.0),
              Text(
                'Resultado: ${_getResultMessage()}',
                style: const TextStyle(
                  fontFamily: 'Choco Shake',
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _resetCounter,
                    child: const Text('Reiniciar'),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: _decrementCounter,
                    child: const Text('-'),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Text('+'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
