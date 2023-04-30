import 'package:food_app/model/state/user_state.dart';

class LogIn {
  final Map<String, dynamic> data;
  LogIn({required this.data});
}

class LoginSuccessful {
  final UserState userState;

  LoginSuccessful({required this.userState});
}

class LogOut {}

class LogoutSuccessful {}
