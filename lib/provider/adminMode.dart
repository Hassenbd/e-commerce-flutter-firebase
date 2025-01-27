import 'package:flutter/material.dart';

class AdminMode extends ChangeNotifier{
  bool isAdmin = false;
  changeStatu(value) {
    isAdmin = value;
    notifyListeners();
  }
}
