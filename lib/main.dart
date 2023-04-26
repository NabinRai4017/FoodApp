import 'package:flutter/material.dart';
import 'package:food_app/component/screen/splash.dart';
import 'package:food_app/reducer/app_reducer.dart';
import 'model/state/app_state.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(const FoodApp());

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      middleware: [
        // ...createAuthMiddleware(context),
        // ...createErrorMiddleware(),
        LoggingMiddleware.printer()
      ],
    );

    return StoreProvider(
        store: store,
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              // AppRoutes.home: (context) => HomeScreen(),
              // AppRoutes.register: (context) => RegisterScreen(),
              // AppRoutes.login: (context) => LoginScreen(),
            },
            home: Splash()));
  }
}
