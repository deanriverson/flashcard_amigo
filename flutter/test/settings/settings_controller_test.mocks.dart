// Mocks generated by Mockito 5.0.17 from annotations
// in flashcard_amigo/test/settings/settings_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:flashcard_amigo/src/settings/settings_service.dart' as _i2;
import 'package:flutter/material.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [SettingsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettingsService extends _i1.Mock implements _i2.SettingsService {
  MockSettingsService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.ThemeMode> themeMode() =>
      (super.noSuchMethod(Invocation.method(#themeMode, []),
              returnValue: Future<_i4.ThemeMode>.value(_i4.ThemeMode.system))
          as _i3.Future<_i4.ThemeMode>);
  @override
  _i3.Future<void> updateThemeMode(_i4.ThemeMode? theme) =>
      (super.noSuchMethod(Invocation.method(#updateThemeMode, [theme]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}
