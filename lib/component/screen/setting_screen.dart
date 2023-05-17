import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:food_app/utils/app_localizations.dart';
import 'package:redux/redux.dart';
import '../../model/state/app_state.dart';
import '../widget/language_choice_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          return Scaffold(
            appBar: AppBar(
              title: Text(localizations.translate('nav.settings')),
            ),
            body:
                ListView(padding: const EdgeInsets.all(20), children: <Widget>[
              Row(
                children: [
                  const Text('Language'),
                  const Spacer(),
                  LanguageChoice(
                    store: vm.store,
                  )
                ],
              )
            ]),
          );
        });
  }
}

class _ViewModel {
  final Store<AppState> store;
  _ViewModel({required this.store});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      store: store,
    );
  }
}
