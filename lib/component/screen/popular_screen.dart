import 'package:flutter/material.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image(image: AssetImage('assets/images/banner.jpg')),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: const [Text("Popular"), Spacer(), Text("View all")],
          ),
        ),
      ],
    );
  }
}
