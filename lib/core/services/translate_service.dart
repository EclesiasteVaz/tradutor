import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:tradutor/core/config.dart';
import 'package:tradutor/models/translation.dart';

class TranslateService {
  TranslateService() {
    Gemini.init(apiKey: API_KEY);
  }

  Future<Translation?> translate(
    String text, {
    String fromLanguage = 'Português',
    String toLanguage = 'Francês',
  }) async {
    if (text == text.toUpperCase()) {
      text = text.toLowerCase();
    }
    try {
      final result = await Gemini.instance.prompt(parts: [
        Part.text(
            """Oi tudo bem, preciso que traduzes esta frase vindo do idioma $fromLanguage para $toLanguage, responde sem markdown, considere retornar um json do tipo {"text": "conteudo traduzido", "language" : "A língua em que foi traduzida", "code": "o código locale, exemplo: pt-BR, etc.., baseando-se na lingua traduzida"}, sendo a frase: $text, caso a frase não se encontra neste idioma: $fromLanguage, retorna do jeito que esta, lembrando do modelo de json, """)
      ]);

      if (result == null) {
        debugPrint("error: gemini returns null value");
        return null;
      }
      final re = result.content?.parts?[0] as TextPart;
      debugPrint(re.text.toString());
      final data =
          jsonDecode(re.text.replaceAll("json", '').replaceAll('```', ''));
      debugPrint("Tradução feita pelo gemini" + data.toString());
      return compute(Translation.fromMap, data as Map<String, dynamic>);
    } catch (e) {
      debugPrint("error: ocorred a exception $e");
      return null;
    }
  }
}
