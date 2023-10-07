import 'package:flutter/material.dart';
import 'package:waterapp/themeChanger/mode.dart';

class themeChanger with ChangeNotifier {
  ThemeData _defaultTheme = lightmode;
  ThemeData get defaultTheme => _defaultTheme;
  set defaultTheme(ThemeData defaultTheme) {
    _defaultTheme = defaultTheme;
    notifyListeners();
  }

  void toggle() {
    if (_defaultTheme == lightmode) {
      defaultTheme = darkmode;
    } else {
      defaultTheme = lightmode;
    }
    notifyListeners();
  }
}
