import 'package:flutter/material.dart';
import 'package:food_app/action/language_action.dart';
import 'package:food_app/model/state/app_state.dart';
import 'package:food_app/model/state/language_state.dart';
import 'package:food_app/utils/language_code.dart';
import 'package:food_app/utils/language_pref.dart';
import 'package:redux/redux.dart';

enum Language { english, nepali }

class LanguageChoice extends StatefulWidget {
  final Store<AppState>? store;

  const LanguageChoice({super.key, this.store});

  @override
  State<LanguageChoice> createState() => _LanguageChoiceState();
}

class _LanguageChoiceState extends State<LanguageChoice> {
  Language language = Language.english;

  @override
  void initState() {
    super.initState();
    language = _setLanguage(widget.store);
  }

  Language _setLanguage(Store<AppState>? store) {
    if (store?.state.languageState.locale == const Locale('ne')) {
      return Language.nepali;
    }
    return Language.english;
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Language>(
      segments: const <ButtonSegment<Language>>[
        ButtonSegment<Language>(
          value: Language.english,
          label: Text('English'),
        ),
        ButtonSegment<Language>(
          value: Language.nepali,
          label: Text('नेपाली'),
        )
      ],
      selected: <Language>{language},
      onSelectionChanged: (Set<Language> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          language = newSelection.first;
          switch (language) {
            case Language.english:
              widget.store?.dispatch(UpdateLanguage(
                  languageState: LanguageState(
                      locale: const Locale(LangaugeCode.english))));
              LanguagePrefs.setLangauge(LangaugeCode.english);
              break;
            case Language.nepali:
              widget.store?.dispatch(UpdateLanguage(
                  languageState: LanguageState(
                      locale: const Locale(LangaugeCode.nepali))));
              LanguagePrefs.setLangauge(LangaugeCode.nepali);
              break;
          }
        });
      },
    );
  }
}
