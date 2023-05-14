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
  String? _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Help?',
              child: const Icon(Icons.chat),
            ),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Please a valid email';
                        }
                        return null;
                      },
                      onSaved: (input) => _email = input,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Please a valid password';
                        }
                        return null;
                      },
                      onSaved: (input) => _password = input,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                        onPressed: () {
                          final formState = _formKey.currentState;
                          if (formState!.validate()) {
                            formState.save();
                            vm.onPressedCallback(_email!, _password!);
                          }
                        },
                        child: const Text("Login"))
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _ViewModel {
  final Function(String, String) onPressedCallback;
  _ViewModel({required this.onPressedCallback});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(onPressedCallback: (email, password) {
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
      };
      store.dispatch(LogIn(data: data));
    });
  }
}
