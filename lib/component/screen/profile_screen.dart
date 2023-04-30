import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:food_app/action/user_action.dart';
import 'package:food_app/model/state/app_state.dart';
// ignore: depend_on_referenced_packages
import 'package:redux/redux.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          return Center(
            child: TextButton(
              onPressed: () {
                vm.onPressedCallback();
              },
              child: const Text("Login"),
            ),
          );
        });
  }
}

class _ViewModel {
  final Function onPressedCallback;
  _ViewModel({required this.onPressedCallback});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(onPressedCallback: () {
      store.dispatch(
          LogIn(data: {'email': 'johndoe@gmail.com', 'password': 'test@123'}));
    });
  }
}
