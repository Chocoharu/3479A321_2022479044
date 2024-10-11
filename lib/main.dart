import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/app_data.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

final logger = Logger();

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppData(),
      child: const MyApp(),
    ),);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
     logger.i("Logger is working!");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Choco Shake',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}




