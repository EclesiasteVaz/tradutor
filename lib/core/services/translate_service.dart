import 'dart:convert';

import 'package:tradutor/core/config.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class TranslateService {
  TranslateService() {
    Gemini.init(apiKey: "YOUR-API-KEY");
  }

  Future<String> translate(String text,
      {String fromLanguage = PORTUGUESE, String toLanguage = FRANCES}) async {
    if (text == text.toUpperCase()) {
      text = text.toLowerCase();
    }
    final result = await Gemini.instance.prompt(parts: [
      Part.text(
          """Oi tudo bem, preciso que traduzes esta frase vindo de do idioma $fromLanguage para $toLanguage, responde sem markdown, considere retornar um json do tipo {"text": "conteudo traduzido"}, sendo a frase: $text, caso a frase não se encontra neste idioma: $fromLanguage, retorna do jeito que esta, lembrando do modelo de json """)
    ]);
    if (result == null) {
      return text;
    }
    final re = result.content?.parts?[0] as TextPart;
    final data = jsonDecode(re.text);
    return data['text'];
  }
}
