import 'package:flutter/foundation.dart';
import 'package:food_app/action/loading_action.dart';
import 'package:food_app/action/user_action.dart';
import 'package:food_app/model/state/user_state.dart';
import 'package:food_app/utils/user_pref.dart';
import 'package:food_app/service/user_service.dart';
// ignore: depend_on_referenced_packages
import 'package:redux/redux.dart';
import 'dart:convert';
import '../model/state/app_state.dart';

List<Middleware<AppState>> createUserMiddleware() {
  final logIn = _createLogInMiddleware();
  final logOut = _createLogOutMiddleware();
  return [
    TypedMiddleware<AppState, LogIn>(logIn),
    TypedMiddleware<AppState, LogOut>(logOut),
  ];
}

Middleware<AppState> _createLogInMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    if (action is LogIn) {
      try {
        store.dispatch(LoadingStart());
        var response = await loginUser(action.data);
        if (kDebugMode) {
          print("-----${response.toString()}");
        }
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonData = jsonDecode(response.body.toString());
          if (kDebugMode) {
            print("json data: ${jsonData.toString()}");
          }
          UserState userState = UserState.fromJson(jsonData);
          UserPrefs.saveUser(userState);
          store.dispatch(LoadingEnd());
          store.dispatch(LoginSuccessful(userState: userState));
          store.dispatch(UpdateLogin(isLoggedIn: true));
        } else {
          if (kDebugMode) {
            print("====${response.body}====");
          }
          store.dispatch(LoadingEnd());
          // ErrorState eState = ErrorState(
          //   title: 'Error',
          //   message: "",
          // );
          // store.dispatch(new CustomError(errorState: eState));
        }
      } catch (error) {
        store.dispatch(LoadingEnd());

        if (kDebugMode) {
          print(error);
        }

        // ErrorState eState = ErrorState(
        //   title: 'Error',
        //   message: errorJson.toString(),
        // );
        // store.dispatch(new CustomError(errorState: eState));
      }
    }
  };
}

Middleware<AppState> _createLogOutMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    if (action is LogOut) {
      try {
        UserPrefs.clear();
        store.dispatch(LogoutSuccessful());
      } catch (error) {
        //store.dispatch(new LogOutFail(error));
      }
    }
  };
}
