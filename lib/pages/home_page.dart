import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'detail_page.dart';
//import 'about_page.dart';

final logger = Logger();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}