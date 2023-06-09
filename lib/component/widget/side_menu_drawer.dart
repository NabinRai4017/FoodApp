import 'package:flutter/material.dart';
import 'package:food_app/component/screen/setting_screen.dart';

class SideMenuDrawer extends StatelessWidget {
  const SideMenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/cover.jpg'))),
              child: Text(
                'Side menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => {
                    Navigator.of(context).pop(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingScreen()),
                    )
                  }),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
