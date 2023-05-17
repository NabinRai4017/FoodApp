import 'package:flutter/material.dart';
import 'package:food_app/action/thunk/initial_thunk_action.dart';
import 'package:food_app/component/screen/home_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_app/model/state/app_state.dart';
import 'package:food_app/utils/app_localizations.dart';
import 'package:food_app/utils/language_code.dart';
import 'package:redux/redux.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) => store.dispatch(loadInitialState()),
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          return MaterialApp(
              supportedLocales: const [
                Locale(LangaugeCode.english),
                Locale(LangaugeCode.nepali),
              ],
              locale: vm.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              routes: const {
                // AppRoutes.home: (context) => HomeScreen(),
                // AppRoutes.register: (context) => RegisterScreen(),
                // AppRoutes.login: (context) => LoginScreen(),
              },
              home: const HomeScreen());
        });
  }
}

class _ViewModel {
  final Locale locale;
  _ViewModel({required this.locale});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(locale: store.state.languageState.getLocale);
  }
}
