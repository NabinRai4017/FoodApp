import 'package:food_app/action/language_action.dart';
import 'package:food_app/model/state/language_state.dart';

LanguageState languageReducer(LanguageState state, dynamic action) {
  if (action is UpdateLanguage) {
    return action.languageState;
  } else {
    return state;
  }
}
