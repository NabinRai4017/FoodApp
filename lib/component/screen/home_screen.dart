import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/component/widget/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (kDebugMode) {
        print(_selectedIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food App'),
      ),
      body: const Center(child: Text('Home')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Help?',
        child: const Icon(Icons.chat),
      ),
      bottomNavigationBar:
          BottomNavBar(onTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}
