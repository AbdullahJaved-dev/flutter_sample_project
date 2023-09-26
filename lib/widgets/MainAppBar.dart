import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: Colors.blue,
        ),
      ),
      title: Image.asset("images/splash.jpg"),
      centerTitle: true,
      actions: [
        TextButton(
            onPressed: () {},
            child: const Text(
              "My Account",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
