import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:food_app/component/screen/favourite_screen.dart';
import 'package:food_app/component/screen/offer_screen.dart';
import 'package:food_app/component/screen/popular_screen.dart';
import 'package:food_app/component/screen/profile_screen.dart';
import 'package:food_app/component/widget/bottom_nav_bar.dart';
import 'package:food_app/component/widget/main_app_bar.dart';
import 'package:food_app/component/widget/side_menu_drawer.dart';
import 'package:redux/redux.dart';
import '../../action/thunk/login_thunk_action.dart';
import '../../model/state/app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const PopularScreen(),
    const OfferScreen(),
    const FavouriteScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // if (kDebugMode) {
      //   print(_selectedIndex);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) => store.dispatch(loadLoginState()),
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          return Scaffold(
            appBar: const MainAppBar(title: "Food App"),
            drawer: const SideMenuDrawer(),
            body: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
            bottomNavigationBar: BottomNavBar(
                onTapped: _onItemTapped, selectedIndex: _selectedIndex),
          );
        });
  }
}

class _ViewModel {
  _ViewModel();

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel();
  }
}
