import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_theme/app_theme.dart' as my_theme;

class AppThemeProvider extends ChangeNotifier {
  final String appTheme = "app_theme";
  SharedPreferences? _prefs;

  int _themeValue = 0;

  ThemeData get isDark => loadThemeFormMap();

  ThemeData loadThemeFormMap() {
    switch (_themeValue) {
      case 0:
        return my_theme.light;
      case 1:
        return my_theme.dark;
      case 2:
        return my_theme.orange;
      case 3:
        return my_theme.green;
      case 4:
        return my_theme.red;
      case 5:
        return my_theme.purple;
      default:
        return my_theme.light;
    }
  }

  AppThemeProvider() {
    _themeValue = 0;
    _loadFromPrefs();
  }

  int getSelectedTheme(){
    return _themeValue;
  }
  toggleTheme(int themeValue) {
    _themeValue = themeValue;
    _saveToPrefs(themeValue);
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) {
      return _prefs = await SharedPreferences.getInstance();
    }
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _themeValue = _prefs?.getInt(appTheme) ?? 0;
    notifyListeners();
  }

  _saveToPrefs(int themeValue) async {
    await _initPrefs();
    _prefs?.setInt(appTheme, themeValue);
  }
}
