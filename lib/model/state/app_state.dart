import 'package:food_app/model/error.dart';
import 'package:food_app/model/state/language_state.dart';
import 'package:food_app/model/state/user_state.dart';

class AppState {
  final bool isLoggedIn;
  final bool isLoading;
  final UserState? userState;
  final ErrorState? errorState;
  final LanguageState languageState;

  AppState(
      {required this.isLoggedIn,
      required this.isLoading,
      this.userState,
      this.errorState,
      required this.languageState});

  factory AppState.initial() {
    return AppState(
        isLoggedIn: false,
        isLoading: false,
        userState: null,
        languageState: LanguageState.initial());
  }

  AppState copyWith() {
    return AppState(
        isLoggedIn: isLoggedIn,
        isLoading: isLoading,
        userState: userState,
        errorState: errorState,
        languageState: languageState);
  }

//
  @override
  String toString() {
    return '''
AppState{
  isLoggedIn: $isLoggedIn,
  isLoading: $isLoading, 
  userState: $userState,
  errorState: $errorState,
  languageState: $languageState,
  }''';
  }
}
