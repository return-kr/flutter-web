// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_flutter/bottom_nav_item.dart';
import 'package:pdp_flutter/screen_query.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _onItemTapped(int index) {
    setState(() {
      NavItem.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenBreakpoint breakpoint = ScreenBreakpoint(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PDP Flutter',
          style: TextStyle(fontFamily: 'SF'),
        ),
      ),
      drawer: (breakpoint.isMobile == false)
          ? Drawer(
              elevation: 0,
              child: ListView(
                padding: EdgeInsets.all(8),
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.deepPurple,
                    ),
                    title: const Text('Home'),
                    onTap: () {
                      _onItemTapped(0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.deepPurple,
                    ),
                    title: const Text('Product'),
                    onTap: () {
                      _onItemTapped(1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.save,
                      color: Colors.deepPurple,
                    ),
                    title: const Text('Cart'),
                    onTap: () {
                      _onItemTapped(2);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      bottomNavigationBar: (breakpoint.isMobile)
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 89, 34, 184),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.info),
                      label: 'Product',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.more),
                      label: 'Cart',
                    ),
                  ],
                  currentIndex: NavItem.selectedIndex,
                  backgroundColor: Colors.transparent,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Color.fromARGB(255, 188, 188, 188),
                  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  onTap: _onItemTapped,
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: NavItem.widgetOptions.elementAt(NavItem.selectedIndex),
      ),
    );
  }
}
