import 'package:food_app/model/error.dart';
import 'package:food_app/model/state/user_state.dart';

class AppState {
  final bool isLoggedIn;
  final bool isLoading;
  final UserState? userState;
  final ErrorState? errorState;

  AppState(
      {required this.isLoggedIn,
      required this.isLoading,
      required this.userState,
      this.errorState});

  factory AppState.initial() {
    return AppState(isLoggedIn: false, isLoading: false, userState: null);
  }

  AppState copyWith() {
    return AppState(
        isLoggedIn: isLoggedIn,
        isLoading: isLoading,
        userState: userState,
        errorState: errorState);
  }

//
  @override
  String toString() {
    return '''
AppState{
  isLoggedIn: $isLoggedIn,
isLoading: $isLoading, 
userState: $userState,
errorState: $errorState}''';
  }
}
