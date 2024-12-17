import 'package:flutter/foundation.dart';

class Modelhud extends ChangeNotifier {
  bool isLoading = false;

  changeisLoading(value) {
    isLoading = value;
    notifyListeners();
  }
}
