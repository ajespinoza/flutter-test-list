

import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier{
  final List<String> _names = ["Brian", "Angel"];

  List<String> get names => _names;

  void addName(String name){
    _names.add(name);
    notifyListeners();
  }

  void deleteName(String name){
    _names.remove(name);
    notifyListeners();
  }
}