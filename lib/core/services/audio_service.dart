import 'package:flutter_tts/flutter_tts.dart';
import 'package:tradutor/models/translation.dart';

class AudioService {
  final flutterTts = FlutterTts();

  Future<void> play(Translation translation) async {
    await flutterTts.speak(translation.text);
    await flutterTts.setLanguage(translation.code);
    await flutterTts.stop();
  }
}
