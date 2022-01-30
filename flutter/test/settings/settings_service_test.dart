/*
 * Copyright (c) 2022 Virginia Tech Transportation Institute.  All rights reserved.
 */

import 'package:flashcard_amigo/src/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('SettingsService can get the theme', () async {
    SharedPreferences.setMockInitialValues({SettingsService.themeModeKey: 'dark'});

    final service = SettingsService();
    expect(await service.themeMode(), ThemeMode.dark);
  });

  test('SettingsService returns ThemeMode.system by default', () async {
    SharedPreferences.setMockInitialValues({});

    final service = SettingsService();
    expect(await service.themeMode(), ThemeMode.system);
  });

  test('SettingsService returns ThemeMode.system when invalid value was persisted', () async {
    SharedPreferences.setMockInitialValues({SettingsService.themeModeKey: 'garbage'});

    final service = SettingsService();
    expect(await service.themeMode(), ThemeMode.system);
  });

  test('SettingsService can persist a new value', () async {
    SharedPreferences.setMockInitialValues({SettingsService.themeModeKey: 'system'});

    final service = SettingsService();
    expect(await service.themeMode(), ThemeMode.system);

    await service.updateThemeMode(ThemeMode.dark);
    expect(await service.themeMode(), ThemeMode.dark);
  });
}
