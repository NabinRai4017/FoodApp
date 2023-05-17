import 'package:flutter/material.dart';
import 'package:food_app/utils/app_localizations.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key, required this.onTapped, required this.selectedIndex})
      : super(key: key);

  final Function(int index) onTapped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

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
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: const SizedBox(
                    height: 38,
                    width: 38,
                    child: Icon(Icons.home),
                  ),
                  label: localizations.translate("tab.home")),
              BottomNavigationBarItem(
                  icon: const SizedBox(
                    height: 38,
                    width: 38,
                    child: Icon(Icons.local_offer),
                  ),
                  label: localizations.translate("tab.offer")),
              BottomNavigationBarItem(
                  icon: const SizedBox(
                    height: 38,
                    width: 38,
                    child: Icon(Icons.favorite),
                  ),
                  label: localizations.translate("tab.fav")),
              BottomNavigationBarItem(
                  icon: const SizedBox(
                    height: 38,
                    width: 38,
                    child: Icon(Icons.person),
                  ),
                  label: localizations.translate("tab.profile"))
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.grey[800],
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            onTap: onTapped,
          ),
        ),
      ),
    ));
  }
}
