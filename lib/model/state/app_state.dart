import 'package:food_app/model/error.dart';
import 'package:food_app/model/state/user_state.dart';

class AppState {
  final bool isLoading;
  final UserState? userState;
  final ErrorState? errorState;

  AppState({required this.isLoading, required this.userState, this.errorState});

  factory AppState.initial() =>
      AppState(isLoading: false, userState: null, errorState: null);

  AppState copyWith() {
    return AppState(
        isLoading: isLoading, userState: userState, errorState: errorState);
  }

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, userState: $userState,errorState: $errorState}';
  }
}
