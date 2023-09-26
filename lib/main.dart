import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample_project/screens/splash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white),
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Sample",
      color: Colors.white,
      home: SafeArea(child: Splash()),
    );
  }
}