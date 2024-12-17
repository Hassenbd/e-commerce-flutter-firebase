import 'package:flutter/material.dart';

class Adminmode extends ChangeNotifier{
  bool isAdmin = false;
  changeStatu(value) {
    isAdmin = value;
    notifyListeners();
  }
}
