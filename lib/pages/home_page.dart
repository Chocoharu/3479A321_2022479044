import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/about_page.dart';
import 'package:logger/logger.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'detail_page.dart';
//import 'about_page.dart';

final logger = Logger();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  @override
  State<MyHomePage> createState() {
    logger.i("State Created");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    logger.i("State Initated");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    logger.i("Change on Dependencies");
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    logger.i("Widget Updated");
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      logger.i("State and widget setted");
      super.setState(fn);
    } else {
      logger.w("State setted and widget doesn't setted");
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    logger.i("Widget removed");
  }

  @override
  void dispose() {
    logger.i("Widget removed permanently");
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    logger.i("reassemble() llamado, generalmente durante hot reload");
  }

  int _selectedIndex = 0;
  
  static const List<Widget> _widgetOptions = <Widget>[
    AboutPage(),

    DetailPage(),
    
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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
  Widget _getResultIcon(){
    if(_counter==5){
      return SvgPicture.asset(
        'asset/icons/Defeat.svg',
        semanticsLabel: 'Acme Logo',
        height: 100,
      );
    }else if(_counter >=10 )
    {
      return  SvgPicture.asset(
        'asset/icons/Victory.svg',
        semanticsLabel: 'Acme Logo',
        height: 100,
      );
    }else{
      return SvgPicture.asset(
        'asset/icons/GameIcon.svg',
        semanticsLabel: 'Acme Logo',
        height: 100,
      );
    }
  }

    @override
  Widget build(BuildContext context) {
    logger.i("MyHomePage is working!");
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
      body: Center(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPage(),
                          ),
                        );
                      },
                      child: const Text('Ir a Detalle'),
                      )
                  ],
                ),
                _widgetOptions[_selectedIndex],
              ],
            ),
          ),
          
        ),
        
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}