import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'favorite.dart';
import 'home.dart';
import 'profile.dart';
import 'search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key ? key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainViews(),
    );
  }
}

class MainViews extends StatefulWidget {

  const MainViews({ Key ? key, }): super(key: key);
  @override
  State < MainViews > createState() => _MainViewsState();
}

class _MainViewsState extends State < MainViews > {

  var _bottomNavIndex = 0;

  List < Color > backgroundColors = const [
    Color(0xff1B1A43),
    Color.fromARGB(255, 63, 62, 132),
    Color.fromARGB(255, 25, 22, 220),
    Color.fromARGB(255, 93, 9, 230)
  ];

  List < Widget > pages = const [
    Home(),
    Search(),
    Favorite(),
    Profile()
  ];  

  List < IconData > iconList =  [
    Icons.home_rounded,
    Icons.search,
    Icons.favorite,
    Icons.person,
  ];      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors[_bottomNavIndex],
      body: pages[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4B5DFC),
        child: const Center(
          child: Icon(
            Icons.add
          ),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex:_bottomNavIndex,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        backgroundColor: const Color(0xff1D0E2F),
        inactiveColor: Colors.white,
        activeColor: const Color(0xffD523A3),
        gapLocation: GapLocation.center,
      ),            
    );
  }
}
