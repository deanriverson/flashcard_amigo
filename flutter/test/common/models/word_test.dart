import 'dart:convert';

import 'package:flashcard_amigo/common/models/word.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Word model should', () {
    const jsonStr = '''
      {
        "en": "Hello",
        "es": "Hola",
        "pos": "interjection",
        "tags": [],
        "cats": ["greeting"]
      }
    ''';

    test("be serializable from JSON", () {
      final expected = Word('Hello', 'Hola', 'interjection', [], ['greeting']);
      final actual = Word.fromJson(jsonDecode(jsonStr));
      expect(expected, actual);
    });
  });

  group('buildWordList should', () {
    const jsonStr = '''
    [
      {
        "en": "Hello",
        "es": "Hola",
        "pos": "interjection",
        "tags": [],
        "cats": ["greeting"]
      },
      {
        "en": "Yes",
        "es": "Si",
        "pos": "interjection",
        "tags": [],
        "cats": []
      },
      {
        "en": "No",
        "es": "No",
        "pos": "interjection",
        "tags": [],
        "cats": []
      }
    ]
    ''';
    test('return a list of Word objects', () {
      final words = buildWordList(jsonStr);

      expect(words.length, 3);
      ['Hello', 'Yes', 'No'].asMap().forEach((i, w) => expect(words[i].en, w));
    });
  });
}
