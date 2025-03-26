import 'package:flutter/material.dart';
import 'package:tradutor/viewmodels/language_selected_viewmodel.dart';

class SelectLanguageWidget extends StatelessWidget {
  const SelectLanguageWidget(
      {super.key, required this.languageSelectedViewmodel});

  final LanguageSelectedViewmodel languageSelectedViewmodel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 100,
            child: Text(
                languageSelectedViewmodel.fromLanguage[0].toUpperCase() +
                    languageSelectedViewmodel.fromLanguage.substring(1))),
        SizedBox(
          width: 100,
          child: IconButton(
              onPressed: languageSelectedViewmodel.changeLangue,
              icon: const Icon(Icons.transfer_within_a_station)),
        ),
        SizedBox(
            width: 100,
            child: Text(languageSelectedViewmodel.toLanguage[0].toUpperCase() +
                languageSelectedViewmodel.toLanguage.substring(1)))
      ],
    );
  }
}
