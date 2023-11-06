import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  set setDarkMode(value) {
    _isDark = value;
    notifyListeners();
  }
}
