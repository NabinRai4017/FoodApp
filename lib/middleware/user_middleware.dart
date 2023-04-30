import 'package:flutter/foundation.dart';
import 'package:food_app/action/loading_action.dart';
import 'package:food_app/action/user_action.dart';
import 'package:food_app/model/state/user_state.dart';
import 'package:food_app/service/user_service.dart';
// ignore: depend_on_referenced_packages
import 'package:redux/redux.dart';
import 'dart:convert';
import '../model/state/app_state.dart';

List<Middleware<AppState>> createUserMiddleware(context) {
  final logIn = _createLogInMiddleware(context);
  final logOut = _createLogOutMiddleware();
  return [
    TypedMiddleware<AppState, LogIn>(logIn),
    TypedMiddleware<AppState, LogOut>(logOut),
  ];
}

Middleware<AppState> _createLogInMiddleware(context) {
  return (Store store, action, NextDispatcher next) async {
    if (action is LogIn) {
      try {
        store.dispatch(LoadingStart());
        var response = await loginUser(action.data);
        if (kDebugMode) {
          print("-----$response");
        }
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonData = jsonDecode(response.body.toString());
          if (kDebugMode) {
            print(jsonData);
          }
          UserState userState = UserState.fromJson(jsonData);
          store.dispatch(LoadingEnd());
          store.dispatch(LoginSuccessful(userState: userState));
        } else {
          store.dispatch(LoadingEnd());
          // ErrorState eState = ErrorState(
          //   title: 'Error',
          //   message: "",
          // );
          // store.dispatch(new CustomError(errorState: eState));
        }
      } catch (error) {
        store.dispatch(LoadingEnd());
        Map<String, dynamic> errorJson = jsonDecode(error.toString());
        if (kDebugMode) {
          print(errorJson);
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
        store.dispatch(LogoutSuccessful());
      } catch (error) {
        //store.dispatch(new LogOutFail(error));
      }
    }
  };
}
