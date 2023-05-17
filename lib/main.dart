// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:food_app/component/app_life_cycle.dart';
import 'package:food_app/component/screen/home_screen.dart';
import 'package:food_app/middleware/user_middleware.dart';
import 'package:food_app/reducer/app_reducer.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'model/state/app_state.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

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

    return StoreProvider(
        store: store,
        child: const AppLifeCycle(
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  // AppRoutes.home: (context) => HomeScreen(),
                  // AppRoutes.register: (context) => RegisterScreen(),
                  // AppRoutes.login: (context) => LoginScreen(),
                },
                home: HomeScreen())));
  }
}
