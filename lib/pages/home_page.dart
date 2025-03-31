import 'package:flutter/material.dart';
import 'package:tradutor/core/config.dart';
import 'package:tradutor/core/services/audio_service.dart';
import 'package:tradutor/core/services/translate_service.dart';
import 'package:tradutor/models/translation.dart';
import 'package:tradutor/viewmodels/language_selected_viewmodel.dart';
import 'package:tradutor/widgets/select_language_widget.dart';
import 'package:flutter_tts/flutter_tts.dart' as tts;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final languageSelectedViewmodel = LanguageSelectedViewmodel();
  final _fromLanguageController = TextEditingController();
  final _toLanguageController = TextEditingController();
  final _translateService = TranslateService();
  bool isLoading = false;
  final _audioService = AudioService();
  Translation? lastTranslation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tradutor "),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                maxLines: 4,
                controller: _fromLanguageController,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Insere aqui",
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 20),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              ListenableBuilder(
                  listenable: languageSelectedViewmodel,
                  builder: (context, _) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: SelectLanguageWidget(
                        languageSelectedViewmodel: languageSelectedViewmodel,
                      ),
                    );
                  }),
              TextField(
                maxLines: 4,
                controller: _toLanguageController,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (lastTranslation != null && !isLoading)
                IconButton(
                  onPressed: () async {
                    if (_toLanguageController.text.isNotEmpty) {
                      await speak(lastTranslation!);
                    }
                  },
                  icon: const Icon(Icons.mic_rounded),
                )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 150,
        height: 45,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.inversePrimary),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)))),
          onPressed: _translate,
          child: isLoading
              ? const SizedBox(
                  width: 16, height: 16, child: CircularProgressIndicator())
              : const Text("Traduzir"),
        ),
      ),
    );
  }

  Future<void> _translate() async {
    setState(() {
      isLoading = true;
    });

    final translation = await _translateService.translate(
        _fromLanguageController.text.trim(),
        fromLanguage: languageSelectedViewmodel.fromLanguage,
        toLanguage: languageSelectedViewmodel.toLanguage);
    if (translation != null) {
      _toLanguageController.text = translation.text;
      speak(translation);
    }
    if (mounted) {
      setState(() {
        isLoading = false;
        lastTranslation = translation;
      });
    }
  }

  Future<void> speak(Translation translation) async {
    return _audioService.play(translation);
  }
}
