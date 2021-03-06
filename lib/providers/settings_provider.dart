import 'package:flutter/material.dart';
import 'package:mediatrack_flutter/providers/configuration/configuration_provider.dart';

enum AppTheme { White, Dark, LightGreen, DarkGreen }

ConfigurationProvider configurationProvider = ConfigurationProvider();

/// Returns enum value name without enum class name.
String enumName(AppTheme anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final appThemeData = {
  AppTheme.White: ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Color(0xffeeeeee),
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
  ),
  AppTheme.LightGreen: ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightGreen,
    scaffoldBackgroundColor: Color(0xffeeeeee),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  AppTheme.DarkGreen: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green,
  )
};

class SettingsProvider with ChangeNotifier {
  ThemeData _themeData;
  String _userName = 'User';

  //Sets the user name for the user.
  setUserName(String userName) {
    if (userName != null) _userName = userName;

    //Here we notify the listeners that Username has changed.
    notifyListeners();
  }

  //Gets the previously saved username.
  getUserName() => _userName;

  /// Use this method on UI to get selected theme.
  ThemeData get themeData {
    if (_themeData == null) {
      _themeData = appThemeData[AppTheme.Dark];
    }
    return _themeData;
  }

  /// Sets theme and notifies listeners about change.
  setTheme(AppTheme theme) async {
    _themeData = appThemeData[theme];

    // Here we notify listeners that theme changed
    // so UI have to be rebuild
    notifyListeners();
  }
}
