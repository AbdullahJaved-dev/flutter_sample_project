import 'package:flutter/material.dart';
import 'package:flutter_sample_project/screens/ContactUsScreen.dart';
import 'package:flutter_sample_project/screens/FAQScreen.dart';
import 'package:flutter_sample_project/screens/HomeScreen.dart';
import 'package:flutter_sample_project/screens/SignInScreen.dart';
import 'package:flutter_sample_project/screens/TodayNewsScreen.dart';

import 'AboutPALScreen.dart';

final GlobalKey<NavigatorState> homeGlobalNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> newsNavigatorKey = GlobalKey<NavigatorState>();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab = 2;

  void _changeTab(int index) {
    if (index == _selectedTab) {
      if (index == 0) {
        homeGlobalNavigatorKey.currentState?.popUntil((route) => route.isFirst);
      } else if (index == 1) {
        newsNavigatorKey.currentState?.popUntil((route) => route.isFirst);
      } else if (index == 2) {
        globalNavigatorKey.currentState?.popUntil((route) => route.isFirst);
      }
    } else {
      _changeTab1(index);
    }
  }

  void _changeTab1(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.blue,
              ),
            );
          }),
          title: Image.asset(
            "images/log.jpg",
            height: 40,
            fit: BoxFit.fill,
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  "My Account",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
        body: IndexedStack(
          index: _selectedTab,
          children: [
            MaterialApp(
              navigatorKey: homeGlobalNavigatorKey,
              home: const SignInScreen(),
            ),
            MaterialApp(
              navigatorKey: newsNavigatorKey,
              home: const TodayNewsScreen(),
            ),
            MaterialApp(
              navigatorKey: globalNavigatorKey,
              home: const HomeScreen(),
            ),
          ],
        ),
        drawer: Drawer(
          shadowColor: Colors.yellowAccent,
          child: ListView(
            children: [
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  _changeTab1(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Today's News"),
                onTap: () {
                  _changeTab1(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('About PAL'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutPALScreen(),
                    ),
                  );
                },
              ), // Optional divider
              ListTile(
                title: const Text("User Say's"),
                onTap: () {
                  // Handle the logout action
                  Navigator.pop(context); // Close the drawer
                },
              ), // Optional divider
              ListTile(
                title: const Text("FAQ's"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FAQScreen(),
                    ),
                  );
                },
              ), // Optional divider
              ListTile(
                title: const Text("Monthly Return"),
                onTap: () {
                  // Handle the logout action
                  Navigator.pop(context); // Close the drawer
                },
              ), // Optional divider
              ListTile(
                title: const Text("Plan & Prices"),
                onTap: () {
                  // Handle the logout action
                  Navigator.pop(context); // Close the drawer
                },
              ), // Optional divider
              ListTile(
                title: const Text("Contact Us"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactUsScreen(),
                    ),
                  );
                  // Close the drawer
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          backgroundColor: Colors.white,
          selectedIconTheme:
          const IconThemeData(color: Colors.blue, size: 28),
          unselectedIconTheme:
          const IconThemeData(color: Colors.blue, size: 28),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontSize: 11),
          unselectedLabelStyle: const TextStyle(fontSize: 11),
          elevation: 4,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.notifications,
                  color: Color(0xFF1d55a1),
                  size: 26,
                ),
                label: "ID Signal".toUpperCase()),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "images/megaphone.png",
                  height: 26,
                  width: 26,
                ),
                label: "Today News".toUpperCase()),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.home,
                  color: Color(0xFF1d55a1),
                  size: 26,
                ),
                label: "Home".toUpperCase()),
          ],
        ),
      ),
    );
  }
}


/*AppBar(
leading: IconButton(
icon: const Icon(Icons.menu),
onPressed: () {},
),
title: const Text("Home"),
actions: [
IconButton(
icon: const Icon(Icons.shopping_cart),
onPressed: () {},
),
IconButton(
icon: const Icon(Icons.search),
onPressed: () {},
),
],
elevation: 4,
centerTitle: true,
backgroundColor: Colors.purple.shade500,
)*/
