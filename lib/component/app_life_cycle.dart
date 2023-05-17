import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:food_app/middleware/user_middleware.dart';
import 'package:food_app/model/state/app_state.dart';
import 'package:food_app/reducer/app_reducer.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux/redux.dart';

class AppLifeCycle extends StatefulWidget {
  const AppLifeCycle({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<AppLifeCycle> createState() => _AppLifeCycleState();
}

class _AppLifeCycleState extends State<AppLifeCycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (kDebugMode) {
      print('AppLifecycleState: $state');
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      middleware: [
        ...createUserMiddleware(),
        //  ...createErrorMiddleware(),
        thunkMiddleware,
        LoggingMiddleware.printer()
      ],
    );

    return StoreProvider(store: store, child: widget.child);
  }
}
