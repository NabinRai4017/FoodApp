import 'package:flutter/material.dart';

class LanguageState {
  final Locale locale;
  LanguageState({required this.locale});

  Locale get getLocale => locale;

  factory LanguageState.initial() => LanguageState(locale: const Locale('en'));

  @override
  String toString() {
    return '''
LanguageState{
  locale: $locale,

  }''';
  }
}
