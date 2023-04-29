import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      shadowColor: Colors.transparent,
      titleTextStyle: const TextStyle(color: Colors.grey),
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        color: Colors.grey[700],
        tooltip: 'Menu Icon',
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          color: Colors.grey[700],
          tooltip: 'Show notification',
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
