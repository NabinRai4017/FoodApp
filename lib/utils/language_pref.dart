import 'package:food_app/utils/storage_service.dart';

class LanguageConst {
  static const String langaugeKey = 'SELECTED_LANGUAGE';
}

class LanguagePrefs {
  static Future<String> get selectedLanguage =>
      StorageService().read(LanguageConst.langaugeKey);

  static Future setLangauge(String value) =>
      StorageService().write(LanguageConst.langaugeKey, value);

  static Future<void> clear() async {
    await Future.wait(<Future>[
      setLangauge(''),
    ]);
  }
}
