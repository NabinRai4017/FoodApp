import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:food_app/action/user_action.dart';
import 'package:food_app/model/state/app_state.dart';
import 'package:food_app/validation/email_validation.dart';
import 'package:food_app/validation/password_validation.dart';
// ignore: depend_on_referenced_packages
import 'package:redux/redux.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with EmailValidation, PasswordValidation {
  String? _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          return Scaffold(
            floatingActionButton: vm.isLoggedIn
                ? FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Help?',
                    child: const Icon(Icons.chat),
                  )
                : null,
            body: vm.isLoggedIn
                ? const Center(
                    child: Text('Logged in'),
                  )
                : Form(
                    key: _formKey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (input) {
                              return validateEmail(input);
                            },
                            onSaved: (input) => _email = input,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              // icon: Icon(Icons.email),
                              // hintText: 'johndoe@example.com'
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (input) {
                              return validatePassword(input);
                            },
                            onSaved: (input) => _password = input,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              // icon: Icon(Icons.password),
                              // hintText: 'Password'
                            ),
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
  final bool isLoggedIn;
  _ViewModel({required this.isLoggedIn, required this.onPressedCallback});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        isLoggedIn: store.state.isLoggedIn,
        onPressedCallback: (email, password) {
          Map<String, String> data = {
            "email": email,
            "password": password,
          };
          store.dispatch(LogIn(data: data));
        });
  }
}
