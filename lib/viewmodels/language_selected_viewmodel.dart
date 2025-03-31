import 'package:flutter/material.dart';
import 'package:tradutor/core/config.dart';

class LanguageSelectedViewmodel extends ChangeNotifier {
  String _fromLanguage = languages.last;
  String _toLanguage = languages.first;

  String get fromLanguage => _fromLanguage;
  String get toLanguage => _toLanguage;

  changeFromLanguage(String language) {
    _fromLanguage = language;
    notifyListeners();
  }

  changeToLanguage(String language) {
    _toLanguage = language;
    notifyListeners();
  }

  alternLanguages() {
    final oldFromLanguage = _fromLanguage;
    final oldToLanguage = _toLanguage;

    _fromLanguage = oldToLanguage;
    _toLanguage = oldFromLanguage;
    notifyListeners();
  }
}
