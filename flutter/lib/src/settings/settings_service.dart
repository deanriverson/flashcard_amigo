import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
class SettingsService {
  static const themeModeKey = 'themeMode';

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    try {
      final themeName = await _prefString(themeModeKey, withDefault: 'system');
      return ThemeMode.values.byName(themeName);
    } on ArgumentError {
      return ThemeMode.system;
    }
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    (await _prefs).setString(themeModeKey, theme.name);
  }

  Future<String> _prefString(String key, {String withDefault = ''}) async {
    try {
      return (await _prefs).getString(key) ?? withDefault;
    } catch (e) {
      return withDefault;
    }
  }
}
