import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

Widget bottomNav() {
  return CurvedNavigationBar(
    index: 0,
    height: 60.0,
    items: const <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.fireplace, size: 30),
      Icon(Icons.add, size: 30),
      Icon(Icons.subscriptions, size: 30),
      Icon(Icons.mail, size: 30),
    ],
    color: Colors.yellow,
    buttonBackgroundColor: Colors.white,
    backgroundColor: Colors.transparent,
    animationCurve: Curves.easeInOut,
    animationDuration: const Duration(milliseconds: 600),
    onTap: (index) {},
    letIndexChange: (index) => true,
  );
}
