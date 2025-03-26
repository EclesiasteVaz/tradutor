import 'package:flutter/material.dart';
import 'package:tradutor/core/services/translate_service.dart';
import 'package:tradutor/viewmodels/language_selected_viewmodel.dart';
import 'package:tradutor/widgets/select_language_widget.dart';

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
    final text = await _translateService.translate(
        _fromLanguageController.text.trim(),
        fromLanguage: languageSelectedViewmodel.fromLanguage,
        toLanguage: languageSelectedViewmodel.toLanguage);
    _toLanguageController.text = text;
    setState(() {
      isLoading = false;
    });
  }
}
