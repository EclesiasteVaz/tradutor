import 'package:flutter/material.dart';
import 'package:tradutor/viewmodels/language_selected_viewmodel.dart';
import 'package:tradutor/widgets/dialogs/dialog_select_language.dart';

class SelectLanguageWidget extends StatefulWidget {
  const SelectLanguageWidget(
      {super.key, required this.languageSelectedViewmodel});

  final LanguageSelectedViewmodel languageSelectedViewmodel;

  @override
  State<SelectLanguageWidget> createState() => _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends State<SelectLanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).push(DialogRoute(
            context: context,
            builder: (context) => DialogSelectLanguage(
              currentLanguage: widget.languageSelectedViewmodel.fromLanguage,
              changeCurrentLanguage:
                  widget.languageSelectedViewmodel.changeFromLanguage,
            ),
          )),
          child: SizedBox(
              width: 100,
              child: Text(widget.languageSelectedViewmodel.fromLanguage)),
        ),
        SizedBox(
          width: 100,
          child: IconButton(
              onPressed: widget.languageSelectedViewmodel.alternLanguages,
              icon: const Icon(Icons.transfer_within_a_station)),
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(
            DialogRoute(
              context: context,
              builder: (context) => DialogSelectLanguage(
                currentLanguage: widget.languageSelectedViewmodel.toLanguage,
                changeCurrentLanguage:
                    widget.languageSelectedViewmodel.changeToLanguage,
              ),
            ),
          ),
          child: SizedBox(
            width: 100,
            child: Text(
              widget.languageSelectedViewmodel.toLanguage,
              textDirection: TextDirection.rtl,
            ),
          ),
        )
      ],
    );
  }
}
