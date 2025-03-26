import 'package:flutter/material.dart';
import 'package:tradutor/core/config.dart';

class LanguageSelectedViewmodel extends ChangeNotifier {
  String _fromLanguage = PORTUGUESE;
  String _toLanguage = FRANCES;

  String get fromLanguage => _fromLanguage;
  String get toLanguage => _toLanguage;

  changeLangue() {
    final oldFromLanguage = _fromLanguage;
    final oldToLanguage = _toLanguage;

    _fromLanguage = oldToLanguage;
    _toLanguage = oldFromLanguage;
    notifyListeners();
  }
}
