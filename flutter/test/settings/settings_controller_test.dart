/*
 * Copyright (c) 2022 Virginia Tech Transportation Institute.  All rights reserved.
 */
import 'package:flashcard_amigo/src/app.dart';
import 'package:flashcard_amigo/src/settings/settings_controller.dart';
import 'package:flashcard_amigo/src/settings/settings_service.dart';
import 'package:flutter/src/material/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'settings_controller_test.mocks.dart';

@GenerateMocks([SettingsService])
void main() {
  late SettingsService _service;
  late SettingsController _controller;

  setUp(() async {
    _service = MockSettingsService();
    when(_service.themeMode()).thenAnswer((realInvocation) => Future.value(ThemeMode.system));

    _controller = SettingsController(_service);
    await _controller.loadSettings();
  });

  group('SettingsController.updateThemeMode should', () {
    test('store the value', () async {
      _controller.updateThemeMode(ThemeMode.dark);
      expect(_controller.themeMode, ThemeMode.dark);
    });

    test('inform the service of the value', () async {
      _controller.updateThemeMode(ThemeMode.dark);
      verify(_service.updateThemeMode(ThemeMode.dark));
    });

    testWidgets('inform the UI of the value', (tester) async {
      final myApp = MyApp(settingsController: _controller);

      final w = find.byType(MaterialApp);

      await tester.pumpWidget(myApp);
      expect(tester.widget<MaterialApp>(w).themeMode, ThemeMode.system);

      _controller.updateThemeMode(ThemeMode.dark);

      await tester.pumpWidget(myApp);
      expect(tester.widget<MaterialApp>(w).themeMode, ThemeMode.dark);
    });
  });
}
