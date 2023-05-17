import 'package:flutter/material.dart';
import 'package:food_app/component/app_life_cycle.dart';
import 'package:food_app/component/screen/parent_screen.dart';

void main() async {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppLifeCycle(child: ParentScreen());
  }
}
