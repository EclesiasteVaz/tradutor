import 'package:flutter/material.dart';
import 'package:tradutor/core/config.dart';

class DialogSelectLanguage extends StatefulWidget {
  const DialogSelectLanguage({
    super.key,
    required this.currentLanguage,
    required this.changeCurrentLanguage,
  });
  final String currentLanguage;
  final Function(String) changeCurrentLanguage;

  @override
  State<DialogSelectLanguage> createState() => _DialogSelectLanguageState();
}

class _DialogSelectLanguageState extends State<DialogSelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: [
              Text(
                "Selecione a língua",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (languages[index] == widget.currentLanguage) {
                      return Container();
                    }
                    return ListTile(
                      title: Text(languages[index]),
                      onTap: () {
                        widget.changeCurrentLanguage(languages[index]);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  itemCount: languages.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
