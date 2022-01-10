/*
 * Copyright (c) 2022 Virginia Tech Transportation Institute.  All rights reserved.
 */

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.freezed.dart';
part 'word.g.dart';

@freezed
class Word with _$Word {
  factory Word(
    String en,
    String es,
    String pos,
    List<String> tags,
    List<String> cats,
  ) = _Word;

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
}

List<Word> buildWordList(String json) {
  final jsonWords = jsonDecode(json) as List;
  return jsonWords.map((o) => Word.fromJson(o as Map<String, dynamic>)).toList();
}
