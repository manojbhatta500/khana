import 'package:flutter/material.dart';
import 'package:khana/screens/chosescreen.dart';
import 'package:khana/screens/fav.dart';

class Tabscreen extends StatefulWidget {
  Tabscreen({super.key});

  @override
  State<Tabscreen> createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ChooseScreen(),
    Fav(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dinner_dining),
            label: 'Dish',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        backgroundColor: Colors.black.withOpacity(0.6),
      ),
    );
  }
}
