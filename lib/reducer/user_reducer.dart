import 'package:food_app/action/user_action.dart';
import 'package:food_app/model/state/user_state.dart';
// ignore: depend_on_referenced_packages
import 'package:redux/redux.dart';

final userReducer = combineReducers<UserState?>([
  TypedReducer<UserState?, LoginSuccessful>(_logIn),
  TypedReducer<UserState?, LogOut>(_logOut),
]);

UserState _logIn(UserState? loginState, action) {
  return action.userState;
}

UserState? _logOut(UserState? loginState, action) {
  return null;
}
