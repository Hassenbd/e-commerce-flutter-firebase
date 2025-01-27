import 'package:flutter/foundation.dart';

class ModelHud extends ChangeNotifier {
  bool isLoading = false;

  changeisLoading(value) {
    isLoading = value;
    notifyListeners();
  }
}
