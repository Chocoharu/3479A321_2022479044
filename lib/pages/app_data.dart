import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  final List<String> _actions = [];

  int get counter => _counter;
  List<String> get actions => List.unmodifiable(_actions);

  void incrementCounter() {
    _counter++;
    _actions.add('Incrementado a $_counter');
    notifyListeners();
  }

  void decrementCounter() {
    if (_counter > 0) {
      _counter--;
      _actions.add('Decrementado a $_counter');
      notifyListeners();
    }
  }

  void resetCounter() {
    _counter = 0;
    _actions.add('Contador reiniciado');
    notifyListeners();
  }

  void logAction(String action) {
    _actions.add(action);
    notifyListeners();
  }
  void addAction(String action) {
    _actions.add(action);
    notifyListeners();
  }
}

