import 'package:flutter/material.dart';
import 'package:parking_demo/Booking/detailUser.dart';

import 'package:parking_demo/pahossSearching/pahossmapScreen.dart';

import 'package:parking_demo/userprofile/userScreen.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with UserHomeScreen.
class _MyStatefulWidgetState extends State<UserHomeScreen> {
  int _selectedIndex = 0;
  var _widgetOptions = [
    UserScreen(),
    GoogleMapping(),

    // Screens(),
    DetailUser(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Gmap Searching',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'Screen',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
