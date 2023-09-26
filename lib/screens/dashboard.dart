import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Sample".toUpperCase(),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        width: 350,
        height: 250,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.pink, width: 2),
          image: const DecorationImage(
            image: AssetImage("images/view.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: IconButton(
          color: Colors.green,
          splashColor: Colors.grey.shade50,
          highlightColor: Colors.red.shade50,
          iconSize: 100.0,
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.person,
          ),
        ),
      ),
    );
  }
}
