// import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/action/language_action.dart';
import 'package:food_app/action/user_action.dart';
import 'package:food_app/model/state/language_state.dart';
import 'package:food_app/model/state/user_state.dart';
import 'package:food_app/model/user.dart';
import 'package:food_app/utils/language_code.dart';
import 'package:food_app/utils/user_pref.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../../utils/language_pref.dart';

ThunkAction loadInitialState() {
  return (Store store) async {
    final isLoggedIn = await UserPrefs.authenticated;
    // if (kDebugMode) {
    //   print('========================');
    //   print(isLoggedIn);
    // }
    if (isLoggedIn) {
      final key = await UserPrefs.userKey;
      final userId = await UserPrefs.userId;
      final email = await UserPrefs.email;
      final firstName = await UserPrefs.firstName;
      final lastName = await UserPrefs.lastName;
      final username = await UserPrefs.username;
      final user = User(
          id: userId,
          email: email,
          firstName: firstName,
          lastName: lastName,
          username: username);
      UserState userState = UserState(user: user, key: key);
      store.dispatch(LoginSuccessful(userState: userState));
      store.dispatch(UpdateLogin(isLoggedIn: isLoggedIn));
    }

    final langauge = await LanguagePrefs.selectedLanguage;
    if (kDebugMode) {
      print("============");
      print(langauge);
    }
    LanguageState languageState;
    if (langauge == '') {
      languageState = LanguageState(locale: const Locale(LangaugeCode.english));
    } else {
      languageState = LanguageState(locale: Locale(langauge));
    }
    store.dispatch(UpdateLanguage(languageState: languageState));
  };
}
