// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pdp_flutter/pdp_screen.dart';

class NavItem {
  static const textStyle =
      TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'SF');
  static int selectedIndex = 0;
  static List<Widget> widgetOptions = <Widget>[
    Center(
      child: Text(
        'Home',
        style: textStyle,
      ),
    ),
    PdpScreen(),
    Center(
      child: Text(
        'Cart',
        style: textStyle,
      ),
    ),
  ];
}
