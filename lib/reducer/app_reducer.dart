import 'package:food_app/model/state/app_state.dart';
import 'package:food_app/reducer/language_reducer.dart';
import 'package:food_app/reducer/loading_reducer.dart';
import 'package:food_app/reducer/user_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoggedIn: isLoggedInReducer(state.isLoggedIn, action),
    isLoading: loadingReducer(state.isLoading, action),
    userState: userReducer(
      state.userState,
      action,
    ),
    languageState: languageReducer(state.languageState, action),
  );
}
