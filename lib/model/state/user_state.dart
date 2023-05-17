import 'package:food_app/model/user.dart';

class UserState {
  User? user;
  String? key;
  UserState({this.user, this.key});

  factory UserState.fromJson(Map<String, dynamic> data) {
    final key = data['key'] as String;
    final user = User.fromJson(data['user']);
    return UserState(key: key, user: user);
  }

  UserState? initial() => null;

  @override
  String toString() {
    return 'UserState{user: $user, key: $key}';
  }
}
