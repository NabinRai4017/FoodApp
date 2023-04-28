import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key, required this.onTapped, required this.selectedIndex})
      : super(key: key);

  final Function(int index) onTapped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 38,
                    width: 38,
                    child: Icon(Icons.home),
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 38,
                    width: 38,
                    child: Icon(Icons.search),
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 38,
                    width: 38,
                    child: Icon(Icons.favorite),
                  ),
                  label: "Favorite"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 38,
                    width: 38,
                    child: Icon(Icons.person),
                  ),
                  label: "Profile")
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber[800],
            unselectedItemColor: Colors.grey[800],
            selectedFontSize: 12,
            onTap: onTapped,
          ),
        ),
      ),
    ));
  }
}
